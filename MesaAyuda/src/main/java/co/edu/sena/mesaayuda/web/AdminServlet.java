/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.AgentCreateDTO;
import co.edu.sena.mesaayuda.dto.CategoryDTO;
import co.edu.sena.mesaayuda.dto.RoleDTO;
import co.edu.sena.mesaayuda.dto.UserCreateDTO;
import co.edu.sena.mesaayuda.dto.UserDTO;
import co.edu.sena.mesaayuda.dto.UserUpdateDTO;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.*;

import co.edu.sena.mesaayuda.service.s.CategoryService;
import co.edu.sena.mesaayuda.service.s.TicketService;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "AdminServlet", urlPatterns = {"/AdminServlet"})
public class AdminServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        UserService userService = (UserService) getServletContext().getAttribute(AppContextListener.USER_SERVICE);
        RoleService roleService = (RoleService) getServletContext().getAttribute(AppContextListener.ROLE_SERVICE);
        CategoryService categoryService = (CategoryService) getServletContext().getAttribute(AppContextListener.CATEGORY_SERVICE);
        TicketService ticketService = (TicketService) getServletContext().getAttribute(AppContextListener.TICKET_SERVICE);

        if (action.equals("dashboard")) {

            HttpSession session = req.getSession(false); // false para no crear una nueva si no existe

            if (session != null) {
                User oUser = (User) session.getAttribute("user");
                req.setAttribute("name", oUser.getName());
            }

            double cancelado = ticketService.MtCanceledTicketRate();
            double resuelto = ticketService.MtResolvedTicketRate();
            Map<String, Integer> stateTickets = ticketService.MtCountTicketsForState();
            Map<Integer, Integer> assigned = ticketService.MtCountAgentWithoutAssignments();

            req.setAttribute("cancelledTickets", cancelado);
            req.setAttribute("resolvedTickets", resuelto);
            req.setAttribute("stateTickets", stateTickets);
            req.setAttribute("agents", assigned);

            req.getRequestDispatcher("/WEB-INF/Views/Admin/Dashboard.jsp").forward(req, resp);

        } else if (action.equals("manageUsers")) {

            try {
                List<UserDTO> list = userService.MtList();
                req.setAttribute("listUsers", list);

            } catch (Exception e) {
                req.setAttribute("errorMsg", e.getMessage());
            }
            req.getRequestDispatcher("/WEB-INF/Views/Admin/ManagementUsers.jsp").forward(req, resp);

        } else if (action.equals("manage")) {
            req.getRequestDispatcher("/WEB-INF/Views/Admin/ManagementTickets.jsp").forward(req, resp);

        } else if (action.equals("new")) {

            try {
                List<RoleDTO> list = roleService.MtListRoles();
                List<CategoryDTO> listCats = categoryService.MtListCategories();

                Integer idRoleAgent = null;
                for (RoleDTO r : list) {
                    if ("Agente".equalsIgnoreCase(r.getName())) { // Cambia "Agente" por el texto exacto que tenga tu BD (ej. "Agente de Soporte")
                        idRoleAgent = r.getId();
                        break;
                    }
                }

                req.setAttribute("listRoles", list);
                req.setAttribute("listCategories", listCats);
                req.setAttribute("idRole", idRoleAgent); // 2. Enviar el ID al JSP para que ${idRole} lo lea

            } catch (Exception e) {
                req.setAttribute("errorMsg", e.getMessage());
            }
            req.getRequestDispatcher("/WEB-INF/Views/Admin/CreateUser.jsp").forward(req, resp);

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        UserService userService = (UserService) getServletContext().getAttribute(AppContextListener.USER_SERVICE);
        AgentService agentService = (AgentService) getServletContext().getAttribute(AppContextListener.AGENT_SERVICE);

        try {
            if (action.equals("updateUser")) {

                UserUpdateDTO oUserUpdateDTO = new UserUpdateDTO(
                        Integer.parseInt(req.getParameter("id")),
                        req.getParameter("name"),
                        req.getParameter("email"));
                userService.MtEdit(oUserUpdateDTO);
                resp.sendRedirect(req.getContextPath() + "/AdminServlet?action=manageUsers&exito=trueupdate");

                return;

            } else if (action.equals("createUser")) {

                int idRole = Integer.parseInt(req.getParameter("idRole"));
                String fullName = req.getParameter("fullName");
                String email = req.getParameter("email");

                // Obtenemos las categorías seleccionadas por el Choices.js
                String[] idCategories = req.getParameterValues("idCategories");

                System.out.println("--- DEPURANDO CATEGORÍAS ---");
                if (idCategories == null) {
                    System.out.println("El arreglo idCategories llegó como: NULL");
                } else if (idCategories.length == 0) {
                    System.out.println("El arreglo idCategories llegó VACÍO (longitud 0)");
                } else {
                    System.out.println("Se recibieron " + idCategories.length + " categorías:");
                    for (String cat : idCategories) {
                        System.out.println(" - ID Categoría: " + cat);
                    }
                }
                System.out.println("----------------------------");

                if (idCategories != null && idCategories.length > 0) {
                    // Convertir el arreglo de String[] a List<Integer>
                    List<String> categoryIds = new ArrayList<>();
                    for (String catId : idCategories) {
                        categoryIds.add(catId);
                    }

                    AgentCreateDTO oAgentCreateDTO = new AgentCreateDTO(
                            fullName,
                            email,
                            idRole,
                            categoryIds);
                    agentService.MtCreate(oAgentCreateDTO);
                } else {
                    UserCreateDTO oUserCreateDTO = new UserCreateDTO(
                            fullName,
                            email,
                            idRole);
                    userService.MtCreate(oUserCreateDTO);

                }

                resp.sendRedirect(req.getContextPath() + "/AdminServlet?action=new&exito=truecreate");
                return;

            }
            resp.sendRedirect(req.getContextPath() + "/AdminServlet?action=manageUsers");

        } catch (Exception e) {

            req.setAttribute("errorMsg", e.getMessage());
            if (action.equals("createUser")) {
                req.getRequestDispatcher("/WEB-INF/Views/Admin/CreateUser.jsp").forward(req, resp);
            }

        }

    }

}
