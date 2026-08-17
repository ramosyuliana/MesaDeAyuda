<%-- 
    Document   : TopNavBar
    Created on : 11/08/2026, 8:44:24 p. m.
    Author     : julil
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>

    :root {
        /* ---- Fondo ---- */
        --bg-page: #eef2f7;
        --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));

        /* ---- Superficies ---- */
        --surface-container-low: #e9eef5;
        --surface-container-high: #dbe2ee;

        /* ---- Texto ---- */
        --on-surface: #1e293b;
        --on-surface-labels: #334155;
        --on-surface-variant: #51607a;
        --on-surface-muted: #6b7a97;
        --on-surface-faint: #94a3b8;

        /* ---- Bordes ---- */
        --hairline: rgba(148,163,184,.25);

        /* ---- Acentos ---- */
        --link: #3b82f6;
        --link-hover: #2563eb;
        --primary: #2563eb;
        --primary-container: #3b82f6;

        /* ---- Estados ---- */
        --error: #dc2626;
        --success: #059669;
        --warning: #d97706;

        /* ---- Degradados ---- */
        --gradient-accent: linear-gradient(90deg, #38bdf8, #6366f1);

        /* ---- Superficies glass ---- */
        --card-bg: rgba(255,255,255,.8);
        --card-border: rgba(148,163,184,.25);
        --card-blur: blur(12px);
        --input-bg: rgba(255,255,255,.5);
        --input-border: #d7dfec;
        --input-focus-bg: rgba(255,255,255,.9);
        --input-focus-border: #3b82f6;
        --input-focus-glow: 0 0 0 4px rgba(59,130,246,.16);
        --icon-circle-bg: rgba(59,130,246,.1);

        /* ---- Sombras ---- */
        --shadow-rest: 0 4px 20px rgba(30,41,59,0.06);
        --shadow-hover: 0 12px 32px rgba(30,41,59,0.12);

        /* ---- Radios ---- */
        --radius-lg: 0.875rem;
        --radius-full: 9999px;

        /* ---- Espaciado ---- */
        --sp-md: 24px;
        --sp-gutter: 24px;
        --container-max: 1280px;

        /* ---- Movimiento ---- */
        --t-fast: .2s cubic-bezier(.4,0,.2,1);
        --t-base: .25s cubic-bezier(.4,0,.2,1);
        --t-slow: .3s cubic-bezier(.4,0,.2,1);
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
        padding-top: 64px;
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

    :focus-visible {
        outline: 2px solid var(--input-focus-border);
        outline-offset: 2px;
        border-radius: 6px;
    }

    .material-symbols-outlined {
        font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
        user-select: none;
    }

    /* ---------- Panel glass ---------- */
    .glass-panel {
        background-color: var(--card-bg);
        backdrop-filter: var(--card-blur);
        -webkit-backdrop-filter: var(--card-blur);
        border: 1px solid var(--card-border);
        box-shadow: var(--shadow-rest);
    }

    /* ---------- Revelado inicial ---------- */
    .reveal {
        opacity: 0;
        transform: translateY(12px);
    }
    .reveal.is-in {
        opacity: 1;
        transform: none;
        transition: opacity .5s cubic-bezier(.4,0,.2,1), transform .5s cubic-bezier(.4,0,.2,1);
    }

    /* ---------- Barra superior ---------- */
    header.topbar {
        position: fixed;
        top: 0;
        left: 0;
        right: 0;
        z-index: 50;
        border-radius: 0;
        border-left: none;
        border-right: none;
        border-top: none;
    }
    header.topbar::after {
        content: '';
        position: absolute;
        left: 0;
        right: 0;
        bottom: -1px;
        height: 2px;
        background: var(--gradient-accent);
        opacity: .75;
    }

    .topbar-inner {
        display: flex;
        justify-content: space-between;
        align-items: center;
        width: 100%;
        height: 64px;
        padding: 0 var(--sp-gutter);
        max-width: var(--container-max);
        margin: 0 auto;
    }

    .topbar-left {
        display: flex;
        align-items: center;
        gap: var(--sp-md);
    }

    .brand {
        display: flex;
        align-items: center;
        gap: 8px;
    }
    .brand .material-symbols-outlined {
        color: var(--primary-container);
        font-size: 30px;
        transition: transform var(--t-slow);
    }
    .brand:hover .material-symbols-outlined {
        transform: rotate(-8deg) scale(1.06);
    }
    .brand span.name {
        font-family: 'Manrope', sans-serif;
        font-weight: 700;
        font-size: 20px;
        background: var(--gradient-accent);
        -webkit-background-clip: text;
        background-clip: text;
        color: transparent;
    }

    /* ---------- Navegación de Escritorio ---------- */
    .topbar-nav {
        display: none;
        gap: var(--sp-md);
    }
    @media (min-width: 768px) {
        .topbar-nav {
            display: flex;
        }
    }

    .topbar-nav a {
        color: var(--on-surface-variant);
        font-weight: 500;
        font-size: 14px;
        position: relative;
        padding-bottom: 4px;
        transition: color var(--t-fast);
    }
    .topbar-nav a::after {
        content: '';
        position: absolute;
        left: 0;
        bottom: 0;
        height: 2px;
        width: 100%;
        border-radius: 2px;
        background: var(--gradient-accent);
        transform: scaleX(0);
        transform-origin: left;
        transition: transform var(--t-base);
    }
    .topbar-nav a:hover {
        color: var(--link);
    }
    .topbar-nav a:hover::after {
        transform: scaleX(1);
    }
    .topbar-nav a.active {
        color: var(--primary);
        font-weight: 700;
    }
    .topbar-nav a.active::after {
        transform: scaleX(1);
    }

    .topbar-right {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    /* ---------- Botones de icono y Menú Hamburguesa ---------- */
    .icon-btn {
        position: relative;
        color: var(--on-surface-muted);
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 6px;
        border-radius: var(--radius-full);
        transition: color var(--t-fast), background var(--t-fast), transform var(--t-fast);
    }
    .icon-btn:hover {
        color: var(--link);
        background: var(--icon-circle-bg);
    }
    .icon-btn:active {
        transform: scale(0.94);
    }

    /* Botón hamburguesa visible solo en móviles */
    .hamburger-btn {
        display: flex;
    }
    @media (min-width: 768px) {
        .hamburger-btn {
            display: none;
        }
    }

    /* Punto rojo de notificaciones sin leer */
    .dot-badge {
        position: absolute;
        top: 4px;
        right: 4px;
        width: 8px;
        height: 8px;
        background: var(--error);
        border-radius: 50%;
        box-shadow: 0 0 0 2px rgba(255,255,255,.7);
    }

    /* ---------- Menú Desplegable Móvil ---------- */
    .mobile-menu {
        position: absolute;
        top: 64px;
        left: 0;
        width: 100%;
        background-color: var(--card-bg);
        backdrop-filter: var(--card-blur);
        -webkit-backdrop-filter: var(--card-blur);
        border-bottom: 1px solid var(--card-border);
        box-shadow: var(--shadow-hover);
        display: flex;
        flex-direction: column;
        padding: 16px 24px;
        gap: 16px;
        max-height: 0;
        overflow: hidden;
        opacity: 0;
        transition: max-height var(--t-slow), opacity var(--t-fast), padding var(--t-fast);
    }
    .mobile-menu.open {
        max-height: 300px;
        opacity: 1;
        padding: 20px 24px;
    }
    .mobile-menu nav {
        display: flex;
        flex-direction: column;
        gap: 12px;
    }
    .mobile-menu nav a {
        font-size: 16px;
        font-weight: 500;
        color: var(--on-surface-variant);
        padding: 8px 12px;
        border-radius: 8px;
        transition: background var(--t-fast), color var(--t-fast);
    }
    .mobile-menu nav a:hover,
    .mobile-menu nav a.active {
        background: var(--icon-circle-bg);
        color: var(--primary);
        font-weight: 600;
    }

    /* Ocultar menú móvil en escritorio */
    @media (min-width: 768px) {
        .mobile-menu {
            display: none !important;
        }
    }

    .user-name {
        display: none;
        font-size: 14px;
        color: var(--on-surface-labels);
        font-weight: 500;
    }
    @media (min-width: 1024px) {
        .user-name {
            display: inline;
        }
    }

    /* ---------- Accesibilidad ---------- */
    @media (prefers-reduced-motion: reduce) {
        *, *::before, *::after {
            animation-duration: .001ms !important;
            animation-iteration-count: 1 !important;
            transition-duration: .001ms !important;
        }
        .reveal {
            opacity: 1;
            transform: none;
        }
    }
</style>

<header class="topbar glass-panel">
    <div class="topbar-inner">
        <div class="topbar-left">
            <!-- Botón Hamburguesa -->
            <button class="icon-btn hamburger-btn" id="hamburgerToggle" aria-label="Abrir menú de navegación">
                <span class="material-symbols-outlined" id="hamburgerIcon">menu</span>
            </button>

            <div class="brand">
                <a href="${pageContext.request.contextPath}/AuthServlet?action=logout"><span class="material-symbols-outlined">support_agent</span></a>
                <span class="name">TableHelp</span>
            </div>

            <!-- Enlaces de navegación para Escritorio -->
            <c:if test="${user.role.name == 'Agente'}">
                <nav class="topbar-nav">
                    <a href="${pageContext.request.contextPath}/AgentServlet?action=dashboard">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/TicketServlet?action=tickets">Tickets</a>
                </nav>
            </c:if>
            <c:if test="${user.role.name == 'Solicitante'}">
                <nav class="topbar-nav">
                    <a href="${pageContext.request.contextPath}/ApplicantServlet?action=dashboard">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/TicketServlet?action=new">Crear Ticket</a>
                    <a href="${pageContext.request.contextPath}/TicketServlet?action=tickets" >Mis Tickets</a>
                </nav>
            </c:if>
            <c:if test="${user.role.name == 'Administrador'}">
                <nav class="topbar-nav">
                    <a href="${pageContext.request.contextPath}/AdminServlet?action=dashboard">Dashboard</a>
                    <a href="${pageContext.request.contextPath}/TicketServlet?action=tickets">Todos Los Tickets</a>
                    <a href="${pageContext.request.contextPath}/AdminServlet?action=manageUsers">Usuarios</a>
                </nav>
            </c:if>
        </div>

        <div class="topbar-right">
            <!-- Información y Avatar del usuario -->
            <div class="user-info-container" style="display: flex; align-items: center; gap: 12px;">
                <div class="user-details" style="text-align: right; line-height: 1.2;">
                    <span style="display: block; font-size: 13px; font-weight: 600; color: var(--on-surface);">
                        <c:out value="${user.name}" />
                    </span>
                    <span style="display: block; font-size: 11px; font-weight: 500; color: var(--on-surface-variant);">
                        <c:out value="${user.role.name}" />
                    </span>
                </div>
            </div>

            <!-- Separador vertical sutil -->
            <div style="width: 1px; height: 24px; background-color: var(--hairline); margin: 0 4px;"></div>

            <c:if test="${user.role.name == 'Solicitante'}">

                <!-- Botón de notificaciones -->
                <button class="icon-btn" aria-label="Notificaciones">
                    <a href="${pageContext.request.contextPath}/NotificationServlet?action=notifications"><span class="material-symbols-outlined">notifications</span></a>
                </button>
            </c:if>
        </div>
    </div>

    <!-- Panel del Menú Desplegable Móvil -->
    <div class="mobile-menu" id="mobileMenu">
        <c:if test="${user.role.name == 'Agente'}">
            <nav>
                <a href="${pageContext.request.contextPath}/AgentServlet?action=dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/TicketServlet?action=tickets">Tickets</a>
            </nav>
        </c:if>
        <c:if test="${user.role.name == 'Solicitante'}">
            <nav>
                <a href="${pageContext.request.contextPath}/ApplicantServlet?action=dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/TicketServlet?action=new">Crear Ticket</a>
                <a href="${pageContext.request.contextPath}/TicketServlet?action=tickets">Mis Tickets</a>
            </nav>
        </c:if>
        <c:if test="${user.role.name == 'Administrador'}">
            <nav>
                <a href="${pageContext.request.contextPath}/AdminServlet?action=dashboard">Dashboard</a>
                <a href="${pageContext.request.contextPath}/AdminServlet?action=manage">Todos Los Tickets</a>
                <a href="${pageContext.request.contextPath}/AdminServlet?action=manageUsers">Usuarios</a>
            </nav>
        </c:if>
    </div>
</header>

<script>
    (function () {
        'use strict';

        var reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

        /* Aparicion suave de la barra al cargar la pagina */
        function setupReveal() {
            var topbar = document.querySelector('header.topbar');
            if (!topbar) {
                return;
            }

            topbar.classList.add('reveal');

            if (reduced) {
                topbar.classList.add('is-in');
                return;
            }

            requestAnimationFrame(function () {
                topbar.classList.add('is-in');
            });
        }

        /* Marca como activo el enlace que corresponde a la pagina actual tanto en desktop como en mobile */
        function setupActiveLink() {
            var links = document.querySelectorAll('.topbar-nav a, .mobile-menu nav a');
            var path = window.location.pathname;

            Array.prototype.forEach.call(links, function (link) {
                var href = link.getAttribute('href');
                if (href && href !== '#' && path.indexOf(href) !== -1) {
                    link.classList.add('active');
                }
            });
        }

        /* Control de apertura y cierre del menú hamburguesa */
        function setupMobileMenu() {
            var toggleBtn = document.getElementById('hamburgerToggle');
            var mobileMenu = document.getElementById('mobileMenu');
            var hamburgerIcon = document.getElementById('hamburgerIcon');

            if (!toggleBtn || !mobileMenu)
                return;

            toggleBtn.addEventListener('click', function () {
                var isOpen = mobileMenu.classList.toggle('open');
                hamburgerIcon.textContent = isOpen ? 'close' : 'menu';
            });

            // Cerrar menú al hacer clic en cualquier enlace del menú móvil
            var mobileLinks = mobileMenu.querySelectorAll('a');
            Array.prototype.forEach.call(mobileLinks, function (link) {
                link.addEventListener('click', function () {
                    mobileMenu.classList.remove('open');
                    hamburgerIcon.textContent = 'menu';
                });
            });
        }

        function init() {
            setupReveal();
            setupActiveLink();
            setupMobileMenu();
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', init);
        } else {
            init();
        }
    })();
</script>