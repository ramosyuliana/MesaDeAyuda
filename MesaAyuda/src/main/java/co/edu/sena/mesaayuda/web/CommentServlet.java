/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.CommentCreateDTO;
import co.edu.sena.mesaayuda.dto.CommentDTO;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.CommentService;
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
@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CommentService commentService = (CommentService) getServletContext().getAttribute(AppContextListener.COMMENT_SERVICE);

        if ("create".equals(action)) {
            HttpSession session = request.getSession(false);
            User usuarioActual = (User) session.getAttribute("user");

            try {
                int idTicket = Integer.parseInt(request.getParameter("idTicket"));
                String text = request.getParameter("text");

                CommentCreateDTO commentDTO = new CommentCreateDTO();
                commentDTO.setIdTicket(idTicket);
                commentDTO.setIdAuthor(usuarioActual.getId());
                commentDTO.setText(text);
                
                commentService.MtCreateComment(commentDTO);
                
                 response.sendRedirect(request.getContextPath() + "/TicketServlet?action=tickets");
            }catch(Exception e){
                 request.setAttribute("errorMsg","No se pudo crear el comentario");
                 response.sendRedirect(request.getContextPath() + "/TicketServlet?action=tickets");
            }
        }
    }

}
