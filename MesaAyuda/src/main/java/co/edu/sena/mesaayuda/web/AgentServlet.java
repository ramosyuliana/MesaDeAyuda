/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.TicketService;
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
 * @author julil
 */
@WebServlet(name = "AgentServlet", urlPatterns = {"/AgentServlet"})
public class AgentServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        TicketService ticketService = (TicketService) getServletContext().getAttribute(AppContextListener.TICKET_SERVICE);
        if (action.equals("dashboard")) {

            HttpSession session = req.getSession(false);

            if (session != null) {
                User oUser = (User) session.getAttribute("user");

                List<TicketDTO> list = ticketService.MtListByAgent(oUser.getId());
                req.setAttribute("name", oUser.getName());
                req.setAttribute("myTickets", list);
                req.getRequestDispatcher("/WEB-INF/Views/Agent/Dashboard.jsp").forward(req, resp);

            }
        }
    }

}
