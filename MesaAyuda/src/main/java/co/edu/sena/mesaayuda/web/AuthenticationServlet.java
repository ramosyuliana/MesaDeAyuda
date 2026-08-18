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
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");

        if (action.equals("logout")) {

            HttpSession session = req.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            resp.sendRedirect("index.jsp");
        }
    }

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
            req.setAttribute("errorMsg", "Correo incorrecto");
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

        String contextPath = req.getContextPath();
        switch (oUser.getRole().getName()) {
            case "Administrador":
                resp.sendRedirect(contextPath + "/AdminServlet?action=dashboard");
                break;
            case "Solicitante":
                resp.sendRedirect(contextPath + "/ApplicantServlet?action=dashboard");
                break;
            case "Agente":
                resp.sendRedirect(contextPath + "/AgentServlet?action=dashboard");
                break;
            default:
                throw new ServletException("Rol no reconocido: " + oUser.getRole().getName());
        }


    }

}
