/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

/**
 *
 * @author Admin
 */


import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.OtpService;
import java.io.IOException;
import java.net.URLEncoder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "OtpServlet", urlPatterns = {"/OtpServlet"})
public class OtpServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        OtpService otpService = (OtpService) getServletContext().getAttribute(AppContextListener.OTP_SERVICE);

        if ("request".equals(action)) {
            HttpSession session = request.getSession(false);
            User usuarioActual = (session != null) ? (User) session.getAttribute("user") : null;

            if (usuarioActual == null) {
                response.sendRedirect(request.getContextPath() + "/index.jsp");
                return;
            }

            int idTicket = -1;
            try {
                idTicket = Integer.parseInt(request.getParameter("idTicket"));
                otpService.MtGenerateAndSend(idTicket, usuarioActual.getId());
                response.sendRedirect(request.getContextPath()
                        + "/TicketServlet?action=view&id=" + idTicket + "&otpSent=true");
            } catch (Exception e) {
                String msg = URLEncoder.encode("No se pudo enviar el código: " + e.getMessage(), "UTF-8");
                String redirectUrl = request.getContextPath() + "/TicketServlet?action=view";
                if (idTicket != -1) redirectUrl += "&id=" + idTicket;
                response.sendRedirect(redirectUrl + "&otpError=" + msg);
            }
        }
    }
}
