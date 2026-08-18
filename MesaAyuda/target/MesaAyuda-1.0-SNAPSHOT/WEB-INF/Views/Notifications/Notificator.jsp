<%-- 
    Document   : Notificator
    Created on : 14/08/2026, 2:11:02 p. m.
    Author     : julil
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Notificaciones | Mesa CIMM</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Manrope:wght@600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                --bg-page:#eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));
                --on-surface:#1e293b;
                --on-surface-variant:#51607a;
                --on-surface-muted:#6b7a97;
                --on-surface-faint:#94a3b8;
                --card-bg: rgba(255,255,255,.6);
                --card-bg-strong: rgba(255,255,255,.85);
                --card-border: rgba(148,163,184,.25);
                --hairline: rgba(215,223,236,.6);
                --primary:#3b82f6;
                --primary-container:#3b82f6;
                --error:#dc2626;
                --success:#059669;
                --gradient-button: linear-gradient(135deg,#3b82f6,#2563eb);
                --gradient-button-hover: linear-gradient(135deg,#2563eb,#1d4ed8);
                --radius-lg:10px;
                --radius-xl:18px;
                --radius-full:999px;
            }
            * {
                box-sizing:border-box;
                margin:0;
                padding:0;
            }
            body {
                font-family:'Inter', sans-serif;
                background:var(--bg-page);
                background-image:var(--bg-gradient);
                background-attachment:fixed;
                min-height:100vh;
                color:var(--on-surface-variant);
            }
            a {
                text-decoration:none;
                color:inherit;
            }
            button {
                font-family:inherit;
                cursor:pointer;
            }
            .material-symbols-outlined {
                vertical-align: middle;
            }

            header.topbar {
                position: fixed;
                top:0;
                left:0;
                right:0;
                z-index:50;
                height:64px;
                display:flex;
                align-items:center;
                padding:0 24px;
                background-color: rgba(255,255,255,.8);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border-bottom:1px solid var(--card-border);
            }
            header.topbar::after {
                content:'';
                position:absolute;
                left:0;
                right:0;
                bottom:-1px;
                height:2px;
                background: linear-gradient(90deg,#38bdf8,#6366f1);
                opacity:.75;
            }
            .brand {
                display:flex;
                align-items:center;
                gap:8px;
            }
            .brand .material-symbols-outlined {
                color:#3b82f6;
                font-size:28px;
            }
            .brand span.name {
                font-family:'Manrope', sans-serif;
                font-weight:700;
                font-size:18px;
                background: linear-gradient(90deg,#38bdf8,#6366f1);
                -webkit-background-clip:text;
                background-clip:text;
                color:transparent;
            }

            .page-container {
                max-width: 760px;
                margin: 0 auto;
                padding: 100px 24px 48px;
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            .page-head {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 8px;
                animation: fadeInUp .4s ease both;
            }
            .page-head h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 28px;
                font-weight: 700;
                color: var(--on-surface);
            }
            .page-head p {
                font-size: 14px;
                color: var(--on-surface-variant);
                margin-top: 4px;
            }
            .unread-badge {
                display: inline-flex;
                align-items: center;
                padding: 4px 12px;
                border-radius: var(--radius-full);
                background: rgba(59,130,246,.12);
                color: var(--primary);
                font-size: 13px;
                font-weight: 600;
                white-space: nowrap;
                transition: background .2s ease, color .2s ease;
            }
            .unread-badge.all-caught-up {
                background: rgba(5,150,105,.12);
                color: var(--success);
            }

            .list-panel {
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border: 1px solid var(--card-border);
                border-radius: var(--radius-xl);
                box-shadow: 0 10px 30px -5px rgba(30,41,59,.06);
                overflow: hidden;
                animation: fadeInUp .4s ease .05s both;
            }

            .notification-item {
                display: flex;
                gap: 14px;
                padding: 18px 24px;
                border-bottom: 1px solid var(--hairline);
                position: relative;
                transition: background .2s ease, opacity .3s ease;
                opacity: 0;
                animation: fadeInUp .35s ease forwards;
            }
            .notification-item:last-child {
                border-bottom: none;
            }
            .notification-item.unread {
                background: rgba(59,130,246,.05);
            }
            .notification-item:hover {
                background: rgba(59,130,246,.08);
            }
            .notification-item.marking-read {
                opacity: .5;
                pointer-events: none;
            }

            .notif-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                flex-shrink: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                background: var(--gradient-button);
                color: #fff;
            }
            .notification-item.unread .notif-icon {
                box-shadow: 0 0 0 3px rgba(59,130,246,.18);
            }

            .notif-body {
                flex: 1;
                min-width: 0;
            }
            .notif-subject {
                font-size: 14px;
                font-weight: 600;
                color: var(--on-surface);
                margin-bottom: 2px;
            }
            .notif-message {
                font-size: 13px;
                color: var(--on-surface-variant);
                line-height: 1.5;
            }
            .notif-footer {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-top: 10px;
                gap: 12px;
                flex-wrap: wrap;
            }
            .notif-date {
                font-size: 11px;
                color: var(--on-surface-faint);
                white-space: nowrap;
            }
            .notif-actions {
                display: flex;
                gap: 12px;
                align-items: center;
            }
            .notif-link {
                font-size: 12px;
                font-weight: 600;
                color: var(--primary);
            }
            .notif-link:hover {
                text-decoration: underline;
            }
            .btn-mark-read {
                font-size: 12px;
                font-weight: 500;
                color: var(--on-surface-muted);
                border: 1px solid var(--card-border);
                padding: 4px 10px;
                border-radius: 6px;
                background: rgba(255,255,255,.5);
                transition: all .15s ease;
            }
            .btn-mark-read:hover {
                border-color: var(--primary);
                color: var(--primary);
            }
            .btn-mark-read:disabled {
                opacity: .6;
                cursor: default;
            }

            .unread-dot {
                position: absolute;
                top: 20px;
                right: 24px;
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: var(--error);
                transition: opacity .25s ease, transform .25s ease;
            }

            .empty-state {
                padding: 60px 24px;
                text-align: center;
                color: var(--on-surface-muted);
                animation: fadeInUp .4s ease .05s both;
            }
            .empty-state .material-symbols-outlined {
                font-size: 40px;
                opacity: .5;
                margin-bottom: 8px;
                display: block;
            }

            .back-link {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                color: var(--on-surface-variant);
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 8px;
                transition: color .15s ease, transform .15s ease;
                animation: fadeInUp .35s ease both;
            }
            .back-link:hover {
                color: var(--primary);
                transform: translateX(-2px);
            }

            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            @media (prefers-reduced-motion: reduce) {
                *, *::before, *::after {
                    animation-duration: .001ms !important;
                }
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />

        <main class="page-container">

            <a class="back-link" href="${pageContext.request.contextPath}/ApplicantServlet?action=dashboard">
                <span class="material-symbols-outlined" style="font-size:18px;">arrow_back</span> Volver
            </a>

            <div class="page-head">
                <div>
                    <h1>Notificaciones</h1>
                    <p>Actualizaciones sobre tus tickets</p>
                </div>

                <c:choose>
                    <c:when test="${unread > 0}">
                        <span class="unread-badge">${unread} sin leer</span>
                    </c:when>
                    <c:otherwise>
                        <span class="unread-badge all-caught-up">Todo al día wey</span>
                    </c:otherwise>
                </c:choose>
            </div>

            <c:choose>
                <c:when test="${empty notifications}">
                    <div class="list-panel">
                        <div class="empty-state">
                            <span class="material-symbols-outlined">notifications_off</span>
                            <p>No tienes notificaciones todavía.</p>
                        </div>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="list-panel">
                        <c:forEach var="item" items="${notifications}" varStatus="loop">
                            <div class="notification-item ${item.read ? '' : 'unread'}"
                                 id="notif-${item.id}"
                                 style="animation-delay: ${loop.index * 0.05}s;">
                                <div class="notif-icon">
                                    <span class="material-symbols-outlined" style="font-size:20px;">confirmation_number</span>
                                </div>
                                <div class="notif-body">
                                    <p class="notif-subject">${item.subject}</p>
                                    <p class="notif-message">${item.message}</p>
                                    <div class="notif-footer">
                                        <span class="notif-date">${item.sendDate}</span>
                                        <div class="notif-actions">
                                            <a class="notif-link" href="${pageContext.request.contextPath}/TicketServlet?action=view&id=${item.idTicket}">Ver ticket</a>
                                            <form action="NotificationServlet" method="POST">
                                                <input type="hidden" name="id" value="${item.id}">
                                                <c:if test="${not item.read}">
                                                    <input type="hidden" name="action" value="markAsRead">
                                                    <button class="btn-mark-read" type="submit">Marcar como leída</button>
                                                </c:if>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${not item.read}">
                                    <span class="unread-dot"></span>
                                </c:if>
                            </div>
                        </c:forEach>
                    </div>
                </c:otherwise>
            </c:choose>

        </main>


        <%
            String error = (String) request.getAttribute("errorMsg");
            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.error("¡Error!", "<%= error%>");
            });
        </script>
        <%}%>
    </body>
</html>
