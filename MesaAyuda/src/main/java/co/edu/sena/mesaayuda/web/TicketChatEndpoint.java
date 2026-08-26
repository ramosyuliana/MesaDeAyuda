/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.model.ChatRealTime;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.ChatRealTimeRepository;
import co.edu.sena.mesaayuda.repository.ChatRealTimeRepositoryJdbc;
import co.edu.sena.mesaayuda.repository.UserRepository;
import co.edu.sena.mesaayuda.repository.UserRepositoryJdbc;
import java.io.StringReader;
import java.time.format.DateTimeFormatter;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import javax.json.Json;
import javax.json.JsonObject;
import javax.json.JsonReader;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

/**
 *
 * @author Admin
 */
@ServerEndpoint("/chat/{idTicket}")
public class TicketChatEndpoint {

    private final ChatRealTimeRepository chatRealTimeRepository = new ChatRealTimeRepositoryJdbc();
    private final UserRepository userRepository = new UserRepositoryJdbc();

    private static final Map<Integer, Map<String, Session>> sessionsByTicket = new ConcurrentHashMap<>();
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    @OnOpen
    public void onOpen(Session session, @PathParam("idTicket") int idTicket) {
        sessionsByTicket
                .computeIfAbsent(idTicket, k -> new ConcurrentHashMap<>())
                .put(session.getId(), session);
        System.out.println("Chat abierto - ticket " + idTicket + " - sesión " + session.getId());
    }

    @OnMessage
    public void onMessage(String messageJson, Session session, @PathParam("idTicket") int idTicket) {
        JsonReader reader = Json.createReader(new StringReader(messageJson));
        JsonObject json = reader.readObject();
        int idAuthor = json.getInt("idAuthor");
        String text = json.getString("text");
        reader.close();

        ChatRealTime message = new ChatRealTime(idTicket, idAuthor, text);
        chatRealTimeRepository.MtCreate(message);

        User author = userRepository.MtFindById(idAuthor);
        String authorName = author.getName();

        JsonObject response = Json.createObjectBuilder()
                .add("idAuthor", idAuthor)
                .add("authorName", authorName)
                .add("text", text)
                .add("date", message.getDate().format(FORMATTER))
                .build();

        String responseJson = response.toString();

        Map<String, Session> sessions = sessionsByTicket.get(idTicket);
        if (sessions != null) {
            for (Session s : sessions.values()) {
                try {
                    if (s.isOpen()) {
                        s.getBasicRemote().sendText(responseJson);
                    }
                } catch (Exception e) {
                    System.out.println("Error al enviar: " + e.getMessage());
                }
            }
        }

    }
    @OnClose
    public void onClose(Session session, @PathParam("idTicket") int idTicket) {
        Map<String, Session> sessions = sessionsByTicket.get(idTicket);
        if (sessions != null) {
            sessions.remove(session.getId());
            if (sessions.isEmpty()) sessionsByTicket.remove(idTicket);
        }
    }

    @OnError
    public void onError(Session session, Throwable throwable) {
        System.out.println("Error en WebSocket: " + throwable.getMessage());
    }
    

}
