<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html class="h-full" lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Dashboard Agente | Mesa Ayuda CIMM</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Manrope:wght@600;700;800&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                --bg-page: #eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));
                --on-surface: #1e293b;
                --on-surface-labels: #334155;
                --on-surface-variant: #51607a;
                --on-surface-muted: #6b7a97;
                --on-surface-faint: #94a3b8;
                --hairline: rgba(148,163,184,.25);
                --link: #3b82f6;
                --link-hover: #2563eb;
                --primary: #2563eb;
                --gradient-accent: linear-gradient(90deg, #38bdf8, #6366f1);
                --gradient-button: linear-gradient(135deg, #3b82f6, #2563eb);
                --gradient-button-hover: linear-gradient(135deg, #2563eb, #1d4ed8);
                --card-bg: rgba(255,255,255,.6);
                --card-bg-strong: rgba(255,255,255,.72);
                --card-border: rgba(148,163,184,.25);
                --card-blur: blur(10px);
                --input-bg: rgba(255,255,255,.5);
                --input-border: #d7dfec;
                --input-focus-bg: rgba(255,255,255,.9);
                --input-focus-border: #3b82f6;
                --shadow-rest: 0 4px 20px rgba(30,41,59,0.06);
                --shadow-card: 0 20px 40px -12px rgba(30,41,59,0.15);
                --radius-lg: 0.875rem;
                --radius-xl: 1.25rem;
                --radius-full: 9999px;
                --sp-md: 24px;
                --sp-xl: 80px;
                --sp-gutter: 24px;
                --container-max: 1280px;
                --t-fast: .2s cubic-bezier(.4,0,.2,1);

                --icon-circle-bg: rgba(37,99,235,.1);
                --icon-circle-border: rgba(59,130,246,.25);

                --success: #16a34a;
                --warning: #d97706;
                --danger: #dc2626;

                --badge-danger-bg: rgba(220,38,38,.1);
                --badge-danger-text: #dc2626;
                --badge-danger-border: rgba(220,38,38,.25);

                --badge-warning-bg: rgba(217,119,6,.1);
                --badge-warning-text: #b45309;
                --badge-warning-border: rgba(217,119,6,.25);

                --badge-success-bg: rgba(22,163,74,.1);
                --badge-success-text: #15803d;
                --badge-success-border: rgba(22,163,74,.25);

                --badge-info-bg: rgba(37,99,235,.1);
                --badge-info-text: #2563eb;
                --badge-info-border: rgba(37,99,235,.25);
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

            /* ---------- Animaciones de entrada ---------- */
            @keyframes fade-down {
                from {
                    opacity: 0;
                    transform: translateY(-10px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @keyframes rise-in {
                from {
                    opacity: 0;
                    transform: translateY(16px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @keyframes card-in {
                from {
                    opacity: 0;
                    transform: translateY(12px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @keyframes pulse-dot {
                0% {
                    box-shadow: 0 0 0 0 rgba(22,163,74,.5);
                }
                70% {
                    box-shadow: 0 0 0 8px rgba(22,163,74,0);
                }
                100% {
                    box-shadow: 0 0 0 0 rgba(22,163,74,0);
                }
            }
            @keyframes spin {
                from {
                    transform: rotate(0deg);
                }
                to {
                    transform: rotate(360deg);
                }
            }

            /* ---------- Encabezado de la página ---------- */
            .page-head {
                display: flex;
                flex-direction: column;
                gap: 14px;
                opacity: 0;
                animation: fade-down .5s ease forwards;
            }
            @media (min-width: 768px) {
                .page-head {
                    flex-direction: row;
                    align-items: flex-end;
                    justify-content: space-between;
                }
            }
            .page-head-badge {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                width: fit-content;
                padding: 5px 12px;
                border-radius: var(--radius-full);
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
                color: var(--primary);
                font-size: 12px;
                font-weight: 600;
                margin-bottom: 10px;
            }
            .page-head-badge .status-dot {
                width: 7px;
                height: 7px;
                border-radius: 50%;
                background: var(--success);
                animation: pulse-dot 2s infinite;
            }
            .page-head h1 {
                margin: 0 0 6px;
                font-family: 'Manrope', sans-serif;
                font-weight: 800;
                font-size: 30px;
                color: var(--on-surface);
                letter-spacing: -0.01em;
            }
            @media (min-width: 768px) {
                .page-head h1 {
                    font-size: 38px;
                }
            }
            .page-head p {
                margin: 0;
                font-size: 15px;
                color: var(--on-surface-variant);
            }
            .page-head-meta {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 13px;
                color: var(--on-surface-muted);
                background: var(--card-bg);
                border: 1px solid var(--card-border);
                padding: 8px 14px;
                border-radius: var(--radius-full);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                white-space: nowrap;
            }
            .page-head-meta .material-symbols-outlined {
                font-size: 16px;
                color: var(--primary);
            }

            /* ---------- Tarjetas de estadísticas ---------- */
            .stats-grid {
                display: grid;
                grid-template-columns: repeat(2, 1fr);
                gap: var(--sp-md);
            }
            @media (min-width: 768px) {
                .stats-grid {
                    grid-template-columns: repeat(3, 1fr);
                }
            }
            .stat-card {
                border-radius: var(--radius-xl);
                padding: 20px;
                display: flex;
                align-items: center;
                gap: 16px;
                opacity: 0;
                transform: translateY(16px);
                animation: rise-in .5s ease forwards;
                transition: transform var(--t-fast), box-shadow var(--t-fast);
            }
            .stat-card:hover {
                transform: translateY(-4px);
                box-shadow: var(--shadow-card);
            }
            .stat-card:nth-child(1) {
                animation-delay: .05s;
            }
            .stat-card:nth-child(2) {
                animation-delay: .15s;
            }
            .stat-card:nth-child(3) {
                animation-delay: .25s;
            }
            .stat-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 46px;
                height: 46px;
                min-width: 46px;
                border-radius: 12px;
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
            }
            .stat-icon .material-symbols-outlined {
                color: var(--primary);
                font-size: 24px;
            }
            .stat-icon.warn {
                background: var(--badge-warning-bg);
                border-color: var(--badge-warning-border);
            }
            .stat-icon.warn .material-symbols-outlined {
                color: var(--warning);
            }
            .stat-icon.ok {
                background: var(--badge-success-bg);
                border-color: var(--badge-success-border);
            }
            .stat-icon.ok .material-symbols-outlined {
                color: var(--success);
            }
            .stat-value {
                font-family: 'Manrope', sans-serif;
                font-size: 26px;
                font-weight: 800;
                color: var(--on-surface);
                line-height: 1.1;
            }
            .stat-label {
                font-size: 13px;
                color: var(--on-surface-muted);
                margin-top: 2px;
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
                height: 520px;
                position: relative;
                opacity: 0;
                animation: card-in .5s ease .1s forwards;
            }
            .articles-panel::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: var(--gradient-accent);
                background-size: 200% 100%;
                animation: accent-shift 4s linear infinite;
                z-index: 2;
            }
            @keyframes accent-shift {
                0% {
                    background-position: 0% 0;
                }
                100% {
                    background-position: 200% 0;
                }
            }
            .panel-head {
                padding: var(--sp-md);
                border-bottom: 1px solid var(--hairline);
                display: flex;
                flex-wrap: wrap;
                gap: 12px;
                justify-content: space-between;
                align-items: center;
                background: rgba(255,255,255,.25);
            }
            .panel-head h3 {
                margin: 0;
                font-family: 'Manrope', sans-serif;
                font-size: 22px;
                font-weight: 700;
                color: var(--on-surface);
            }
            .panel-head-actions {
                display: flex;
                align-items: center;
                gap: 12px;
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
                white-space: nowrap;
            }
            .see-all-btn:hover {
                color: var(--link-hover);
                background: rgba(59,130,246,.08);
            }

            /* ---------- Buscador de tickets ---------- */
            .search-wrap {
                position: relative;
                display: flex;
                align-items: center;
                flex: 1;
                min-width: 160px;
                max-width: 260px;
            }
            .search-wrap .material-symbols-outlined {
                position: absolute;
                left: 10px;
                font-size: 17px;
                color: var(--on-surface-faint);
            }
            .search-wrap input {
                width: 100%;
                padding: 8px 12px 8px 34px;
                border-radius: var(--radius-full);
                border: 1px solid var(--input-border);
                background: var(--input-bg);
                font-size: 13px;
                color: var(--on-surface);
                outline: none;
                transition: border-color var(--t-fast), background var(--t-fast), box-shadow var(--t-fast);
                font-family: inherit;
            }
            .search-wrap input:focus {
                border-color: var(--input-focus-border);
                background: var(--input-focus-bg);
                box-shadow: 0 0 0 3px rgba(59,130,246,.15);
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
                font-weight: 600;
                color: var(--on-surface-labels);
                letter-spacing: .02em;
                text-transform: uppercase;
            }
            td {
                padding: 14px 16px;
                border-top: 1px solid var(--hairline);
                font-size: 15px;
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
                box-shadow: inset 3px 0 0 var(--primary);
            }
            tbody tr.hidden-row {
                display: none;
            }

            .code-cell {
                color: var(--on-surface-muted);
                font-family: monospace;
                font-size: 13px;
            }
            .article-title {
                color: var(--on-surface);
                font-weight: 500;
                margin: 0;
            }

            /* ---------- Badges (prioridad / estado) ---------- */
            .badge-pill {
                display: inline-flex;
                align-items: center;
                gap: 5px;
                padding: 4px 10px;
                border-radius: var(--radius-full);
                font-size: 12px;
                font-weight: 600;
                border: 1px solid;
                white-space: nowrap;
            }
            .badge-pill .dot {
                width: 6px;
                height: 6px;
                border-radius: 50%;
                background: currentColor;
            }
            .badge-danger {
                background: var(--badge-danger-bg);
                color: var(--badge-danger-text);
                border-color: var(--badge-danger-border);
            }
            .badge-warning {
                background: var(--badge-warning-bg);
                color: var(--badge-warning-text);
                border-color: var(--badge-warning-border);
            }
            .badge-success {
                background: var(--badge-success-bg);
                color: var(--badge-success-text);
                border-color: var(--badge-success-border);
            }
            .badge-info {
                background: var(--badge-info-bg);
                color: var(--badge-info-text);
                border-color: var(--badge-info-border);
            }

            .empty-state {
                padding: 60px 24px;
                text-align: center;
                color: var(--on-surface-muted);
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 12px;
            }
            .empty-state .material-symbols-outlined {
                font-size: 40px;
                color: var(--on-surface-faint);
            }
            .empty-state p {
                margin: 0;
                font-size: 14px;
            }

            /* ---------- Panel de detalle ---------- */
            .detail-col {
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
                height: 520px;
            }
            .detail-card {
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                flex-shrink: 0;
                background-color: var(--card-bg-strong);
                overflow-y: auto;
                flex: 1;
                display: flex;
                flex-direction: column;
                opacity: 0;
                animation: card-in .5s ease .2s forwards;
            }
            .detail-top {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
                margin-bottom: 16px;
                gap: 12px;
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
                font-size: 21px;
                font-weight: 700;
                color: var(--on-surface);
            }
            .detail-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 42px;
                height: 42px;
                min-width: 42px;
                border-radius: 12px;
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
            }
            .detail-icon .material-symbols-outlined {
                color: var(--primary);
                font-size: 22px;
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
                gap: 12px;
            }
            .detail-meta-row span:first-child {
                color: var(--on-surface-variant);
                display: flex;
                align-items: center;
                gap: 6px;
            }
            .detail-meta-row span:first-child .material-symbols-outlined {
                font-size: 15px;
                color: var(--on-surface-faint);
            }
            .detail-meta-row span:last-child {
                color: var(--on-surface);
                font-weight: 500;
                text-align: right;
            }

            .detail-actions {
                display: flex;
                flex-direction: column;
                gap: 10px;
                margin-top: auto;
                padding-top: 16px;
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
            .action-btn.primary {
                background: var(--gradient-button);
                border-color: transparent;
            }
            .action-btn.primary span.label {
                color: #fff;
            }
            .action-btn.primary:hover {
                background: var(--gradient-button-hover);
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
                            <span class="page-head-badge">
                                <span class="status-dot" aria-hidden="true"></span>
                                Panel del agente
                            </span>
                            <h1>Hola, ${name}</h1>
                            <p>Esto es lo que tienes pendiente hoy.</p>
                        </div>
                        <div class="page-head-meta">
                            <span class="material-symbols-outlined" aria-hidden="true">calendar_today</span>
                            <span id="todayLabel">&nbsp;</span>
                        </div>
                    </section>

                    <!-- Tarjetas de estadísticas rápidas -->
                    <div class="stats-grid">
                        <div class="stat-card glass-panel">
                            <div class="stat-icon">
                                <span class="material-symbols-outlined" aria-hidden="true">confirmation_number</span>
                            </div>
                            <div>
                                <div class="stat-value">${fn:length(myTickets)}</div>
                                <div class="stat-label">Tickets asignados</div>
                            </div>
                        </div>  
                        <div class="stat-card glass-panel" style="grid-column: span 2;">
                            <div class="stat-icon ok">
                                <span class="material-symbols-outlined" aria-hidden="true">task_alt</span>
                            </div>
                            <div>
                                <div class="stat-value" id="lastSyncLabel">Ahora</div>
                                <div class="stat-label">Última actualización</div>
                            </div>
                        </div>
                    </div>

                    <div class="bento-grid">
                        <!-- Left Panel: Assigned Tickets Table -->
                        <section class="articles-panel glass-panel">
                            <div class="panel-head">
                                <h3>Mis Tickets Asignados</h3>
                                <div class="panel-head-actions">
                                    <div class="search-wrap">
                                        <span class="material-symbols-outlined" aria-hidden="true">search</span>
                                        <input type="text" id="ticketSearch" placeholder="Buscar por título o código">
                                    </div>
                                    <a class="see-all-btn" href="${pageContext.request.contextPath}/TicketServlet?action=tickets">
                                        Ver todos <span class="material-symbols-outlined" style="font-size:16px">arrow_forward</span>
                                    </a>
                                </div>
                            </div>
                            <div class="table-scroll">
                                <c:choose>
                                    <c:when test="${empty myTickets}">
                                        <div class="empty-state">
                                            <span class="material-symbols-outlined" aria-hidden="true">inbox</span>
                                            <p>No tienes tickets asignados por ahora.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <table id="ticketsTable">
                                            <thead>
                                                <tr>
                                                    <th>Código</th>
                                                    <th>Título</th>
                                                    <th>Prioridad</th>
                                                    <th>Estado</th>
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
                                                        <td><span class="badge-pill js-priority-badge"><span class="dot"></span>${item.priorityName}</span></td>
                                                        <td><span class="badge-pill js-state-badge"><span class="dot"></span>${item.state}</span></td>
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
                                        <div class="empty-state" style="padding: 24px 0;">
                                            <span class="material-symbols-outlined" aria-hidden="true">assignment_late</span>
                                            <p>Cuando tengas tickets asignados, podrás ver el detalle aquí.</p>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="detail-top">
                                            <div>
                                                <span class="detail-eyebrow" id="detailCode">TK-${myTickets[0].id}</span>
                                                <h4 class="detail-title" id="detailTitle">${myTickets[0].title}</h4>
                                            </div>
                                            <div class="detail-icon">
                                                <span class="material-symbols-outlined" aria-hidden="true">confirmation_number</span>
                                            </div>
                                        </div>

                                        <div class="detail-meta">
                                            <div class="detail-meta-row">
                                                <span><span class="material-symbols-outlined" aria-hidden="true">category</span>Categoría</span>
                                                <span id="detailCategory">${myTickets[0].categoryName}</span>
                                            </div>
                                            <div class="detail-meta-row">
                                                <span><span class="material-symbols-outlined" aria-hidden="true">flag</span>Prioridad</span>
                                                <span id="detailPriority"><span class="badge-pill js-priority-badge"><span class="dot"></span>${myTickets[0].priorityName}</span></span>
                                            </div>
                                            <div class="detail-meta-row">
                                                <span><span class="material-symbols-outlined" aria-hidden="true">sync_alt</span>Estado</span>
                                                <span id="detailState"><span class="badge-pill js-state-badge"><span class="dot"></span>${myTickets[0].state}</span></span>
                                            </div>
                                            <div class="detail-meta-row">
                                                <span><span class="material-symbols-outlined" aria-hidden="true">person</span>Solicitante</span>
                                                <span id="detailApplicant">${myTickets[0].applicantName}</span>
                                            </div>
                                            <div class="detail-meta-row">
                                                <span><span class="material-symbols-outlined" aria-hidden="true">event</span>Vence</span>
                                                <span id="detailExpiration">${myTickets[0].expirationDate}</span>
                                            </div>
                                        </div>

                                        <div class="detail-actions">
                                            <a class="action-btn" href="${pageContext.request.contextPath}/TicketServlet?action=tickets">
                                                <span class="label">
                                                    <span class="material-symbols-outlined" aria-hidden="true">list_alt</span>
                                                    Ver todos mis tickets
                                                </span>
                                                <span class="material-symbols-outlined" aria-hidden="true">arrow_forward</span>
                                            </a>
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
            // ---- Fecha y hora local en el encabezado ----
            (function () {
                const todayLabel = document.getElementById('todayLabel');
                const lastSyncLabel = document.getElementById('lastSyncLabel');
                const now = new Date();
                const options = {weekday: 'long', day: 'numeric', month: 'long'};
                if (todayLabel) {
                    let text = now.toLocaleDateString('es-ES', options);
                    todayLabel.textContent = text.charAt(0).toUpperCase() + text.slice(1);
                }
                if (lastSyncLabel) {
                    const hh = String(now.getHours()).padStart(2, '0');
                    const mm = String(now.getMinutes()).padStart(2, '0');
                    lastSyncLabel.textContent = hh + ':' + mm;
                }
            })();

            // ---- Colorear badges de prioridad y estado según su texto ----
            function classifyBadge(el, map, fallback) {
                const text = el.textContent.trim().toLowerCase();
                let cls = fallback;
                for (const key in map) {
                    if (text.indexOf(key) !== -1) {
                        cls = map[key];
                        break;
                    }
                }
                el.classList.add(cls);
            }

            const priorityMap = {
                'alta': 'badge-danger',
                'urgente': 'badge-danger',
                'critic': 'badge-danger',
                'media': 'badge-warning',
                'normal': 'badge-warning',
                'baja': 'badge-success'
            };
            const stateMap = {
                'resuelto': 'badge-success',
                'cerrado': 'badge-success',
                'completado': 'badge-success',
                'proceso': 'badge-warning',
                'progreso': 'badge-warning',
                'revision': 'badge-warning',
                'abierto': 'badge-info',
                'pendiente': 'badge-info',
                'nuevo': 'badge-info'
            };

            document.querySelectorAll('.js-priority-badge').forEach(el => classifyBadge(el, priorityMap, 'badge-info'));
            document.querySelectorAll('.js-state-badge').forEach(el => classifyBadge(el, stateMap, 'badge-info'));

            document.addEventListener('DOMContentLoaded', () => {
                const rows = document.querySelectorAll('#ticketsTable tbody tr');

                // ---- Selección de fila -> actualizar panel de detalle ----
                rows.forEach(row => {
                    row.addEventListener('click', () => {
                        rows.forEach(r => r.classList.remove('selected'));
                        row.classList.add('selected');

                        const id = row.getAttribute('data-id');
                        const title = row.getAttribute('data-title');
                        const category = row.getAttribute('data-category');
                        const priority = row.getAttribute('data-priority');
                        const state = row.getAttribute('data-state');
                        const applicant = row.getAttribute('data-applicant');
                        const expiration = row.getAttribute('data-expiration');

                        document.getElementById('detailCode').textContent = 'TK-' + id;
                        document.getElementById('detailTitle').textContent = title;
                        document.getElementById('detailCategory').textContent = category;

                        const priorityBadge = document.querySelector('#detailPriority .js-priority-badge');
                        if (priorityBadge) {
                            priorityBadge.className = 'badge-pill js-priority-badge';
                            priorityBadge.innerHTML = '<span class="dot"></span>' + priority;
                            classifyBadge(priorityBadge, priorityMap, 'badge-info');
                        }

                        const stateBadge = document.querySelector('#detailState .js-state-badge');
                        if (stateBadge) {
                            stateBadge.className = 'badge-pill js-state-badge';
                            stateBadge.innerHTML = '<span class="dot"></span>' + state;
                            classifyBadge(stateBadge, stateMap, 'badge-info');
                        }

                        const applicantEl = document.getElementById('detailApplicant');
                        if (applicantEl)
                            applicantEl.textContent = applicant || '—';

                        const expirationEl = document.getElementById('detailExpiration');
                        if (expirationEl)
                            expirationEl.textContent = expiration || '—';

                        const detailLink = document.getElementById('detailLink');
                        if (detailLink) {
                            detailLink.href = '${pageContext.request.contextPath}/TicketServlet?action=view&id=' + id;
                        }

                        // pequeño efecto de refresco en la tarjeta de detalle
                        const detailCard = document.getElementById('ticketDetail');
                        detailCard.style.animation = 'none';
                        void detailCard.offsetWidth;
                        detailCard.style.animation = 'card-in .35s ease forwards';
                    });
                });

                // ---- Buscador en vivo por título o código ----
                const searchInput = document.getElementById('ticketSearch');
                if (searchInput) {
                    searchInput.addEventListener('input', () => {
                        const query = searchInput.value.trim().toLowerCase();
                        rows.forEach(row => {
                            const title = (row.getAttribute('data-title') || '').toLowerCase();
                            const code = ('tk-' + row.getAttribute('data-id')).toLowerCase();
                            const matches = title.indexOf(query) !== -1 || code.indexOf(query) !== -1;
                            row.classList.toggle('hidden-row', !matches);
                        });
                    });
                }
            });
        </script>
    </body>
</html>