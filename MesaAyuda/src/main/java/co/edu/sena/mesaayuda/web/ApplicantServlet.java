/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.TicketService;
import co.edu.sena.mesaayuda.service.s.UserService;
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
@WebServlet(name = "ApplicantServlet", urlPatterns = {"/ApplicantServlet"})
public class ApplicantServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        TicketService ticketService = (TicketService) getServletContext().getAttribute(AppContextListener.TICKET_SERVICE);

        if (action.equals("dashboard")) {

            HttpSession session = req.getSession(false);

            if (session != null) {
                User oUser = (User) session.getAttribute("user");
                req.setAttribute("name", oUser.getName());

                int newTickets = ticketService.MtCountAsignedTickets(oUser.getId());

                int closedTicket = ticketService.MtCountClosedTickets(oUser.getId());

                int unresolvedTicket = ticketService.MtCountUnresolvedTickets(oUser.getId());

                List<TicketDTO> list = ticketService.MtListTop5ByApplicant(oUser.getId());
                req.setAttribute("ticketsAsigned", newTickets);
                req.setAttribute("ticketsUnresolved", unresolvedTicket);
                req.setAttribute("ticketsClosed", closedTicket);
                req.setAttribute("list", list);

            }

            req.getRequestDispatcher("/WEB-INF/Views/Applicant/Dashboard.jsp").forward(req, resp);

        }
    }
}
