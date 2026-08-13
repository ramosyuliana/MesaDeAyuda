package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.CategoryDTO;
import co.edu.sena.mesaayuda.dto.TicketCreateDTO;
import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.CategoryService;
import co.edu.sena.mesaayuda.service.s.TicketService;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "TicketServlet", urlPatterns = {"/TicketServlet"})
public class TicketServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        CategoryService categoryService = (CategoryService) getServletContext().getAttribute(AppContextListener.CATEGORY_SERVICE);
        TicketService ticketService = (TicketService) getServletContext().getAttribute(AppContextListener.TICKET_SERVICE);

        if ("new".equals(action)) {
            try {
                List<CategoryDTO> listCategories = categoryService.MtListCategories();
                request.setAttribute("categories", listCategories);
            } catch (Exception e) {
                request.setAttribute("errorMsg", "No se pudieron cargar las categorías");
            }
            request.getRequestDispatcher("/WEB-INF/Views/Applicant/CreateTicket.jsp").forward(request, response);
        }
        else if("tickets".equals(action)){
            try{
            HttpSession session = request.getSession(false);
            User usuarioActual = (User)session.getAttribute("user");
            int id = usuarioActual.getId();
            List<TicketDTO> listTickets;
            if(usuarioActual.getRole().getName().equals("Agente")){
   
                listTickets = ticketService.MtListByAgent(id);
                request.setAttribute("tickets", listTickets);
                request.getRequestDispatcher("/WEB-INF/Views/Agent/Tickets.jsp").forward(request, response);
            }
            else if(usuarioActual.getRole().getName().equals("Solicitante")){
                listTickets = ticketService.MtListByApplicant(id);
                request.setAttribute("tickets", listTickets);
                request.getRequestDispatcher("/WEB-INF/Views/Applicant/Tickets.jsp").forward(request, response);
            }
            else{
                listTickets = ticketService.MtListAll();
                request.setAttribute("tickets", listTickets);
                request.getRequestDispatcher("/WEB-INF/Views/Applicant/Tickets.jsp").forward(request, response);
                
            }
            
            }catch(Exception e){
                request.setAttribute("errorMsg","No se puedieron cargar los tickets");
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        TicketService ticketService = (TicketService) getServletContext().getAttribute(AppContextListener.TICKET_SERVICE);
        CategoryService categoryService = (CategoryService) getServletContext().getAttribute(AppContextListener.CATEGORY_SERVICE);
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            HttpSession session = request.getSession(false);
            User usuarioActual = (session != null) ? (User) session.getAttribute("user") : null;

            if (usuarioActual == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }

            try {
                String title = request.getParameter("Title");
                String description = request.getParameter("Description");
                int idCategory = Integer.parseInt(request.getParameter("Category"));
                int idApplicant = usuarioActual.getId();

                TicketCreateDTO ticketDTO = new TicketCreateDTO();
                ticketDTO.setTitle(title);
                ticketDTO.setDescription(description);
                ticketDTO.setIdApplicant(idApplicant);
                ticketDTO.setIdCategory(idCategory);

                ticketService.MtCreateTicket(ticketDTO);

                response.sendRedirect(request.getContextPath() + "/TicketServlet?action=new");

            } catch (Exception e) {
                request.setAttribute("errorMsg", e.getMessage());

                request.getRequestDispatcher("/WEB-INF/Views/Applicant/CreateTicket.jsp").forward(request, response);
            }
        }
    }
}
