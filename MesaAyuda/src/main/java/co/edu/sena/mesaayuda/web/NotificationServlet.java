/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.dto.NotificationDTO;
import co.edu.sena.mesaayuda.model.Notification;
import co.edu.sena.mesaayuda.model.User;
import co.edu.sena.mesaayuda.service.s.NotificationService;
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
@WebServlet(name = "NotificationServlet", urlPatterns = {"/NotificationServlet"})
public class NotificationServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        NotificationService notificationService = (NotificationService) getServletContext().getAttribute(AppContextListener.NOTIFICATION_SERVICE);

        try {
            if (action.equals("notifications")) {

                HttpSession session = req.getSession(false);
                if (session == null || session.getAttribute("user") == null) {
                    resp.sendRedirect(req.getContextPath() + "/index.jsp");
                    return;
                }

                User oUser = (User) session.getAttribute("user");
                List<NotificationDTO> list = notificationService.MtListForAddresse(oUser.getId());
                int unread = notificationService.MtCountUnread(oUser.getId());
                req.setAttribute("notifications", list);
                req.setAttribute("unread", unread);

                req.getRequestDispatcher("/WEB-INF/Views/Notifications/Notificator.jsp").forward(req, resp);

            }
        } catch (Exception e) {
            req.setAttribute("errorMsg", e.getMessage());
            req.getRequestDispatcher("/WEB-INF/Views/Notifications/Notificator.jsp").forward(req, resp);

        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String action = req.getParameter("action");

        NotificationService notificationService = (NotificationService) getServletContext().getAttribute(AppContextListener.NOTIFICATION_SERVICE);

        try {
            if (action.equals("markAsRead")) {

                int idNotification = Integer.parseInt(req.getParameter("id"));

                notificationService.MtMarkAsRead(idNotification);
            }

            resp.sendRedirect(req.getContextPath() + "/NotificationServlet?action=notifications&exito=true");
        } catch (Exception e) {
            req.setAttribute("errorMsg", "No se pudo marcar la notificación como leída.");

        }

    }

}
