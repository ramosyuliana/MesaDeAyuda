/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package co.edu.sena.mesaayuda.web;

import co.edu.sena.mesaayuda.repository.*;
import co.edu.sena.mesaayuda.service.assignment.*;
import co.edu.sena.mesaayuda.service.s.*;
import co.edu.sena.mesaayuda.service.sla.*;

import co.edu.sena.mesaayuda.service.notification.NotificationByEmail;
import co.edu.sena.mesaayuda.service.notification.NotificationBySms;
import co.edu.sena.mesaayuda.service.notification.NotificationInApp;
import co.edu.sena.mesaayuda.service.notification.Notificator;
import co.edu.sena.mesaayuda.service.notification.NotificatorComposite;
import java.util.Arrays;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 *
 * @author julil
 */
@WebListener
public class AppContextListener implements ServletContextListener {

    public static final String CATEGORY_SERVICE = "categoryService";
    public static final String COMMENT_SERVICE = "commentService";
    public static final String ROLE_SERVICE = "roleService";
    public static final String TICKET_SERVICE = "ticketService";
    public static final String USERAUTH_SERVICE = "userAuthService";
    public static final String USER_SERVICE = "userService";
    public static final String NOTIFICATION_SERVICE = "notificatioService";

    @Override
    public void contextInitialized(ServletContextEvent oEvent) {
        ServletContext oContext = oEvent.getServletContext();

        CategoryRepository categoryRepository = new CategoryRepositoryJdbc();
        CommentRepository commentRepository = new CommentRepositoryJdbc();
        NotificationRepository notificationRepository = new NotificationRepositoryJdbc();
        PriorityRepository priorityRepository = new PriorityRepositoryJdbc();
        RoleRepository roleRepository = new RoleRepositoryJdbc();
        TicketRepository ticketRepository = new TicketRepositoryJdbc();
        UserRepository userRepository = new UserRepositoryJdbc();

        StrategySLA strategySla = new StrategySLAStandard(priorityRepository);
        StrategyPriority strategyPriority = new StrategyPriorityByCategory(categoryRepository);
        StrategyAssignment strategyAssignment = new StrategyAssignmentByCategority(userRepository);
        StrategyAssignment strategyAssignmentReassign = new StrategyAssignmentForLessLoad(userRepository);

        Notificator oNotificator = new NotificatorComposite(Arrays.asList(
                new NotificationInApp(notificationRepository),
                new NotificationByEmail("julilo09123452@gmail.com"),
                new NotificationBySms()
        ));

        CategoryService categoryService = new CategoryServiceImpl(categoryRepository);
        CommentService commentService = new CommentServiceImpl(commentRepository);
        RoleService roleService = new RoleServiceImpl(roleRepository);
        TicketService ticketService = new TicketServiceImpl(ticketRepository, userRepository, categoryRepository, strategySla, strategyAssignment,strategyAssignmentReassign, strategyPriority, oNotificator);
        UserAuthService userAuthService = new UserAuthServiceImpl(userRepository);
        UserService userService = new UserServiceImpl(userRepository);

        oContext.setAttribute(CATEGORY_SERVICE, categoryService);
        oContext.setAttribute(COMMENT_SERVICE, commentService);
        oContext.setAttribute(ROLE_SERVICE, roleService);
        oContext.setAttribute(TICKET_SERVICE, ticketService);
        oContext.setAttribute(USERAUTH_SERVICE, userAuthService);
        oContext.setAttribute(USER_SERVICE, userService);

    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }

}
