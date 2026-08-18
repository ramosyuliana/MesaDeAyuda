<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html class="h-full" lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Dashboard Agente | Mesa Ayuda CIMM</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&family=Manrope:wght@600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                --bg-page: #eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));
                --on-surface: #1e293b;
                --on-surface-labels: #334155;
                --on-surface-variant: #51607a;
                --on-surface-muted: #6b7a97;
                --hairline: rgba(148,163,184,.25);
                --link: #3b82f6;
                --link-hover: #2563eb;
                --gradient-accent: linear-gradient(90deg, #38bdf8, #6366f1);
                --card-bg: rgba(255,255,255,.6);
                --card-bg-strong: rgba(255,255,255,.72);
                --card-border: rgba(148,163,184,.25);
                --card-blur: blur(10px);
                --input-bg: rgba(255,255,255,.5);
                --input-border: #d7dfec;
                --input-focus-bg: rgba(255,255,255,.9);
                --input-focus-border: #3b82f6;
                --shadow-rest: 0 4px 20px rgba(30,41,59,0.06);
                --radius-lg: 0.875rem;
                --radius-xl: 1.25rem;
                --radius-full: 9999px;
                --sp-md: 24px;
                --sp-xl: 80px;
                --sp-gutter: 24px;
                --container-max: 1280px;
                --t-fast: .2s cubic-bezier(.4,0,.2,1);
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
                overflow: hidden;
                display: flex;
                flex-direction: column;
                -webkit-font-smoothing: antialiased;
            }

            a {
                text-decoration: none;
                color: inherit;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
            }
            :focus-visible {
                outline: 2px solid var(--input-focus-border);
                outline-offset: 2px;
                border-radius: 6px;
            }
            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                user-select: none;
            }

            .glass-panel {
                background-color: var(--card-bg);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-rest);
            }

            .app-body {
                display: flex;
                flex: 1;
                overflow: hidden;
                height: 100vh;
            }

            main.content {
                flex: 1;
                overflow-y: auto;
                padding: var(--sp-md) var(--sp-gutter);
                position: relative;
                padding-top: 88px;
            }
            .content-inner {
                max-width: var(--container-max);
                margin: 0 auto;
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
                padding-bottom: var(--sp-xl);
            }

            .page-head h1 {
                margin: 0 0 8px;
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                font-size: 32px;
                color: var(--on-surface);
            }
            @media (min-width: 768px) {
                .page-head h1 {
                    font-size: 40px;
                }
            }
            .page-head p {
                margin: 0;
                font-size: 16px;
                color: var(--on-surface-variant);
            }

            .bento-grid {
                display: grid;
                grid-template-columns: 1fr;
                gap: var(--sp-md);
            }
            @media (min-width: 1024px) {
                .bento-grid {
                    grid-template-columns: 2fr 1fr;
                }
            }

            .articles-panel {
                border-radius: var(--radius-xl);
                overflow: hidden;
                display: flex;
                flex-direction: column;
                height: 500px;
                position: relative;
            }
            .articles-panel::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: var(--gradient-accent);
                z-index: 2;
            }
            .panel-head {
                padding: var(--sp-md);
                border-bottom: 1px solid var(--hairline);
                display: flex;
                justify-content: space-between;
                align-items: center;
                background: rgba(255,255,255,.25);
            }
            .panel-head h3 {
                margin: 0;
                font-family: 'Manrope', sans-serif;
                font-size: 24px;
                font-weight: 600;
                color: var(--on-surface);
            }
            .see-all-btn {
                color: var(--link);
                font-size: 14px;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: 4px;
                padding: 6px 10px;
                border-radius: var(--radius-full);
                transition: color var(--t-fast), background var(--t-fast);
            }
            .see-all-btn:hover {
                color: var(--link-hover);
                background: rgba(59,130,246,.08);
            }

            .table-scroll {
                flex: 1;
                overflow: auto;
            }
            thead {
                background: rgba(233,238,245,.75);
                position: sticky;
                top: 0;
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                z-index: 1;
            }
            th {
                padding: 16px;
                font-size: 12px;
                font-weight: 500;
                color: var(--on-surface-labels);
                letter-spacing: .02em;
            }
            td {
                padding: 16px;
                border-top: 1px solid var(--hairline);
                font-size: 16px;
            }
            tbody tr {
                transition: background-color var(--t-fast);
                cursor: pointer;
            }
            tbody tr:hover {
                background: rgba(59,130,246,.06);
            }
            tbody tr.selected {
                background: rgba(59,130,246,.1);
            }

            .code-cell {
                color: var(--on-surface-muted);
                font-family: monospace;
                font-size: 14px;
            }
            .article-title {
                color: var(--on-surface);
                font-weight: 500;
                margin: 0;
            }

            .empty-state {
                padding: 60px 24px;
                text-align: center;
                color: var(--on-surface-muted);
            }

            .detail-col {
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
                height: 500px;
            }
            .detail-card {
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                flex-shrink: 0;
                background-color: var(--card-bg-strong);
            }
            .detail-top {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 16px;
            }
            .detail-eyebrow {
                font-family: monospace;
                font-size: 12px;
                color: var(--link);
                letter-spacing: .04em;
            }
            .detail-title {
                margin: 4px 0 0;
                font-family: 'Manrope', sans-serif;
                font-size: 22px;
                font-weight: 600;
                color: var(--on-surface);
            }

            .detail-meta {
                display: flex;
                flex-direction: column;
                gap: 12px;
                margin-bottom: 24px;
            }
            .detail-meta-row {
                display: flex;
                justify-content: space-between;
                align-items: center;
                font-size: 14px;
                border-bottom: 1px solid var(--hairline);
                padding-bottom: 8px;
            }
            .detail-meta-row span:first-child {
                color: var(--on-surface-variant);
            }
            .detail-meta-row span:last-child {
                color: var(--on-surface);
                font-weight: 500;
            }

            .action-btn {
                width: 100%;
                text-align: left;
                padding: 12px 16px;
                border-radius: var(--radius-lg);
                border: 1px solid var(--input-border);
                background: var(--input-bg);
                display: flex;
                align-items: center;
                justify-content: space-between;
                transition: border-color var(--t-fast), background var(--t-fast), transform var(--t-fast), box-shadow var(--t-fast);
            }
            .action-btn:hover {
                border-color: var(--input-focus-border);
                background: var(--input-focus-bg);
                transform: translateY(-2px);
                box-shadow: var(--shadow-rest);
            }
            .action-btn span.label {
                display: flex;
                align-items: center;
                gap: 8px;
                font-weight: 500;
                font-size: 14px;
                color: var(--on-surface-labels);
            }
        </style>
    </head>
    <body>

        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />

        <div class="app-body">
            <main class="content">
                <div class="content-inner">

                    <section class="page-head">
                        <div>
                            <h1>Hola, ${name}</h1>
                            <p>Esto es lo que tienes pendiente hoy.</p>
                        </div>
                    </section>

                    <div class="bento-grid">
                        <!-- Left Panel: Assigned Tickets Table -->
                        <section class="articles-panel glass-panel">
                            <div class="panel-head">
                                <h3>Mis Tickets Asignados</h3>
                                <a class="see-all-btn" href="${pageContext.request.contextPath}/TicketServlet?action=tickets">
                                    Ver todos <span class="material-symbols-outlined" style="font-size:16px">arrow_forward</span>
                                </a>
                            </div>
                            <div class="table-scroll">
                                <c:choose>
                                    <c:when test="${empty myTickets}">
                                        <div class="empty-state">
                                            <p>No tienes tickets asignados por ahora.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <table id="ticketsTable">
                                            <thead>
                                                <tr>
                                                    <th>Código</th>
                                                    <th>Título</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="item" items="${myTickets}" varStatus="loop" begin="0" end="3">
                                                    <tr class="${loop.first ? 'selected' : ''}"
                                                        data-id="${item.id}"
                                                        data-title="${item.title}"
                                                        data-category="${item.categoryName}"
                                                        data-priority="${item.priorityName}"
                                                        data-state="${item.state}"
                                                        data-applicant="${item.applicantName}"
                                                        data-expiration="${item.expirationDate}">
                                                        <td class="code-cell">TK-${item.id}</td>
                                                        <td>
                                                            <p class="article-title">${item.title}</p>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </section>

                        <!-- Right Panel: Ticket Detail Card -->
                        <section class="detail-col">
                            <div class="detail-card glass-panel" id="ticketDetail">
                                <c:choose>
                                    <c:when test="${empty myTickets}">
                                        <p style="font-size: 12px; color: var(--on-surface-muted); text-transform: uppercase; letter-spacing: 0.05em; margin: 0 0 12px;">Sin ticket seleccionado</p>
                                        <p style="color:var(--on-surface-muted); font-size:14px;">Cuando tengas tickets asignados, podrás ver el detalle aquí.</p>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail-top">
                                            <div>
                                                <span class="detail-eyebrow" id="detailCode">TK-${myTickets[0].id}</span>
                                                <h4 class="detail-title" id="detailTitle">${myTickets[0].title}</h4>
                                            </div>
                                        </div>

                                        <div class="detail-meta">
                                            <div class="detail-meta-row">
                                                <span>Categoría</span>
                                                <span id="detailCategory">${myTickets[0].categoryName}</span>
                                            </div>
                                            <div class="detail-meta-row">
                                                <span>Prioridad</span>
                                                <span id="detailPriority">${myTickets[0].priorityName}</span>
                                            </div>
                                            <div class="detail-meta-row">
                                                <span>Estado</span>
                                                <span id="detailState">${myTickets[0].state}</span>
                                            </div>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </section>
                    </div>

                </div>
            </main>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const rows = document.querySelectorAll('#ticketsTable tbody tr');
                rows.forEach(row => {
                    row.addEventListener('click', () => {
                        rows.forEach(r => r.classList.remove('selected'));
                        row.classList.add('selected');

                        const id = row.getAttribute('data-id');
                        const title = row.getAttribute('data-title');
                        const category = row.getAttribute('data-category');
                        const priority = row.getAttribute('data-priority');
                        const state = row.getAttribute('data-state');

                        document.getElementById('detailCode').textContent = 'TK-' + id;
                        document.getElementById('detailTitle').textContent = title;
                        document.getElementById('detailCategory').textContent = category;
                        document.getElementById('detailPriority').textContent = priority;
                        document.getElementById('detailState').textContent = state;

                        const detailLink = document.getElementById('detailLink');
                        if (detailLink) {
                            detailLink.href = '${pageContext.request.contextPath}/TicketServlet?action=view&id=' + id;
                        }
                    });
                });
            });
        </script>
    </body>
</html>