/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;


import co.edu.sena.mesaayuda.dto.RoleDTO;
import co.edu.sena.mesaayuda.dto.UserCreateDTO;
import co.edu.sena.mesaayuda.dto.UserDTO;
import co.edu.sena.mesaayuda.dto.UserUpdateDTO;
import co.edu.sena.mesaayuda.service.s.RoleService;
import co.edu.sena.mesaayuda.service.s.UserService;

import co.edu.sena.mesaayuda.dto.TicketDTO;
import co.edu.sena.mesaayuda.model.Ticket;
import co.edu.sena.mesaayuda.service.s.TicketService;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

        if (action.equals("dashboard")) {
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
                req.setAttribute("listRoles", list);
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

                UserCreateDTO oUserCreateDTO = new UserCreateDTO(
                        req.getParameter("fullName"),
                        req.getParameter("email"),
                        Integer.parseInt(req.getParameter("idRole")));

                userService.MtCreate(oUserCreateDTO);
                resp.sendRedirect(req.getContextPath() + "/AdminServlet?action=new&exito=truecreate");
                return;

            }
            resp.sendRedirect(req.getContextPath() + "/AdminServlet?action=manageUsers");

        } catch (Exception e) {

            req.setAttribute("errorMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/Views/Admin/ManagementUsers.jsp").forward(req, resp);

        }

    }

}
