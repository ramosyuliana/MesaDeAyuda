/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.ChatRealTimeDTO;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.ChatRealTimeService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
public class ChatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ChatRealTimeService chatService = (ChatRealTimeService) getServletContext().getAttribute(AppContextListener.CHAT_SERVICE);

        HttpSession session = request.getSession(false);
        User usuarioActual = (session != null) ? (User) session.getAttribute("user") : null;

        if (usuarioActual == null) {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
            return;
        }
        if ("view".equals(action)) {
            try {
                int idTicket = Integer.parseInt(request.getParameter("idTicket"));

                List<ChatRealTimeDTO> chatHistory = chatService.MtListByTicket(idTicket);

                request.setAttribute("idTicket", idTicket);
                request.setAttribute("chatHistory", chatHistory);
                request.getRequestDispatcher("/WEB-INF/Views/Applicant/Chat.jsp").forward(request, response);

            } catch (Exception e) {
                response.sendRedirect(request.getContextPath() + "/TicketServlet?action=tickets");
            }
        }
    }
}
