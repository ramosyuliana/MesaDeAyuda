<%-- 
    Document   : TicketsAgent
    Created on : 12/08/2026, 8:54:54 p. m.
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
        <title>Panel de Agente | Mesa CIMM</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Manrope:wght@600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                --bg-page: #eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));
                --on-surface: #1e293b;
                --on-surface-variant: #51607a;
                --on-surface-muted: #6b7a97;
                --on-surface-faint: #94a3b8;
                --on-surface-labels: #334155;
                --card-bg: rgba(255,255,255,.55);
                --card-bg-strong: rgba(255,255,255,.85);
                --card-border: rgba(148,163,184,.25);
                --card-blur: blur(10px);
                --hairline: rgba(215,223,236,.6);
                --border-soft: #d7dfec;
                --primary: #2563eb;
                --primary-container: #3b82f6;
                --secondary: #6366f1;
                --link: #3b82f6;
                --success: #059669;
                --error: #dc2626;
                --warning: #d97706;
                --gradient-accent: linear-gradient(135deg,#3b82f6,#6366f1);
                --gradient-button: linear-gradient(135deg,#3b82f6,#2563eb);
                --gradient-button-hover: linear-gradient(135deg,#2563eb,#1d4ed8);
                --input-bg: rgba(255,255,255,.6);
                --input-border: #d7dfec;
                --input-focus-bg: rgba(255,255,255,.9);
                --input-focus-border: #3b82f6;
                --shadow-rest: 0 4px 14px rgba(30,41,59,.08);
                --shadow-hover: 0 12px 28px rgba(30,41,59,.14);
                --radius-lg: 10px;
                --radius-xl: 16px;
                --radius-full: 999px;
                --sp-sm: 8px;
                --sp-md: 16px;
                --sp-xl: 40px;
                --sp-gutter: 24px;
                --container-max: 1200px;
                --t-fast: .15s ease;
                --t-base: .2s ease;
                --t-slow: .3s ease;
            }
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
                background: var(--bg-page);
                background-image: var(--bg-gradient);
                background-attachment: fixed;
                color: var(--on-surface);
                font-family: 'Inter', sans-serif;
                font-size: 16px;
                line-height: 1.6;
                min-height: 100vh;
                -webkit-font-smoothing: antialiased;
            }
            a {
                text-decoration: none;
                color: inherit;
            }
            button {
                font-family: inherit;
                cursor: pointer;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                vertical-align: middle;
            }
            .glass-panel {
                background-color: var(--card-bg);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-rest);
                border-radius: var(--radius-xl);
            }

            .page-container {
                max-width: var(--container-max);
                margin: 0 auto;
                padding: 40px var(--sp-gutter);
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
            }
            .page-head h1 {
                margin: 0 0 4px;
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                font-size: 30px;
                letter-spacing: -0.01em;
            }
            .page-head p {
                margin: 0;
                color: var(--on-surface-variant);
            }

            .stat-row {
                display: flex;
                flex-wrap: wrap;
                gap: var(--sp-sm);
                margin-top: var(--sp-md);
            }
            .stat-card {
                border-radius: var(--radius-xl);
                padding: 16px;
                display: flex;
                align-items: center;
                gap: 12px;
                min-width: 170px;
            }
            .stat-icon {
                padding: 8px;
                border-radius: var(--radius-lg);
                display: flex;
            }
            .stat-icon.blue {
                background: rgba(59,130,246,.1);
                color: var(--primary-container);
            }
            .stat-icon.violet {
                background: rgba(99,102,241,.1);
                color: var(--secondary);
            }
            .stat-label {
                margin: 0;
                font-size: 12px;
                color: var(--on-surface-muted);
            }
            .stat-value {
                margin: 0;
                font-size: 22px;
                font-weight: 700;
            }

            .cards-grid {
                display: grid;
                grid-template-columns: 1fr;
                gap: var(--sp-md);
                margin-top: var(--sp-md);
            }
            @media (min-width: 900px) {
                .cards-grid {
                    grid-template-columns: 1fr 1fr;
                }
            }

            .tag-badge {
                display: inline-flex;
                align-items: center;
                padding: 3px 10px;
                border-radius: var(--radius-full);
                font-size: 11px;
                font-weight: 600;
                white-space: nowrap;
            }
            .tag-blue {
                background: rgba(59,130,246,.12);
                color: var(--primary);
            }
            .tag-violet {
                background: rgba(99,102,241,.12);
                color: var(--secondary);
            }
            .tag-warning {
                background: rgba(217,119,6,.12);
                color: var(--warning);
            }
            .tag-success {
                background: rgba(5,150,105,.12);
                color: var(--success);
            }
            .tag-error {
                background: rgba(220,38,38,.12);
                color: var(--error);
            }
            .tag-neutral {
                background: rgba(107,122,151,.12);
                color: var(--on-surface-muted);
            }

            .detail-col {
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
            }
            .detail-card {
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                background-color: var(--card-bg-strong);
                border: 1px solid var(--card-border);
            }
            .detail-top {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 12px;
            }
            .detail-eyebrow {
                font-family: monospace;
                font-size: 11px;
                color: var(--link);
                letter-spacing: .04em;
            }
            .detail-title {
                margin: 2px 0 0;
                font-family: 'Manrope', sans-serif;
                font-size: 18px;
                font-weight: 600;
            }
            .detail-desc {
                font-size: 13px;
                color: var(--on-surface-variant);
                line-height: 1.5;
                margin: 8px 0 16px;
            }

            .detail-meta {
                display: flex;
                flex-direction: column;
                gap: 8px;
                margin-bottom: 16px;
            }
            .detail-meta-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 13px;
                border-bottom: 1px solid var(--hairline);
                padding-bottom: 6px;
            }
            .detail-meta-row span:first-child {
                color: var(--on-surface-variant);
            }
            .detail-meta-row span:last-child {
                color: var(--on-surface);
                font-weight: 500;
            }

            .comments-box {
                margin-bottom: 16px;
            }
            .comments-box p.comments-heading {
                margin: 0 0 8px;
                font-size: 12px;
                font-weight: 600;
                color: var(--on-surface-muted);
                text-transform: uppercase;
            }
            .mini-comment {
                display: flex;
                gap: 8px;
                padding: 8px 0;
                border-top: 1px solid var(--hairline);
            }
            .mini-comment:first-of-type {
                border-top: none;
            }
            .mini-avatar {
                width: 26px;
                height: 26px;
                border-radius: 50%;
                background: var(--gradient-button);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-weight: 600;
                font-size: 11px;
                flex-shrink: 0;
            }
            .mini-comment-body p.mini-author {
                margin: 0;
                font-weight: 600;
                font-size: 12px;
                color: var(--on-surface);
            }
            .mini-comment-body p.mini-date {
                margin: 0 0 2px;
                font-size: 10px;
                color: var(--on-surface-faint);
            }
            .mini-comment-body p.mini-text {
                margin: 0;
                font-size: 12px;
                color: var(--on-surface-variant);
            }
            .no-comments {
                font-size: 12px;
                color: var(--on-surface-faint);
                padding: 4px 0;
            }

            .workflow-box {
                background: rgba(255,255,255,.5);
                border: 1px solid var(--border-soft);
                border-radius: var(--radius-lg);
                padding: 12px;
                margin-bottom: 12px;
            }
            .workflow-box p {
                margin: 0 0 8px;
                font-size: 12px;
                font-weight: 600;
                color: var(--on-surface-muted);
                text-transform: uppercase;
            }
            .state-actions-grid {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 8px;
            }
            .action-state-btn {
                padding: 10px;
                border-radius: var(--radius-lg);
                font-size: 13px;
                font-weight: 500;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
                border: 1px solid var(--input-border);
                background: var(--input-bg);
                transition: all var(--t-fast);
                width: 100%;
            }
            .action-state-btn:hover {
                border-color: var(--input-focus-border);
                background: var(--input-focus-bg);
                transform: translateY(-1px);
            }
            .action-state-btn.primary-action {
                background: var(--gradient-button);
                color: #fff;
                border: none;
                grid-column: span 2;
                box-shadow: var(--shadow-rest);
            }
            .action-state-btn.primary-action:hover {
                background: var(--gradient-button-hover);
            }
            .action-state-btn.danger {
                color: var(--error);
            }
            form.inline-btn {
                margin: 0;
            }

            .empty-hint {
                text-align: center;
                color: var(--on-surface-muted);
                padding: 24px;
                font-size: 13px;
            }
            .alert {
                padding: 12px 16px;
                border-radius: var(--radius-lg);
                font-size: 14px;
                margin-bottom: 8px;
            }
            .alert-error {
                background: #fee2e2;
                color: #991b1b;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />
        <c:if test="${not empty errorMsg}">
            <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
                <strong>Error:</strong> ${errorMsg}
            </div>
        </c:if>
        <main class="page-container">

            <div class="page-head">
                <h1>Gestión y Ciclo de Tickets</h1>


            </div>


            <div class="cards-grid">
                <c:forEach var="t" items="${tickets}">
                    <div class="detail-card">
                        <div class="detail-top">
                            <div>
                                <span class="detail-eyebrow">TCK-${t.id}</span>
                                <h4 class="detail-title">${t.title}</h4>
                            </div>
                            <span class="tag-badge tag-blue">${t.state}</span>
                        </div>

                        <p class="detail-desc">${t.description}</p>

                        <div class="detail-meta">
                            <div class="detail-meta-row"><span>Categoría</span><span>${t.categoryName}</span></div>
                            <div class="detail-meta-row"><span>Prioridad / SLA</span><span>${t.priorityName} — vence ${t.expirationDate}</span></div>
                            <div class="detail-meta-row"><span>Solicitante</span><span>${t.applicantName}</span></div>
                            <div class="detail-meta-row"><span>Creado</span><span>${t.createDate}</span></div>
                        </div>

                        <div class="comments-box">
                            <p class="comments-heading">Comentarios (${fn:length(t.comments)})</p>
                            <c:choose>
                                <c:when test="${empty t.comments}">
                                    <p class="no-comments">Aún no hay comentarios en este ticket.</p>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="c" items="${t.comments}">
                                        <div class="mini-comment">
                                            <div class="mini-avatar-icon">
                                                <span class="material-symbols-outlined">person</span>
                                            </div>
                                            <div class="mini-comment-body">

                                                <p class="mini-date">${c.date}</p>
                                                <p class="mini-text">${c.text}</p>
                                            </div>
                                        </div>
                                    </c:forEach>

                                </c:otherwise>
                            </c:choose>


                        </div>

                        <div class="workflow-box">

                            <div class="state-actions-grid">

                                <c:if test="${t.state == 'ASIGNADO'}">
                                    <form class="inline-btn" action="${pageContext.request.contextPath}/TicketServlet" method="post" style="grid-column: span 2;">
                                        <input type="hidden" name="action" value="editState"/>
                                        <input type="hidden" name="idTicket" value="${t.id}"/>
                                        <input type="hidden" name="stateAction" value="ENPROCESO"/>
                                        <button class="action-state-btn primary-action" type="submit">
                                            <span class="material-symbols-outlined">play_arrow</span> Iniciar atención
                                        </button>
                                    </form>
                                </c:if>

                                <c:if test="${t.state == 'ENPROCESO'}">
                                    <form class="inline-btn" action="${pageContext.request.contextPath}/TicketServlet" method="post" style="grid-column: span 2;">
                                        <input type="hidden" name="action" value="editState"/>
                                        <input type="hidden" name="idTicket" value="${t.id}"/>
                                        <input type="hidden" name="stateAction" value="RESOLVER"/>
                                        <button class="action-state-btn primary-action" type="submit">
                                            <span class="material-symbols-outlined">check_circle</span> Resolver ticket
                                        </button>
                                    </form>
                                </c:if>

                                <c:if test="${t.state == 'RESUELTO'}">
                                    <form class="inline-btn" action="${pageContext.request.contextPath}/TicketServlet" method="post" style="grid-column: span 2;">
                                        <input type="hidden" name="action" value="editState"/>
                                        <input type="hidden" name="idTicket" value="${t.id}"/>
                                        <input type="hidden" name="stateAction" value="CERRAR"/>
                                        <button class="action-state-btn primary-action" type="submit">
                                            <span class="material-symbols-outlined">check_circle</span> Cerrar ticket
                                        </button>
                                    </form>
                                </c:if>

                                <c:if test="${t.state != 'CERRADO' && t.state != 'CANCELADO' && t.state != 'RESUELTO'}">
                                    <form class="inline-btn" action="${pageContext.request.contextPath}/TicketServlet" method="post" style="grid-column: span 2;">
                                        <input type="hidden" name="action" value="editState"/>
                                        <input type="hidden" name="idTicket" value="${t.id}"/>
                                        <input type="hidden" name="stateAction" value="CANCELAR"/>
                                        <button class="action-state-btn danger" type="submit">
                                            <span class="material-symbols-outlined">cancel</span> Cancelar
                                        </button>
                                    </form>


                                </c:if>

                                <c:if test="${t.state == 'CERRADO' || t.state == 'CANCELADO'}">
                                    <span class="tag-badge tag-neutral" style="grid-column: span 2; justify-content:center; padding:10px;">
                                        Sin acciones disponibles
                                    </span>
                                </c:if>

                            </div>
                        </div>

                        <form action="${pageContext.request.contextPath}/CommentServlet?action=create" method="post" style="display:flex; gap:8px;">
                            <input type="hidden" name="idTicket" value="${t.id}"/>
                            <input type="text" name="text" placeholder="Escribe un comentario técnico..."
                                   style="flex:1; padding:10px 12px; border-radius: var(--radius-lg); background: var(--input-bg); border:1px solid var(--input-border); font-size:13px; outline:none;"/>
                            <button title="Enviar comentario" type="submit" style="color: var(--primary);">
                                <span class="material-symbols-outlined">send</span>
                            </button>
                        </form>
                    </div>
                </c:forEach>

                <!-- Estado vacío de ejemplo (cuando no hay tickets asignados)
                <div class="detail-card">
                    <p class="empty-hint" style="padding:0;">Sin tickets activos para mostrar acciones.</p>
                </div>
                -->
            </div>

        </main>
    </body>
</html>