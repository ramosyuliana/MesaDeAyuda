/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.service.s;

import co.edu.sena.mesaayuda.dto.ChatRealTimeDTO;
import co.edu.sena.mesaayuda.model.ChatRealTime;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.repository.ChatRealTimeRepository;
import co.edu.sena.mesaayuda.repository.UserRepository;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Admin
 */
public class ChatRealTimeServiceImpl implements ChatRealTimeService {

    private final ChatRealTimeRepository chatRepository;
    private final UserRepository userRepository;
    private static final DateTimeFormatter FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm");

    public ChatRealTimeServiceImpl(ChatRealTimeRepository chatRepository, UserRepository userRepository) {
        this.chatRepository = chatRepository;
        this.userRepository = userRepository;
    }

    @Override
    public List<ChatRealTimeDTO> MtListByTicket(int idTicket) {
        List<ChatRealTime> messages = chatRepository.MtListByTicket(idTicket);
        List<ChatRealTimeDTO> messagesDTO = new ArrayList<>();

        for (ChatRealTime m : messages) {
            User author = userRepository.MtFindById(m.getIdAuthor());
            messagesDTO.add(new ChatRealTimeDTO(
                    m.getIdAuthor(),
                    author.getName(),
                    m.getText(),
                    m.getDate().format(FORMATTER)
            ));
        }
        return messagesDTO;
    }

}
