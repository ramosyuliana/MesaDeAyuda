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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        UserAuthService userAuthService = (UserAuthService) getServletContext()
                .getAttribute(AppContextListener.USERAUTH_SERVICE);

        String email = req.getParameter("email");
        User oUser;

        try {
            oUser = userAuthService.MtAuthenticate(email);
        } catch (Exception e) {
            req.setAttribute("errorMsg", "Correo o contrasena incorrectos");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        if (oUser == null) {
            req.setAttribute("errorMsg", "Correo o contrasena incorrectos");
            req.getRequestDispatcher("/index.jsp").forward(req, resp);
            return;
        }

        HttpSession oSession = req.getSession(true);
        oSession.setAttribute("user", oUser);
        oSession.setMaxInactiveInterval(30 * 60);

        String vista;
        switch (oUser.getRole().getName()) {
            case "Administrador":
                vista = "/WEB-INF/Views/Admin/Dashboard.jsp";
                break;
            case "Solicitante":
                vista = "/WEB-INF/Views/Applicant/Dashboard.jsp";
                break;
            case "Agente":
                vista = "/WEB-INF/Views/Agent/Dashboard.jsp";
                break;
            default:
                throw new ServletException("Rol no reconocido: " + oUser.getRole().getName());
        }

        req.getRequestDispatcher(vista).forward(req, resp);
    }

}
