<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dashboard Admin | Mesa Ayuda CIMM</title>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap"
              rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;900&display=swap" rel="stylesheet">
        <style>
            :root {
                /* ---- Fondos y superficies (MODO CLARO por defecto, con cuerpo) ---- */
                --bg-page: #eef2f7;
                --surface-container-lowest: #f6f8fb;
                --surface-container-low: #e9eef5;
                --surface-container: #e2e8f2;
                --surface-container-high: #dbe2ee;
                --surface-container-highest: #d3dce9;

                /* ---- Texto ---- */
                --on-surface: #1e293b;
                --on-surface-labels: #334155;
                --on-surface-variant: #51607a;
                --on-surface-muted: #6b7a97;
                --on-surface-faint: #94a3b8;

                /* ---- Bordes ---- */
                --border-soft: #d7dfec;
                --outline: #c2cddd;
                --outline-variant: #d7dfec;

                /* ---- Acentos azules (mismos en ambos modos) ---- */
                --accent-start: #38bdf8;
                --accent-end: #6366f1;
                --link-hover: #2563eb;
                --link: #3b82f6;
                --primary: #2563eb;
                --primary-container: #3b82f6;
                --primary-hover: #1d4ed8;
                --on-primary: #ffffff;
                --on-primary-container: #ffffff;
                --secondary-container: #dde6fa;
                --on-secondary-container: #3b4a63;

                --error: #dc2626;
                --success: #059669;
                --warning: #d97706;

                /* ---- Degradados ---- */
                --gradient-overlay: linear-gradient(135deg, rgba(224, 231, 242, .9), rgba(219, 230, 250, .7), rgba(214, 238, 242, .8));
                --gradient-accent: linear-gradient(90deg, #38bdf8, #6366f1);
                --gradient-button: linear-gradient(135deg, #3b82f6, #2563eb);
                --gradient-button-hover: linear-gradient(135deg, #2563eb, #1d4ed8);

                /* ---- Transparencias / superficies tipo tarjeta ---- */
                --card-bg: rgba(255, 255, 255, .6);
                --input-focus-bg: rgba(255, 255, 255, .9);
                --footer-bg: rgba(246, 248, 251, .85);
                --input-bg: rgba(255, 255, 255, .5);
                --icon-circle-bg: rgba(37, 99, 235, .1);
                --icon-circle-border: rgba(59, 130, 246, .25);
                --card-border: rgba(148, 163, 184, .25);
                --hairline: rgba(148, 163, 184, .2);
                --backdrop-blur: blur(10px);

                /* Espaciado */
                --sp-base: 4px;
                --sp-xs: 8px;
                --sp-sm: 12px;
                --sp-md: 16px;
                --sp-lg: 24px;
                --sp-xl: 32px;
                --sp-gutter: 24px;
                --sp-container-margin: 40px;

                /* Radios */
                --radius-default: 0.25rem;
                --radius-lg: 0.5rem;
                --radius-xl: 0.75rem;
                --radius-full: 9999px;

                /* Sombras */
                --shadow-soft-bloom: 0px 4px 20px rgba(30, 41, 59, 0.06);
                --shadow-elevation-2: 0px 10px 32px rgba(30, 41, 59, 0.12);
            }

            * {
                box-sizing: border-box;
            }

            body {
                margin: 0;
                background:
                    var(--gradient-overlay),

                    var(--bg-page);
                background-attachment: fixed;
                color: var(--on-surface);
                font-family: 'Inter', sans-serif;
                font-size: 14px;
                line-height: 20px;
                min-height: 100vh;
                display: flex;
                -webkit-font-smoothing: antialiased;
                transition: background 0.3s ease, color 0.3s ease;
            }

            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                user-select: none;
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

            .app-shell {
                flex: 1;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                overflow-x: hidden;
            }

            /* ---------- Navbar superior ---------- */
            .navbar {
                background: var(--footer-bg);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border-bottom: 1px solid var(--hairline);
                box-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
                position: sticky;
                top: 0;
                z-index: 30;
                width: 100%;
            }

            .navbar-inner {
                max-width: 1440px;
                margin: 0 auto;
                height: 64px;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 var(--sp-gutter);
            }

            .navbar-left {
                display: flex;
                align-items: center;
                gap: var(--sp-lg);
            }

            .brand {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
            }

            .brand .material-symbols-outlined {
                font-size: 32px;
                color: var(--link);
            }

            .brand-name {
                font-weight: 900;
                font-size: 20px;
                background: var(--gradient-accent);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }

            .nav-links {
                display: flex;
                align-items: center;
                gap: var(--sp-md);
                margin-left: var(--sp-lg);
            }

            .nav-links a {
                padding: 8px var(--sp-md);
                color: var(--on-surface-variant);
                border-radius: var(--radius-lg);
                transition: background-color 0.2s ease, color 0.2s ease;
            }

            .nav-links a:hover {
                background: var(--input-bg);
                color: var(--link-hover);
            }

            .nav-links a.active {
                color: var(--link);
                font-weight: 600;
                border-bottom: 2px solid;
                border-image: var(--gradient-accent) 1;
                border-radius: 0;
            }

            .search-wrap {
                flex: 1;
                max-width: 448px;
                margin: 0 var(--sp-lg);
                position: relative;
            }

            .search-wrap .material-symbols-outlined {
                position: absolute;
                left: var(--sp-md);
                top: 50%;
                transform: translateY(-50%);
                color: var(--on-surface-muted);
            }

            .search-wrap input {
                width: 100%;
                height: 40px;
                padding-left: 44px;
                padding-right: 16px;
                border-radius: var(--radius-full);
                border: 1px solid var(--border-soft);
                background: var(--input-bg);
                color: var(--on-surface);
                outline: none;
                transition: box-shadow 0.2s ease, border-color 0.2s ease, background 0.2s ease;
            }

            .search-wrap input::placeholder {
                color: var(--on-surface-muted);
            }

            .search-wrap input:focus {
                border-color: var(--primary-container);
                background: var(--input-focus-bg);
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
            }

            .navbar-right {
                display: flex;
                align-items: center;
                gap: 4px;
            }

            .icon-btn {
                padding: 8px;
                border-radius: var(--radius-full);
                color: var(--on-surface-muted);
                display: flex;
                position: relative;
                transition: background-color 0.2s ease, transform 0.1s ease, color 0.2s ease;
            }

            .icon-btn:hover {
                background: var(--input-bg);
                color: var(--link-hover);
            }

            .icon-btn:active {
                transform: scale(0.95);
            }

            .dot-badge {
                position: absolute;
                top: 4px;
                right: 4px;
                width: 8px;
                height: 8px;
                background: var(--error);
                border-radius: 50%;
            }

            .avatar-btn {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                overflow: hidden;
                border: 1px solid var(--outline-variant);
                margin-left: var(--sp-sm);
                transition: transform 0.1s ease;
            }

            .avatar-btn:active {
                transform: scale(0.95);
            }

            .avatar-btn img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: block;
            }

            /* Selector de estilo/tema en el navbar */
            .style-switcher {
                position: relative;
            }

            .style-switcher-menu {
                position: absolute;
                top: calc(100% + 8px);
                right: 0;
                background: var(--footer-bg);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border: 1px solid var(--card-border);
                border-radius: var(--radius-lg);
                box-shadow: var(--shadow-elevation-2);
                padding: 6px;
                display: none;
                flex-direction: column;
                min-width: 170px;
                z-index: 40;
            }

            .style-switcher-menu.open {
                display: flex;
                animation: dropdown-in 0.15s ease-out;
            }

            .style-switcher-menu button {
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 8px 10px;
                border-radius: var(--radius-default);
                font-size: 13px;
                color: var(--on-surface-labels);
                text-align: left;
            }

            .style-switcher-menu button:hover {
                background: var(--input-bg);
                color: #ffffff;
            }

            .swatch {
                width: 14px;
                height: 14px;
                border-radius: 50%;
                display: inline-block;
                border: 1px solid rgba(255, 255, 255, 0.2);
            }

            @keyframes dropdown-in {
                from {
                    opacity: 0;
                    transform: translateY(-6px);
                }

                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            /* ---------- Main content ---------- */
            main {
                flex: 1;
                padding: var(--sp-md);
                width: 100%;
                max-width: 1440px;
                margin: 0 auto;
                display: flex;
                flex-direction: column;
                gap: var(--sp-lg);
            }

            @media (min-width: 768px) {
                main {
                    padding: var(--sp-container-margin);
                }
            }

            .page-header {
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
            }

            @media (min-width: 768px) {
                .page-header {
                    flex-direction: row;
                    align-items: center;
                    justify-content: space-between;
                }
            }

            .page-header h1 {
                margin: 0;
                font-size: 24px;
                font-weight: 600;
                position: relative;
                display: inline-block;
                padding-bottom: 10px;
            }

            .page-header h1::after {
                content: "";
                position: absolute;
                left: 0;
                bottom: 0;
                width: 48px;
                height: 3px;
                border-radius: var(--radius-full);
                background: var(--gradient-accent);
            }

            @media (min-width: 768px) {
                .page-header h1 {
                    font-size: 28px;
                }
            }

            .page-header p {
                margin: 4px 0 0;
                color: var(--on-surface-variant);
            }

            .range-toggle {
                display: flex;
                align-items: center;
                gap: 4px;
                background: var(--card-bg);
                border: 1px solid var(--card-border);
                border-radius: var(--radius-lg);
                padding: 4px;
                box-shadow: var(--shadow-soft-bloom);
            }

            .range-toggle button {
                padding: 8px 12px;
                font-size: 12px;
                border-radius: var(--radius-default);
                color: var(--on-surface-muted);
                transition: background-color 0.2s ease, color 0.2s ease;
                display: flex;
                align-items: center;
                gap: 4px;
            }

            .range-toggle button.active {
                background: var(--gradient-button);
                color: #ffffff;
            }

            .range-toggle button:hover:not(.active) {
                background: var(--input-bg);
                color: var(--on-surface);
            }

            /* ---------- KPI cards ---------- */
            .kpi-grid {
                display: grid;
                grid-template-columns: 1fr;
                gap: var(--sp-lg);
            }

            @media (min-width: 768px) {
                .kpi-grid {
                    grid-template-columns: 1fr 1fr;
                }
            }

            @media (min-width: 1024px) {
                .kpi-grid {
                    grid-template-columns: repeat(4, 1fr);
                }
            }

            .kpi-card {
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-soft-bloom);
                display: flex;
                flex-direction: column;
                gap: var(--sp-sm);
                position: relative;
                overflow: hidden;
                opacity: 0;
                transform: translateY(12px);
                animation: card-in 0.5s ease forwards;
                transition: box-shadow 0.25s ease, transform 0.25s ease, border-color 0.25s ease;
            }

            .kpi-card:hover {
                box-shadow: var(--shadow-elevation-2);
                transform: translateY(-2px);
                border-color: rgba(96, 165, 250, 0.4);
            }

            .kpi-card::before {
                content: "";
                position: absolute;
                right: -16px;
                top: -16px;
                width: 96px;
                height: 96px;
                background: var(--icon-circle-bg);
                border-radius: 50%;
                filter: blur(24px);
                transition: opacity 0.25s ease;
                opacity: 0.6;
            }

            .kpi-card:hover::before {
                opacity: 1;
            }

            @keyframes card-in {
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .kpi-top {
                display: flex;
                justify-content: space-between;
                align-items: flex-start;
            }

            .kpi-label {
                font-size: 12px;
                font-weight: 500;
                color: var(--on-surface-muted);
            }

            .kpi-icon {
                padding: 8px;
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
                border-radius: var(--radius-lg);
                color: var(--link);
                display: flex;
            }

            .kpi-bottom {
                display: flex;
                align-items: flex-end;
                gap: var(--sp-sm);
                margin-top: auto;
            }

            .kpi-value {
                font-size: 36px;
                line-height: 44px;
                font-weight: 700;
                letter-spacing: -0.02em;
            }

            .kpi-trend {
                display: flex;
                align-items: center;
                gap: 2px;
                font-size: 12px;
                font-weight: 500;
                padding: 2px 8px;
                border-radius: var(--radius-full);
                margin-bottom: 4px;
            }

            .kpi-trend .material-symbols-outlined {
                font-size: 14px;
            }

            .trend-up {
                color: var(--success);
                background: rgba(16, 185, 129, 0.15);
            }

            .trend-down {
                color: var(--error);
                background: rgba(248, 113, 113, 0.15);
            }

            .trend-flat {
                color: var(--warning);
                background: rgba(245, 158, 11, 0.15);
            }

            /* ---------- Charts ---------- */
            .charts-grid {
                width: 100%;
                grid-template-columns: 1fr;
                gap: var(--sp-lg);
            }

            @media (min-width: 1024px) {
                .charts-grid {
                    grid-template-columns: 2fr 1fr;
                }
            }

            .panel {
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-soft-bloom);
                display: flex;
                flex-direction: column;
                min-height: 400px;
            }

            .panel-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: var(--sp-md);
                padding-bottom: var(--sp-sm);
                border-bottom: 1px solid var(--hairline);
            }

            .panel-header h2 {
                margin: 0;
                font-size: 20px;
                font-weight: 600;
            }

            .bar-chart {
                height: 280px;              /* altura fija — sin esto el % no tiene referencia */
                display: flex;
                align-items: flex-end;      /* las barras crecen desde abajo, no desde arriba */
                gap: 16px;
                padding: 0 16px;
            }

            .bar {
                flex: 1;
                background: linear-gradient(180deg, #3b82f6 0%, #2563eb 100%);
                border-radius: 6px 6px 0 0;
                min-height: 4px;            /* para que un valor de 0 siga siendo visible como línea */
                position: relative;
                transition: height 0.4s ease;
            }

            .bar-label {
                position: absolute;
                bottom: -24px;
                left: 50%;
                transform: translateX(-50%);
                font-size: 12px;
                color: var(--color-on-surface-variant);
                white-space: nowrap;
            }

            .bar::after {
                content: attr(data-height);
                position: absolute;
                top: -28px;
                left: 50%;
                transform: translateX(-50%) translateY(4px);
                background: var(--color-on-surface);
                color: #fff;
                font-size: 12px;
                font-weight: 600;
                padding: 4px 8px;
                border-radius: 4px;
                white-space: nowrap;
                opacity: 0;
                pointer-events: none;
                transition: opacity 0.15s ease, transform 0.15s ease;
            }

            .bar:hover::after {
                opacity: 1;
                transform: translateX(-50%) translateY(0);
            }

            .donut-wrap {
                flex: 1;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                gap: var(--sp-lg);
            }

            .donut {
                position: relative;
                width: 192px;
                height: 192px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                background: conic-gradient(#4F46E5 0% 0%, #818CF8 0% 0%, #C7D2FE 0% 0%);
                transition: background 1s ease-out;
            }

            .donut-inner {
                width: 128px;
                height: 128px;
                background: var(--surface-container-lowest);
                border: 1px solid var(--card-border);
                border-radius: 50%;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.3);
            }

            .donut-inner strong {
                font-size: 28px;
                font-weight: 700;
            }

            .donut-inner span {
                font-size: 12px;
                color: var(--on-surface-variant);
            }

            .legend {
                width: 100%;
                display: flex;
                flex-direction: column;
                gap: var(--sp-sm);
            }

            .legend-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
            }

            .legend-key {
                display: flex;
                align-items: center;
                gap: 8px;
            }

            .legend-dot {
                width: 12px;
                height: 12px;
                border-radius: 50%;
            }

            /* ---------- Tabla ---------- */
            .table-panel {
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-radius: var(--radius-xl);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-soft-bloom);
                overflow: hidden;
            }

            .table-panel-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: var(--sp-md);
                border-bottom: 1px solid var(--hairline);
            }

            .table-panel-header h2 {
                margin: 0;
                font-size: 20px;
                font-weight: 600;
            }

            .link-btn {
                font-size: 12px;
                font-weight: 500;
                color: var(--link);
                transition: color 0.2s ease;
            }

            .link-btn:hover {
                color: var(--link-hover);
            }

            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
            }

            thead tr {
                background: rgba(30, 41, 59, 0.4);
                border-bottom: 1px solid var(--hairline);
            }

            th {
                padding: var(--sp-md);
                font-size: 12px;
                font-weight: 500;
                color: var(--on-surface-muted);
            }

            td {
                padding: var(--sp-md);
                border-bottom: 1px solid var(--hairline);
                color: var(--on-surface-labels);
            }

            tbody tr {
                transition: background-color 0.2s ease;
            }

            tbody tr:hover {
                background: rgba(59, 130, 246, 0.06);
            }

            tbody tr:last-child td {
                border-bottom: none;
            }

            .user-cell {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
            }

            .user-cell img,
            .user-avatar-fallback {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                object-fit: cover;
            }

            .user-avatar-fallback {
                display: flex;
                align-items: center;
                justify-content: center;
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
                color: var(--link-hover);
                font-weight: 700;
                font-size: 13px;
            }

            .user-name {
                font-weight: 500;
                color: var(--on-surface);
            }

            .cell-muted {
                color: var(--on-surface-muted);
            }

            .status-badge {
                display: inline-flex;
                align-items: center;
                padding: 4px 8px;
                border-radius: var(--radius-full);
                font-size: 11px;
                font-weight: 500;
            }

            .status-completed {
                background: rgba(16, 185, 129, 0.15);
                color: var(--success);
            }

            .status-failed {
                background: rgba(248, 113, 113, 0.15);
                color: var(--error);
            }

            .status-pending {
                background: rgba(245, 158, 11, 0.15);
                color: var(--warning);
            }

            .col-right {
                text-align: right;
            }

        </style>
    </head>

    <body>

        <c:if test="${not empty errorMsg}">
            <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
                <strong>Error:</strong> ${errorMsg}
            </div>
        </c:if>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />

        <div class="app-shell">



            <!-- Contenido principal -->
            <main>
                <div class="page-header">
                    <div>
                        <h1>👋🏻 Hola ${name}, Resumen del Dashboard</h1>
                        <p>Esto es lo que está pasando con tus tickets hoy.</p>
                    </div>
                </div>

                <!-- KPI cards -->
                <div class="kpi-grid">
                    <div class="kpi-card" style="animation-delay:0.15s">
                        <div class="kpi-top">
                            <span class="kpi-label">Agentes sin Asignar</span>
                            <div class="kpi-icon"><span class="material-symbols-outlined">group</span></div>
                        </div>
                        <div class="kpi-bottom">
                            <span class="kpi-value" data-count="${agents.sinAsignar}">0</span>
                            <span style="font-size:16px; color:var(--on-surface-muted); margin: 0 4px;">de</span>
                            <span class="kpi-value" data-count="${agents.total}">0</span>                        </div>
                    </div>
                    <div class="kpi-card" style="animation-delay:0.25s">
                        <div class="kpi-top">
                            <span class="kpi-label">Tasa de resolucion de tickets</span>
                            <div class="kpi-icon"><span class="material-symbols-outlined">trending_up</span></div>
                        </div>
                        <div class="kpi-bottom">
                            <span class="kpi-value" data-count="${resolvedTickets}" data-suffix="%"></span>

                        </div>
                    </div>
                    <div class="kpi-card" style="animation-delay:0.35s">
                        <div class="kpi-top">
                            <span class="kpi-label">Tasa de cancelación de tickets</span>
                            <div class="kpi-icon"><span class="material-symbols-outlined">trending_down</span></div>
                        </div>
                        <div class="kpi-bottom">
                            <span class="kpi-value" data-count="${cancelledTickets}" data-suffix="%"></span>

                        </div>
                    </div>
                </div>

                <!-- Gráficos -->
                <div class="charts-grid">
                    <div class="panel">
                        <div class="panel-header">
                            <h2>Tickets por Estado</h2>
                        </div>
                        <div style="position: relative; height: 280px;">
                            <canvas id="stateTicketsChart"></canvas>
                        </div>
                    </div>


                </div>


            </main>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
        <script>
            // 1. Contador animado para las tarjetas KPI
            function animateCount(el) {
                const target = parseFloat(el.dataset.count);
                const prefix = el.dataset.prefix || "";
                const suffix = el.dataset.suffix || "";
                const isDecimal = String(target).includes(".");
                const duration = 1200;
                const start = performance.now();

                function tick(now) {
                    const progress = Math.min((now - start) / duration, 1);
                    const eased = 1 - Math.pow(1 - progress, 3); // ease-out cubic
                    const value = target * eased;
                    el.textContent = prefix + (isDecimal ? value.toFixed(1) : Math.round(value).toLocaleString('es-ES')) + suffix;
                    if (progress < 1)
                        requestAnimationFrame(tick);
                }
                requestAnimationFrame(tick);
            }

            document.querySelectorAll('.kpi-value[data-count]').forEach(el => {
                setTimeout(() => animateCount(el), 300);
            });


            const stateLabels = [
            <c:forEach var="entry" items="${stateTickets}" varStatus="loop">"${entry.key}"<c:if test="${!loop.last}">,</c:if></c:forEach>
            ];
            const stateData = [
            <c:forEach var="entry" items="${stateTickets}" varStatus="loop">${entry.value}<c:if test="${!loop.last}">,</c:if></c:forEach>
            ];

            const ctxState = document.getElementById('stateTicketsChart');
            if (ctxState) {
                new Chart(ctxState, {
                    type: 'bar',
                    data: {
                        labels: stateLabels,
                        datasets: [{
                                label: 'Tickets',
                                data: stateData,
                                backgroundColor: 'rgba(59,130,246,0.85)',
                                hoverBackgroundColor: '#2563eb',
                                borderRadius: 6,
                                maxBarThickness: 48
                            }]
                    },
                    options: {
                        responsive: true,
                        maintainAspectRatio: false,
                        animation: {duration: 900, easing: 'easeOutCubic'},
                        plugins: {
                            legend: {display: false},
                            tooltip: {
                                backgroundColor: '#1e293b',
                                padding: 10,
                                cornerRadius: 6,
                                callbacks: {label: (ctx) => ctx.parsed.y + ' tickets'}
                            }
                        },
                        scales: {
                            y: {beginAtZero: true, ticks: {precision: 0}, grid: {color: 'rgba(148,163,184,0.15)'}},
                            x: {grid: {display: false}}
                        }
                    }
                });
            }

            // 4. Selector de rango de fechas (7 días / 30 días / personalizado)
            document.querySelectorAll('.range-toggle button').forEach(btn => {
                btn.addEventListener('click', () => {
                    document.querySelectorAll('.range-toggle button').forEach(b => b.classList.remove('active'));
                    btn.classList.add('active');
                });
            });


        </script>
    </body>

</html>