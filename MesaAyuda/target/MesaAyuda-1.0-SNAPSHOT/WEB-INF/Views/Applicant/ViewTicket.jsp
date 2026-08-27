<%-- 
    Document   : ViewTicket
    Created on : 13/08/2026, 1:59:53 p. m.
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Ticket #101 | Mesa CIMM</title>
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
                --border-color:#d7dfec;
                --primary:#3b82f6;
                --secondary:#6366f1;
                --success:#059669;
                --error:#dc2626;
                --warning:#d97706;
                --gradient-button: linear-gradient(135deg,#3b82f6,#2563eb);
                --gradient-button-hover: linear-gradient(135deg,#2563eb,#1d4ed8);
                --radius-lg:8px;
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
            .page-container {
                max-width:900px;
                margin:0 auto;
                padding:40px 24px;
                display:flex;
                flex-direction:column;
                gap:16px;
            }
            .back-link {
                display:inline-flex;
                align-items:center;
                gap:4px;
                color:var(--on-surface-variant);
                font-size:14px;
                font-weight:500;
            }
            .glass-card {
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border:1px solid var(--card-border);
                border-radius:var(--radius-xl);
                box-shadow:0 10px 30px -5px rgba(30,41,59,.06);
                padding:32px;
            }

            .head-row {
                display:flex;
                justify-content:space-between;
                align-items:flex-start;
                gap:16px;
                flex-wrap:wrap;
            }
            .head-row h1 {
                font-family:'Manrope', sans-serif;
                font-size:24px;
                font-weight:600;
                color:var(--on-surface);
                margin-bottom:4px;
            }
            .ticket-desc {
                margin-top:12px;
                color:var(--on-surface-variant);
                font-size:15px;
                line-height:1.6;
            }

            .tag-badge {
                display:inline-flex;
                align-items:center;
                padding:3px 10px;
                border-radius:var(--radius-full);
                font-size:11px;
                font-weight:600;
            }
            .tag-blue {
                background: rgba(59,130,246,.12);
                color:var(--primary);
            }
            .tag-violet {
                background: rgba(99,102,241,.12);
                color:var(--secondary);
            }
            .tag-warning {
                background: rgba(217,119,6,.12);
                color:var(--warning);
            }
            .tag-success {
                background: rgba(5,150,105,.12);
                color:var(--success);
            }
            .tag-error {
                background: rgba(220,38,38,.12);
                color:var(--error);
            }
            .tag-neutral {
                background: rgba(107,122,151,.12);
                color:var(--on-surface-muted);
            }

            .meta-grid {
                display:grid;
                grid-template-columns:repeat(auto-fit,minmax(150px,1fr));
                gap:12px;
                margin-top:20px;
            }
            .meta-item {
                border-top:1px solid var(--hairline);
                padding-top:8px;
            }
            .meta-item span.label {
                display:block;
                font-size:11px;
                text-transform:uppercase;
                color:var(--on-surface-faint);
                margin-bottom:2px;
            }
            .meta-item span.value {
                font-size:14px;
                font-weight:500;
                color:var(--on-surface);
            }

            .actions-row {
                display:flex;
                gap:10px;
                flex-wrap:wrap;
                margin-top:20px;
            }
            .btn {
                padding:9px 18px;
                border-radius:var(--radius-lg);
                font-size:13px;
                font-weight:600;
                border:1px solid var(--border-color);
                background: rgba(255,255,255,.5);
            }
            .btn:hover {
                border-color: var(--primary);
            }
            .btn-primary {
                background:var(--gradient-button);
                color:#fff;
                border:none;
            }
            .btn-primary:hover {
                background:var(--gradient-button-hover);
            }

            .comments-title {
                font-family:'Manrope', sans-serif;
                font-size:18px;
                font-weight:600;
                color:var(--on-surface);
                margin-bottom:12px;
            }
            .comment-item {
                display:flex;
                gap:12px;
                padding:14px 0;
                border-top:1px solid var(--hairline);
            }
            .comment-avatar {
                width:36px;
                height:36px;
                border-radius:50%;
                background:var(--gradient-button);
                color:#fff;
                display:flex;
                align-items:center;
                justify-content:center;
                font-weight:600;
                font-size:14px;
                flex-shrink:0;
            }
            .comment-body p.author {
                margin:0;
                font-weight:600;
                font-size:13px;
                color:var(--on-surface);
            }
            .comment-body p.date {
                margin:0 0 4px;
                font-size:11px;
                color:var(--on-surface-faint);
            }
            .comment-body p.text {
                margin:0;
                font-size:14px;
                color:var(--on-surface-variant);
            }

            .comment-form {
                display:flex;
                gap:8px;
                margin-top:16px;
            }
            .comment-form input {
                flex:1;
                padding:11px 14px;
                border-radius:var(--radius-full);
                border:1px solid var(--border-color);
                background: rgba(255,255,255,.6);
                font-size:14px;
                outline:none;
            }
            .comment-form input:focus {
                border-color:var(--primary);
                background:#fff;
            }
            .comment-form button {
                color:var(--primary);
                padding:8px;
                border-radius:50%;
                display:flex;
            }
            .comment-form button:hover {
                background: rgba(59,130,246,.1);
            }

            .empty-comments {
                text-align:center;
                color:var(--on-surface-faint);
                font-size:13px;
                padding:20px 0;
            }
            .alert-error {
                background:#fee2e2;
                color:#991b1b;
                padding:12px;
                border-radius:var(--radius-lg);
            }
            .otp-desc {
                font-size:13px;
                color:var(--on-surface-variant);
                margin-bottom:16px;
                line-height:1.5;
            }
            .otp-request-form {
                margin-bottom:16px;
            }
            .otp-confirm-form {
                display:flex;
                gap:8px;
            }
            .otp-confirm-form input {
                flex:1;
                padding:11px 14px;
                border-radius:var(--radius-lg);
                border:1px solid var(--border-color);
                background: rgba(255,255,255,.6);
                font-size:14px;
                letter-spacing:2px;
                outline:none;
            }
            .otp-confirm-form input:focus {
                border-color:var(--primary);
                background:#fff;
            }
            .alert-success {
                background:rgba(5,150,105,.12);
                color:var(--success);
                padding:12px;
                border-radius:var(--radius-lg);
                margin-bottom:12px;
                font-size:14px;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />
        <main class="page-container">
            <a class="back-link" href="${pageContext.request.contextPath}/TicketServlet?action=tickets">
                <span class="material-symbols-outlined" style="font-size:18px;">arrow_back</span> Volver a mis tickets
            </a>
            <div class="glass-card">
                <div class="head-row">
                    <div>
                        <span class="tag-badge tag-blue">TCK-${ticket.id}</span>
                        <h1 style="margin-top:8px;">${ticket.title}</h1>
                    </div>
                    <c:choose>
                        <c:when test="${ticket.state == 'NUEVO'}"><span class="tag-badge tag-neutral">NUEVO</span></c:when>
                        <c:when test="${ticket.state == 'ASIGNADO'}"><span class="tag-badge tag-blue">ASIGNADO</span></c:when>
                        <c:when test="${ticket.state == 'ENPROCESO'}"><span class="tag-badge tag-warning">EN_PROCESO</span></c:when>
                        <c:when test="${ticket.state == 'RESUELTO'}"><span class="tag-badge tag-success">RESUELTO</span></c:when>
                        <c:when test="${ticket.state == 'CERRADO'}"><span class="tag-badge tag-neutral">CERRADO</span></c:when>
                        <c:when test="${ticket.state == 'CANCELADO'}"><span class="tag-badge tag-error">CANCELADO</span></c:when>
                    </c:choose>
                </div>

                <p class="ticket-desc">${ticket.description}</p>

                <div class="meta-grid">
                    <div class="meta-item"><span class="label">Categoría</span><span class="value">${ticket.categoryName}</span></div>
                    <div class="meta-item"><span class="label">Prioridad</span><span class="value">${ticket.priorityName}</span></div>
                    <div class="meta-item"><span class="label">Agente</span><span class="value">${ticket.agentName}</span></div>
                    <div class="meta-item"><span class="label">Vence</span><span class="value">${ticket.expirationDate}</span></div>
                </div>

                <div class="actions-row">

                    <c:if test="${ticket.state == 'NUEVO' || ticket.state == 'ASIGNADO'}">
                        <a class="btn" href="${pageContext.request.contextPath}/TicketServlet?action=edit&id=${ticket.id}">
                            <span class="material-symbols-outlined" style="font-size:16px;">edit</span> Editar ticket
                        </a>
                    </c:if>
                    <c:if test="${ticket.state == 'CERRADO'}">
                        <form class="otp-confirm-form" action="${pageContext.request.contextPath}/TicketServlet" method="post">
                            <input type="hidden" name="action" value="editState"/>
                            <input type="hidden" name="idTicket" value="${ticket.id}"/>
                            <input type="hidden" name="stateAction" value="REABRIR"/>

                            <button class="btn btn-primary" type="submit">Reabrir</button>
                        </form>
                    </c:if>


                </div>
            </div>
            <c:if test="${ticket.state == 'RESUELTO'}">
                <div class="glass-card">
                    <p class="comments-title">Confirmar cierre del ticket</p>
                    <p class="otp-desc">
                        Por seguridad, para cerrar definitivamente este ticket necesitas un código de confirmación
                        que te enviaremos a tu correo (válido por 10 minutos).
                    </p>

                    <c:if test="${param.otpSent == 'true'}">
                        <div class="alert-success">Código enviado. Revisa tu correo electrónico.</div>
                    </c:if>

                    <form class="otp-request-form" action="${pageContext.request.contextPath}/OtpServlet" method="post">
                        <input type="hidden" name="action" value="request"/>
                        <input type="hidden" name="idTicket" value="${ticket.id}"/>
                        <button class="btn" type="submit">
                            <span class="material-symbols-outlined" style="font-size:16px;">mail</span> Solicitar código para cerrar
                        </button>
                    </form>

                    <form class="otp-confirm-form" action="${pageContext.request.contextPath}/TicketServlet" method="post">
                        <input type="hidden" name="action" value="editState"/>
                        <input type="hidden" name="idTicket" value="${ticket.id}"/>
                        <input type="hidden" name="stateAction" value="CERRAR"/>
                        <input type="text" name="otpCode" placeholder="Código de 6 dígitos" maxlength="6"
                               inputmode="numeric" pattern="[0-9]{6}" required/>
                        <button class="btn btn-primary" type="submit">Confirmar cierre</button>
                    </form>
                </div>
            </c:if>

            <div class="glass-card">
                <p class="comments-title">Comentarios (${fn:length(ticket.comments)})</p>


                <c:choose>
                    <c:when test="${empty ticket.comments}">
                        <div class="comment-item">
                            <p class="empty-comments">Aún no hay comentarios en este ticket.</p>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="c" items="${ticket.comments}">
                            <div class="comment-item">
                                <div class="comment-avatar"><span class="material-symbols-outlined">person</span></div>
                                <div class="comment-body">
                                    <p class="author">${c.nameAuthor}</p>
                                    <p class="date">${c.date}</p>
                                    <p class="text">${c.text}</p>
                                </div>
                            </div>
                        </c:forEach>

                    </c:otherwise>
                </c:choose>

            </div>

            <form class="comment-form" action="${pageContext.request.contextPath}/CommentServlet?action=create" method="post">
                <input type="hidden" name="idTicket" value="${ticket.id}"/>
                <input type="text" name="text" placeholder="Escribe un comentario..." required/>
                <button title="Enviar comentario" type="submit">
                    <span class="material-symbols-outlined">send</span>
                </button>
            </form>
            <div class="glass-card" style="display:flex; align-items:center; justify-content:space-between; gap:16px; flex-wrap:wrap;">
                <div>
                    <p class="comments-title" style="margin-bottom:4px;">Chat en vivo</p>
                    <p style="font-size:13px; color:var(--on-surface-variant);">Conversa en tiempo real con el agente asignado a este ticket.</p>
                </div>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/ChatServlet?action=view&idTicket=${ticket.id}" target="_blank">
                    <span class="material-symbols-outlined" style="font-size:16px;">chat</span> Abrir chat
                </a>
            </div>
            <%
                String error = (String) request.getAttribute("error");
                String success = (String) request.getAttribute("success");
                if (error != null && !error.isEmpty()) {
            %>
            <script>
                window.addEventListener('DOMContentLoaded', () => {
                    sweetAlert.error("¡Error!", "<%= error%>");
                });
            </script>
            <%
            } else if (success != null && !success.isEmpty()) {
            %>
            <script>
                window.addEventListener('DOMContentLoaded', () => {
                    sweetAlert.success("Éxito", "<%= success%>");
                });
            </script>
            <%
                }
            %>
    </body>
</html>

