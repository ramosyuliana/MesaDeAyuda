<%-- 
    Document   : ManagementTickets
    Created on : 12/08/2026, 4:58:13 p. m.
    Author     : julil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Gestión de Tickets - Luminous Ether</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Manrope:wght@400;600;700&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
        <style>
            :root {
                /* ---- Fondo ---- */
                --bg-page: #eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));

                /* ---- Superficies internas ---- */
                --surface-container-lowest: #f6f8fb;
                --surface-container-low: #e9eef5;
                --surface-container: #e2e8f2;
                --surface-container-high: #dbe2ee;

                /* ---- Texto ---- */
                --text-title: #1e293b;
                --text-label: #334155;
                --text-secondary: #51607a;
                --text-tertiary: #6b7a97;
                --text-muted: #94a3b8;

                /* ---- Estados ---- */
                --color-success: #059669;
                --color-error: #dc2626;
                --color-warning: #d97706;

                /* ---- Acentos ---- */
                --link: #3b82f6;
                --link-hover: #2563eb;
                --primary: #2563eb;
                --primary-container: #3b82f6;
                --secondary: #6366f1;
                --tertiary: #38bdf8;

                /* ---- Glass ---- */
                --card-bg: rgba(255,255,255,.6);
                --card-bg-strong: rgba(255,255,255,.75);
                --card-border: rgba(148,163,184,.25);
                --card-blur: blur(10px);

                /* ---- Inputs ---- */
                --input-bg: rgba(255,255,255,.5);
                --input-border: #d7dfec;
                --input-focus-bg: rgba(255,255,255,.9);
                --input-focus-border: #3b82f6;
                --input-focus-glow: 0 0 0 4px rgba(59,130,246,.16);

                /* ---- Degradados ---- */
                --brand-gradient: linear-gradient(90deg, #38bdf8, #6366f1);
                --btn-gradient: linear-gradient(135deg, #3b82f6, #2563eb);
                --btn-hover-gradient: linear-gradient(135deg, #2563eb, #1d4ed8);

                /* ---- Sombras ---- */
                --shadow-subtle: 0 4px 20px rgba(30,41,59,0.06);
                --shadow-hover: 0 12px 32px rgba(30,41,59,0.12);
                --shadow-blue-glow: 0 10px 30px -8px rgba(59,130,246,0.14);

                /* ---- Radios ---- */
                --radius-sm: 8px;
                --radius-md: 12px;
                --radius-lg: 16px;
                --radius-xl: 20px;
                --radius-full: 9999px;

                /* ---- Espaciado ---- */
                --sp-xs: 4px;
                --sp-base: 8px;
                --sp-sm: 12px;
                --sp-md: 24px;
                --sp-lg: 48px;
                --sp-xl: 80px;
                --container-max: 1280px;
                --sidenav-w: 256px;

                /* ---- Movimiento ---- */
                --t-fast: .2s cubic-bezier(.4,0,.2,1);
                --t-base: .25s cubic-bezier(.4,0,.2,1);
                --t-slow: .3s cubic-bezier(.4,0,.2,1);
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                background-color: var(--bg-page);
                background-image: var(--bg-gradient);
                background-attachment: fixed;
                min-height: 100vh;
                overflow-x: hidden;
                color: var(--text-secondary);
                font-family: 'Inter', sans-serif;
                font-size: 16px;
                line-height: 1.6;
                -webkit-font-smoothing: antialiased;
            }

            h1, h2, h3 {
                font-family: 'Manrope', sans-serif;
                color: var(--text-title);
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

            ::selection {
                background: rgba(59,130,246,.2);
                color: var(--primary);
            }
            :focus-visible {
                outline: 2px solid var(--input-focus-border);
                outline-offset: 2px;
                border-radius: 8px;
            }

            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                user-select: none;
            }
            .ico-16 {
                font-size: 16px;
            }
            .ico-18 {
                font-size: 18px;
            }
            .ico-20 {
                font-size: 20px;
            }

            /* ---------- Glass ---------- */
            .glass-panel {
                background-color: var(--card-bg);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-subtle);
            }

            /* Fade-in de entrada */
            .fade-in-element {
                opacity: 0;
                transform: translateY(18px);
                transition: opacity .45s cubic-bezier(.4,0,.2,1), transform .45s cubic-bezier(.4,0,.2,1);
            }
            .fade-in-element.is-in {
                opacity: 1;
                transform: none;
            }

            /* Elevación en hover (la aplica el JS) */
            .is-liftable {
                transition: transform var(--t-slow), box-shadow var(--t-slow), background-color var(--t-slow);
            }
            .is-liftable:hover {
                transform: translateY(-3px);
                box-shadow: var(--shadow-hover);
                background-color: var(--card-bg-strong);
            }

            /* ---------- TopNavBar ---------- */
            header.top-nav {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                z-index: 50;
                display: flex;
                justify-content: space-between;
                align-items: center;
                height: 64px;
                padding: 0 var(--sp-md);
                border-left: none;
                border-right: none;
                border-top: none;
                border-bottom: 1px solid var(--card-border);
                transition: background-color var(--t-base), box-shadow var(--t-base);
            }
            header.top-nav::after {
                content: '';
                position: absolute;
                left: 0;
                right: 0;
                bottom: -1px;
                height: 2px;
                background: var(--brand-gradient);
                opacity: .75;
            }
            .nav-left {
                display: flex;
                align-items: center;
                gap: var(--sp-md);
            }
            @media (min-width: 1024px) {
                .nav-left {
                    margin-left: var(--sidenav-w);
                }
            }

            .nav-search {
                display: flex;
                align-items: center;
                width: 256px;
                background: var(--input-bg);
                border: 1px solid var(--input-border);
                border-radius: var(--radius-full);
                padding: 4px 12px;
                transition: background var(--t-fast), border-color var(--t-fast), box-shadow var(--t-fast);
            }
            .nav-search:focus-within {
                background: var(--input-focus-bg);
                border-color: var(--input-focus-border);
                box-shadow: var(--input-focus-glow);
            }
            .nav-search .material-symbols-outlined {
                font-size: 18px;
                color: var(--text-tertiary);
                margin-right: var(--sp-xs);
                transition: color var(--t-fast);
            }
            .nav-search:focus-within .material-symbols-outlined {
                color: var(--input-focus-border);
            }
            .nav-search input {
                flex: 1;
                width: 100%;
                background: transparent;
                border: none;
                outline: none;
                font-family: inherit;
                font-size: 14px;
                font-weight: 500;
                color: var(--text-title);
                padding: 4px 0;
            }
            .nav-search input::placeholder {
                color: var(--text-muted);
            }

            .nav-right {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
            }
            .icon-btn {
                padding: 6px;
                border-radius: var(--radius-full);
                display: flex;
                color: var(--text-tertiary);
                transition: background var(--t-fast), color var(--t-fast), transform var(--t-fast);
            }
            .icon-btn:hover {
                background: rgba(59,130,246,.1);
                color: var(--link);
            }
            .icon-btn:active {
                transform: scale(.94);
            }

            /* ---------- SideNavBar ---------- */
            nav.side-nav {
                position: fixed;
                left: 0;
                top: 0;
                z-index: 40;
                height: 100vh;
                width: var(--sidenav-w);
                display: none;
                flex-direction: column;
                gap: var(--sp-sm);
                padding: 80px var(--sp-md) var(--sp-md);
                border-top: none;
                border-bottom: none;
                border-left: none;
                border-right: 1px solid var(--card-border);
            }
            @media (min-width: 768px) {
                nav.side-nav {
                    display: flex;
                }
            }

            .side-brand {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
                margin-bottom: var(--sp-lg);
                padding: 0 var(--sp-xs);
            }
            .side-brand-mark {
                width: 40px;
                height: 40px;
                flex-shrink: 0;
                border-radius: var(--radius-md);
                background: var(--btn-gradient);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                box-shadow: var(--shadow-blue-glow);
                transition: transform var(--t-slow);
            }
            .side-brand:hover .side-brand-mark {
                transform: rotate(-8deg) scale(1.06);
            }
            .side-brand h1 {
                font-size: 18px;
                font-weight: 700;
                line-height: 1.4;
                background: var(--brand-gradient);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }
            .side-brand p {
                font-size: 12px;
                line-height: 1.4;
                color: var(--text-tertiary);
            }

            .side-links {
                display: flex;
                flex-direction: column;
                gap: var(--sp-xs);
                flex-grow: 1;
            }
            .side-link {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
                padding: 10px var(--sp-sm);
                border-radius: var(--radius-sm);
                color: var(--text-label);
                font-size: 14px;
                font-weight: 500;
                transition: background var(--t-base), color var(--t-base), transform var(--t-fast);
            }
            .side-link .material-symbols-outlined {
                font-size: 20px;
                color: var(--text-tertiary);
                transition: color var(--t-base);
            }
            .side-link:hover {
                background: rgba(59,130,246,.07);
                color: var(--link);
                transform: translateX(4px);
            }
            .side-link:hover .material-symbols-outlined {
                color: var(--link);
            }
            .side-link.active {
                background: var(--btn-gradient);
                color: #fff;
                font-weight: 700;
                box-shadow: var(--shadow-subtle);
            }
            .side-link.active:hover {
                background: var(--btn-hover-gradient);
                color: #fff;
                transform: none;
            }
            .side-link.active .material-symbols-outlined {
                color: #fff;
            }

            .side-footer {
                display: flex;
                flex-direction: column;
                gap: var(--sp-xs);
                margin-top: var(--sp-lg);
                padding-top: var(--sp-md);
                border-top: 1px solid var(--card-border);
            }

            /* ---------- Botones ---------- */
            .btn-primary {
                position: relative;
                overflow: hidden;
                width: 100%;
                margin-top: var(--sp-md);
                background: var(--btn-gradient);
                color: #fff;
                font-size: 14px;
                font-weight: 500;
                padding: var(--sp-sm);
                border-radius: var(--radius-sm);
                display: flex;
                align-items: center;
                justify-content: center;
                gap: var(--sp-xs);
                box-shadow: var(--shadow-subtle);
                transition: background var(--t-slow), box-shadow var(--t-slow), transform var(--t-fast);
            }
            .btn-primary:hover {
                background: var(--btn-hover-gradient);
                box-shadow: var(--shadow-hover);
                transform: translateY(-2px);
            }
            .btn-primary:active {
                transform: translateY(0) scale(.98);
            }

            .ripple {
                position: absolute;
                border-radius: 50%;
                transform: scale(0);
                background: rgba(255,255,255,.45);
                pointer-events: none;
                animation: ripple-out .6s ease-out forwards;
            }
            @keyframes ripple-out {
                to {
                    transform: scale(2.6);
                    opacity: 0;
                }
            }

            .btn-ghost {
                padding: 6px var(--sp-sm);
                border-radius: var(--radius-sm);
                background: var(--input-bg);
                border: 1px solid var(--card-border);
                display: flex;
                align-items: center;
                gap: var(--sp-xs);
                font-size: 12px;
                font-weight: 500;
                color: var(--text-label);
                box-shadow: var(--shadow-subtle);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                transition: background var(--t-fast), border-color var(--t-fast), color var(--t-fast), transform var(--t-fast), box-shadow var(--t-fast);
            }
            .btn-ghost:hover {
                background: var(--input-focus-bg);
                border-color: var(--input-focus-border);
                color: var(--link);
                transform: translateY(-2px);
                box-shadow: var(--shadow-hover);
            }
            .btn-ghost:active {
                transform: translateY(0) scale(.98);
            }

            /* ---------- Main ---------- */
            main.content {
                padding: 88px var(--sp-md) var(--sp-lg);
                max-width: var(--container-max);
                margin: 0 auto;
                min-height: 100vh;
            }
            @media (min-width: 768px) {
                main.content {
                    padding-left: calc(var(--sidenav-w) + var(--sp-lg));
                    padding-right: var(--sp-lg);
                }
            }

            .page-head {
                margin-bottom: var(--sp-lg);
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                gap: var(--sp-md);
            }
            @media (min-width: 768px) {
                .page-head {
                    flex-direction: row;
                    align-items: flex-end;
                }
            }
            .page-head h2 {
                font-size: 32px;
                font-weight: 700;
                line-height: 1.3;
                letter-spacing: -0.01em;
                color: var(--text-title);
            }
            .page-head p {
                font-size: 16px;
                color: var(--text-secondary);
                margin-top: var(--sp-xs);
            }
            .head-actions {
                display: flex;
                gap: var(--sp-sm);
                flex-wrap: wrap;
            }

            /* ---------- Tabla ---------- */
            .table-card {
                border-radius: var(--radius-xl);
                overflow: hidden;
                position: relative;
            }
            .table-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: var(--brand-gradient);
                z-index: 2;
            }
            .table-scroll {
                overflow-x: auto;
            }
            table {
                width: 100%;
                text-align: left;
                border-collapse: collapse;
            }

            thead tr {
                border-bottom: 1px solid var(--card-border);
                background: rgba(233,238,245,.5);
            }
            th {
                padding: var(--sp-sm) var(--sp-md);
                font-size: 14px;
                font-weight: 600;
                color: var(--text-label);
            }
            th.align-right {
                text-align: right;
            }

            tbody tr {
                border-bottom: 1px solid var(--card-border);
                transition: background var(--t-fast);
            }
            tbody tr:last-child {
                border-bottom: none;
            }
            tbody tr:hover {
                background: rgba(59,130,246,.06);
            }
            tbody tr.selected {
                background: rgba(59,130,246,.1);
            }
            td {
                padding: var(--sp-md);
                font-size: 16px;
                vertical-align: middle;
            }

            .cell-id {
                color: var(--text-tertiary);
                font-weight: 500;
                font-family: monospace;
                font-size: 14px;
            }
            .cell-subject {
                font-weight: 600;
                color: var(--text-title);
            }
            .cell-meta {
                font-size: 12px;
                line-height: 1.4;
                color: var(--text-muted);
                margin-top: var(--sp-xs);
            }

            .status {
                display: inline-flex;
                align-items: center;
                padding: 4px var(--sp-sm);
                border-radius: var(--radius-full);
                font-size: 12px;
                font-weight: 500;
                letter-spacing: .01em;
            }
            .status .dot {
                width: 6px;
                height: 6px;
                border-radius: 50%;
                margin-right: var(--sp-xs);
            }
            .status-progress {
                background: rgba(59,130,246,.1);
                color: var(--primary);
                border: 1px solid rgba(59,130,246,.2);
            }
            .status-progress .dot {
                background: var(--primary-container);
            }
            .status-urgent {
                background: rgba(220,38,38,.1);
                color: var(--color-error);
                border: 1px solid rgba(220,38,38,.2);
            }
            .status-urgent .dot {
                background: var(--color-error);
            }
            .status-pending {
                background: var(--surface-container);
                color: var(--text-secondary);
                border: 1px solid var(--card-border);
            }
            .status-pending .dot {
                background: var(--text-tertiary);
            }
            .status-review {
                background: rgba(56,189,248,.14);
                color: #0284c7;
                border: 1px solid rgba(56,189,248,.25);
            }
            .status-review .dot {
                background: var(--tertiary);
            }

            .row-actions {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: var(--sp-sm);
                opacity: 0;
                transform: translateX(6px);
                transition: opacity var(--t-base), transform var(--t-base);
            }
            tbody tr:hover .row-actions,
            tbody tr:focus-within .row-actions {
                opacity: 1;
                transform: none;
            }

            .btn-cancel {
                padding: 4px var(--sp-sm);
                border-radius: 6px;
                border: 1px solid var(--card-border);
                color: var(--color-error);
                font-size: 12px;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: var(--sp-xs);
                white-space: nowrap;
                transition: background var(--t-fast), border-color var(--t-fast), transform var(--t-fast);
            }
            .btn-cancel:hover {
                background: rgba(220,38,38,.08);
                border-color: rgba(220,38,38,.5);
                transform: translateY(-1px);
            }
            .btn-cancel:active {
                transform: scale(.96);
            }

            .btn-reassign {
                position: relative;
                overflow: hidden;
                padding: 4px var(--sp-sm);
                border-radius: 6px;
                background: var(--btn-gradient);
                color: #fff;
                font-size: 12px;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: var(--sp-xs);
                white-space: nowrap;
                box-shadow: var(--shadow-subtle);
                transition: background var(--t-base), box-shadow var(--t-base), transform var(--t-fast);
            }
            .btn-reassign:hover {
                background: var(--btn-hover-gradient);
                box-shadow: var(--shadow-hover);
                transform: translateY(-1px);
            }
            .btn-reassign:active {
                transform: scale(.96);
            }

            /* ---------- Paginación ---------- */
            .pagination {
                border-top: 1px solid var(--card-border);
                padding: var(--sp-sm) var(--sp-md);
                display: flex;
                align-items: center;
                justify-content: space-between;
                gap: var(--sp-sm);
                flex-wrap: wrap;
                background: rgba(233,238,245,.35);
            }
            .pagination-info {
                font-size: 12px;
                line-height: 1.4;
                color: var(--text-tertiary);
            }
            .pagination-controls {
                display: flex;
                align-items: center;
                gap: var(--sp-xs);
            }
            .page-arrow {
                padding: 6px;
                border-radius: 6px;
                color: var(--text-tertiary);
                display: flex;
                transition: background var(--t-fast), color var(--t-fast);
            }
            .page-arrow:hover:not(:disabled) {
                background: rgba(59,130,246,.1);
                color: var(--link);
            }
            .page-arrow:disabled {
                opacity: .4;
                cursor: not-allowed;
            }
            .page-num {
                width: 32px;
                height: 32px;
                border-radius: 6px;
                font-size: 12px;
                font-weight: 500;
                color: var(--text-secondary);
                display: flex;
                align-items: center;
                justify-content: center;
                transition: background var(--t-fast), color var(--t-fast), transform var(--t-fast);
            }
            .page-num:hover {
                background: rgba(59,130,246,.1);
                color: var(--link);
            }
            .page-num.active {
                background: rgba(59,130,246,.12);
                color: var(--primary);
                font-weight: 700;
            }

            /* ---------- Scrollbars ---------- */
            ::-webkit-scrollbar {
                width: 10px;
                height: 10px;
            }
            ::-webkit-scrollbar-track {
                background: transparent;
            }
            ::-webkit-scrollbar-thumb {
                background: rgba(148,163,184,.35);
                border-radius: var(--radius-full);
                border: 3px solid transparent;
                background-clip: content-box;
            }
            ::-webkit-scrollbar-thumb:hover {
                background: rgba(107,122,151,.5);
                background-clip: content-box;
            }

            @media (prefers-reduced-motion: reduce) {
                *, *::before, *::after {
                    animation-duration: .001ms !important;
                    animation-iteration-count: 1 !important;
                    transition-duration: .001ms !important;
                }
                .fade-in-element {
                    opacity: 1;
                    transform: none;
                }
                .is-liftable:hover {
                    transform: none;
                }
            }
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />

        <!-- Main Content Canvas -->
        <main class="content">
            <!-- Page Header -->
            <div class="page-head fade-in-element">
                <div>
                    <h2>Gestión de Tickets</h2>
                    <p>Administra y reasigna solicitudes pendientes</p>
                </div>
                <!-- Contextual Filters/Actions for the table -->
                <div class="head-actions">
                    <button class="btn-ghost">
                        <span class="material-symbols-outlined ico-16">filter_list</span>
                        Filtrar
                    </button>
                    <button class="btn-ghost">
                        <span class="material-symbols-outlined ico-16">sort</span>
                        Ordenar
                    </button>
                </div>
            </div>

            <!-- Glassmorphic Table Container -->
            <div class="glass-panel table-card fade-in-element">
                <div class="table-scroll">
                    <table>
                        <thead>
                            <tr>
                                <th>ID Ticket</th>
                                <th>Asunto</th>
                                <th>Estado</th>
                                <th class="align-right">Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Row 1 -->
                            <tr>
                                <td class="cell-id">#TK-8492</td>
                                <td>
                                    <div class="cell-subject">Problema de acceso al portal</div>
                                    <div class="cell-meta">Usuario: m.gomez@empresa.com</div>
                                </td>
                                <td>
                                    <span class="status status-progress">
                                        <span class="dot"></span>
                                        En Progreso
                                    </span>
                                </td>
                                <td>
                                    <div class="row-actions">
                                        <button class="btn-cancel">
                                            <span class="material-symbols-outlined ico-16">cancel</span>
                                            Cancelar
                                        </button>
                                        <button class="btn-reassign">
                                            <span class="material-symbols-outlined ico-16">move_up</span>
                                            Reasignar
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 2 -->
                            <tr>
                                <td class="cell-id">#TK-8491</td>
                                <td>
                                    <div class="cell-subject">Actualización de facturación fallida</div>
                                    <div class="cell-meta">Usuario: finanzas@cliente.com</div>
                                </td>
                                <td>
                                    <span class="status status-urgent">
                                        <span class="dot"></span>
                                        Urgente
                                    </span>
                                </td>
                                <td>
                                    <div class="row-actions">
                                        <button class="btn-cancel">
                                            <span class="material-symbols-outlined ico-16">cancel</span>
                                            Cancelar
                                        </button>
                                        <button class="btn-reassign">
                                            <span class="material-symbols-outlined ico-16">move_up</span>
                                            Reasignar
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 3 -->
                            <tr>
                                <td class="cell-id">#TK-8488</td>
                                <td>
                                    <div class="cell-subject">Solicitud de nueva licencia</div>
                                    <div class="cell-meta">Usuario: r.lopez@startup.io</div>
                                </td>
                                <td>
                                    <span class="status status-pending">
                                        <span class="dot"></span>
                                        Pendiente
                                    </span>
                                </td>
                                <td>
                                    <div class="row-actions">
                                        <button class="btn-cancel">
                                            <span class="material-symbols-outlined ico-16">cancel</span>
                                            Cancelar
                                        </button>
                                        <button class="btn-reassign">
                                            <span class="material-symbols-outlined ico-16">move_up</span>
                                            Reasignar
                                        </button>
                                    </div>
                                </td>
                            </tr>
                            <!-- Row 4 -->
                            <tr>
                                <td class="cell-id">#TK-8475</td>
                                <td>
                                    <div class="cell-subject">Error de sincronización API</div>
                                    <div class="cell-meta">Sistema Automatizado</div>
                                </td>
                                <td>
                                    <span class="status status-review">
                                        <span class="dot"></span>
                                        En Revisión
                                    </span>
                                </td>
                                <td>
                                    <div class="row-actions">
                                        <button class="btn-cancel">
                                            <span class="material-symbols-outlined ico-16">cancel</span>
                                            Cancelar
                                        </button>
                                        <button class="btn-reassign">
                                            <span class="material-symbols-outlined ico-16">move_up</span>
                                            Reasignar
                                        </button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <!-- Pagination Footer -->
                <div class="pagination">
                    <span class="pagination-info">Mostrando 1 a 4 de 24 tickets</span>
                    <div class="pagination-controls">
                        <button class="page-arrow" disabled="" aria-label="Anterior">
                            <span class="material-symbols-outlined ico-20">chevron_left</span>
                        </button>
                        <button class="page-num active">1</button>
                        <button class="page-num">2</button>
                        <button class="page-num">3</button>
                        <button class="page-arrow" aria-label="Siguiente">
                            <span class="material-symbols-outlined ico-20">chevron_right</span>
                        </button>
                    </div>
                </div>
            </div>
        </main>

        <script>
            (function () {
                'use strict';

                var reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

                /* ---------- 1. Fade-in escalonado al cargar ---------- */
                function setupFadeIn() {
                    var els = [];
                    var header = document.querySelector('.top-nav');
                    var side = document.querySelector('.side-nav');
                    if (header)
                        els.push(header);
                    if (side)
                        els.push(side);
                    Array.prototype.forEach.call(document.querySelectorAll('.fade-in-element'), function (el) {
                        els.push(el);
                    });
                    Array.prototype.forEach.call(document.querySelectorAll('tbody tr'), function (el) {
                        els.push(el);
                    });

                    els.forEach(function (el) {
                        el.classList.add('fade-in-element');
                    });

                    if (reduced) {
                        els.forEach(function (el) {
                            el.classList.add('is-in');
                        });
                        return;
                    }

                    requestAnimationFrame(function () {
                        els.forEach(function (el, i) {
                            setTimeout(function () {
                                el.classList.add('is-in');
                            }, i * 80);
                        });
                    });
                }

                /* ---------- 2. Elevación en hover ---------- */
                function setupLift() {
                    var card = document.querySelector('.table-card');
                    if (card)
                        card.classList.add('is-liftable');
                }

                /* ---------- 3. Ripple en botones con degradado ---------- */
                function setupRipple() {
                    if (reduced)
                        return;
                    var buttons = document.querySelectorAll('.btn-primary, .btn-reassign');
                    Array.prototype.forEach.call(buttons, function (btn) {
                        btn.addEventListener('click', function (e) {
                            var rect = btn.getBoundingClientRect();
                            var size = Math.max(rect.width, rect.height);
                            var ripple = document.createElement('span');
                            ripple.className = 'ripple';
                            ripple.style.width = ripple.style.height = size + 'px';
                            ripple.style.left = (e.clientX - rect.left - size / 2) + 'px';
                            ripple.style.top = (e.clientY - rect.top - size / 2) + 'px';
                            btn.appendChild(ripple);
                            setTimeout(function () {
                                ripple.remove();
                            }, 620);
                        });
                    });
                }

                /* ---------- 4. Selección de fila (ignora los botones de acción) ---------- */
                function setupRowSelection() {
                    var rows = document.querySelectorAll('tbody tr');
                    Array.prototype.forEach.call(rows, function (row) {
                        row.addEventListener('click', function (e) {
                            if (e.target.closest('.row-actions'))
                                return;
                            Array.prototype.forEach.call(rows, function (r) {
                                r.classList.remove('selected');
                            });
                            row.classList.add('selected');
                        });
                    });
                }

                /* ---------- 5. Paginación: marca la página activa ---------- */
                function setupPagination() {
                    var nums = document.querySelectorAll('.page-num');
                    Array.prototype.forEach.call(nums, function (btn) {
                        btn.addEventListener('click', function () {
                            Array.prototype.forEach.call(nums, function (b) {
                                b.classList.remove('active');
                            });
                            btn.classList.add('active');
                        });
                    });
                }

                /* ---------- 6. Sombra del header al hacer scroll ---------- */
                function setupNavScroll() {
                    var nav = document.querySelector('.top-nav');
                    if (!nav)
                        return;
                    var apply = function () {
                        var scrolled = window.scrollY > 8;
                        nav.style.boxShadow = scrolled ? 'var(--shadow-hover)' : 'var(--shadow-subtle)';
                        nav.style.backgroundColor = scrolled ? 'var(--card-bg-strong)' : 'var(--card-bg)';
                    };
                    apply();
                    window.addEventListener('scroll', apply, {passive: true});
                }

                function init() {
                    setupFadeIn();
                    setupLift();
                    setupRipple();
                    setupRowSelection();
                    setupPagination();
                    setupNavScroll();
                }

                if (document.readyState === 'loading') {
                    document.addEventListener('DOMContentLoaded', init);
                } else {
                    init();
                }
            })();
        </script>

    </body>
</html>