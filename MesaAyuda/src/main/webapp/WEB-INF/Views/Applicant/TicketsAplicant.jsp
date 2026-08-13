<%-- 
    Document   : TicketsAplicant
    Created on : 13/08/2026, 12:00:41 p. m.
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Mis Tickets | Mesa CIMM</title>
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
            html, body {
                height: 100%;
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
                border: none;
                background: none;
                color: inherit;
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
            .is-liftable {
                transition: transform var(--t-slow), box-shadow var(--t-slow);
            }
            .is-liftable:hover {
                transform: translateY(-3px);
                box-shadow: var(--shadow-hover);
            }

            .page-container {
                max-width: var(--container-max);
                margin: 0 auto;
                padding: 40px var(--sp-gutter);
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
            }

            .page-head {
                display: flex;
                flex-direction: column;
                gap: 8px;
                justify-content: space-between;
                align-items: flex-start;
            }
            @media (min-width: 768px) {
                .page-head {
                    flex-direction: row;
                    align-items: flex-end;
                }
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

            .btn-new {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 10px 20px;
                border-radius: var(--radius-lg);
                background: var(--gradient-button);
                color: #fff;
                font-weight: 600;
                font-size: 14px;
                box-shadow: var(--shadow-rest);
                transition: all var(--t-fast);
            }
            .btn-new:hover {
                background: var(--gradient-button-hover);
                transform: translateY(-1px);
            }

            .table-panel {
                overflow: hidden;
            }
            .panel-head {
                padding: var(--sp-md);
                border-bottom: 1px solid var(--hairline);
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .panel-head h3 {
                margin: 0;
                font-family: 'Manrope', sans-serif;
                font-size: 18px;
                font-weight: 600;
            }
            .table-scroll {
                overflow-x: auto;
            }
            thead {
                background: rgba(233,238,245,.75);
            }
            th {
                padding: 12px 16px;
                font-size: 11px;
                font-weight: 600;
                color: var(--on-surface-labels);
                letter-spacing: .03em;
                text-transform: uppercase;
            }
            td {
                padding: 14px 16px;
                border-top: 1px solid var(--hairline);
                font-size: 14px;
                vertical-align: top;
            }
            tbody tr:hover {
                background: rgba(59,130,246,.05);
            }
            .code-cell {
                color: var(--on-surface-muted);
                font-family: monospace;
                font-size: 12px;
                font-weight: 600;
            }
            .ticket-title {
                color: var(--on-surface);
                font-weight: 500;
                margin: 0;
            }
            .ticket-desc {
                font-size: 12px;
                color: var(--on-surface-faint);
                margin: 2px 0 0;
                max-width: 320px;
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

            .btn-view {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                padding: 6px 12px;
                border-radius: var(--radius-lg);
                border: 1px solid var(--input-border);
                background: var(--input-bg);
                color: var(--primary);
                font-size: 12px;
                font-weight: 600;
                white-space: nowrap;
                transition: all var(--t-fast);
            }
            .btn-view:hover {
                border-color: var(--primary);
                background: var(--input-focus-bg);
            }

            .empty-state {
                padding: 48px 16px;
                text-align: center;
                color: var(--on-surface-muted);
            }
            .empty-state .material-symbols-outlined {
                font-size: 40px;
                opacity: .5;
                margin-bottom: 8px;
            }

            .alert {
                padding: 12px 16px;
                border-radius: var(--radius-lg);
                font-size: 14px;
            }
            .alert-error {
                background: #fee2e2;
                color: #991b1b;
            }
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />
        <main class="page-container">

            <div class="page-head">
                <div>
                    <h1>Mis Tickets</h1>
                    <p>Consulta el estado de tus solicitudes de soporte — CIMM Regional Boyacá</p>
                </div>
                <a class="btn-new" href="${pageContext.request.contextPath}/TicketServlet?action=new">
                    <span class="material-symbols-outlined" style="font-size:18px;">add</span>
                    Nuevo Ticket
                </a>
            </div>



            <div class="table-panel glass-panel">
                <div class="panel-head">
                    <h3>Historial de Solicitudes</h3>
                    <span class="tag-badge tag-blue">Rol: Solicitante</span>
                </div>
                <div class="table-scroll">
                    <table>
                        <thead>
                            <tr>
                                <th>Código</th>
                                <th>Título</th>
                                <th>Categoría</th>
                                <th>Agente</th>
                                <th>Estado</th>
                                <th>Prioridad</th>
                                <th>Vence</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="t" items="${tickets}"> 
                                <tr>
                                    <td class="code-cell">TCK-${t.id}</td>
                                    <td>
                                        <p class="ticket-title">${t.title}</p>
                                        <p class="ticket-desc">${t.description}</p>
                                    </td>
                                    <td><span class="tag-badge tag-blue">${t.categoryName}</span></td>
                                    <td>${t.agentName}</td>
                                    <c:if test="${t.state == 'ASIGNADO'}">
                                        <td><span class="tag-badge tag-neutral">ASIGNADO</span></td>
                                    </c:if>
                                    <c:if test="${t.state == 'ENPROCESO'}">
                                        <td><span class="tag-badge tag-warning">EN_PROCESO</span></td>
                                    </c:if>
                                    <c:if test="${t.state == 'CERRADO'}">
                                        <td><span class="tag-badge tag-neutral">CERRADO</span></td>
                                    </c:if>  
                                    <c:if test="${t.state == 'CANCELADO'}">
                                        <td><span class="tag-badge tag-error">CANCELADO</span></td>
                                    </c:if>  
                                    <c:if test="${t.state == 'RESUELTO'}">
                                        <td><span class="tag-badge tag-success">RESUELTO</span></td>
                                    </c:if> 


                                    <td><span class="tag-badge tag-violet">${t.priorityName}</span></td>
                                    <td>${t.expirationDate}</td>
                                    <td>
                                        <a class="btn-view" href="4-ticket-detalle-solicitante.html">
                                            <span class="material-symbols-outlined" style="font-size:14px;">visibility</span> Ver
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>



                    </table>

                    <!-- Estado vacío de ejemplo (oculto por defecto, usar cuando no hay tickets)
                    <div class="empty-state">
                        <span class="material-symbols-outlined">inbox</span>
                        <p>Aún no has creado ningún ticket.</p>
                    </div>
                    -->
                </div>
            </div>

        </main>
    </body>
</html>
