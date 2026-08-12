/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.UserAuthService;
import java.io.IOException;
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
@WebServlet(name = "AuthServlet", urlPatterns = {"/AuthServlet"})
public class AuthenticationServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        UserAuthService userAuthService = (UserAuthService) getServletContext().getAttribute(AppContextListener.USERAUTH_SERVICE);

        String action = req.getParameter("action");

        if (action.equals("ingresar")) {

            try {

                String email = req.getParameter("email");

                User oUser = userAuthService.MtAuthenticate(email);

                if (oUser != null) {
                    HttpSession oSession = req.getSession(true);
                    oSession.setAttribute("user", oUser);

                    switch (oUser.getRole().getName()) {
                        case "Administrador":
                            req.getRequestDispatcher("/WEB-INF/Views/Admin/Dashboard.jsp").forward(req, resp);
                            break;
                        case "Solicitante":
                            req.getRequestDispatcher("/WEB-INF/Views/Applicant/Dashboard.jsp").forward(req, resp);
                            break;
                        case "Agente":
                            req.getRequestDispatcher("/WEB-INF/Views/Agent/Dashboard.jsp").forward(req, resp);
                            break;
                        default:
                            throw new IllegalStateException(
                                    "Rol no reconocido: " + oUser.getRole().getName());
                    }
                }

            } catch (Exception e) {
                req.setAttribute("errorMsg", e.getMessage());
                req.getRequestDispatcher("index.jsp").forward(req, resp);

            }

        }

    }

}
