<%-- 
    Document   : TopNavBar
    Created on : 11/08/2026, 8:44:24 p. m.
    Author     : julil
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

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
        --card-bg: rgba(255,255,255,.6);
        --card-border: rgba(148,163,184,.25);
        --card-blur: blur(10px);
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
        /* Deja espacio para la barra fija */
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
    .icon-filled {
        font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
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
        gap: var(--sp-md);
    }

    /* ---------- Buscador ---------- */
    .topbar-search {
        position: relative;
        display: none;
    }
    @media (min-width: 640px) {
        .topbar-search {
            display: block;
        }
    }

    .topbar-search .material-symbols-outlined {
        position: absolute;
        left: 12px;
        top: 50%;
        transform: translateY(-50%);
        color: var(--on-surface-muted);
        transition: color var(--t-fast);
    }
    .topbar-search:focus-within .material-symbols-outlined {
        color: var(--input-focus-border);
    }
    .topbar-search input {
        padding: 8px 16px 8px 40px;
        border-radius: var(--radius-full);
        background: var(--input-bg);
        border: 1px solid var(--input-border);
        font-size: 14px;
        width: 256px;
        outline: none;
        color: var(--on-surface);
        transition: border-color var(--t-fast), box-shadow var(--t-fast), background var(--t-fast), width var(--t-slow);
    }
    .topbar-search input::placeholder {
        color: var(--on-surface-faint);
    }
    .topbar-search input:focus {
        border-color: var(--input-focus-border);
        background: var(--input-focus-bg);
        box-shadow: var(--input-focus-glow);
        width: 288px;
    }

    /* ---------- Botones de icono ---------- */
    .icon-btn {
        position: relative;
        color: var(--on-surface-muted);
        display: flex;
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
    .dot-badge::after {
        content: '';
        position: absolute;
        inset: 0;
        border-radius: 50%;
        background: var(--error);
        animation: pulse-dot 2.4s ease-out infinite;
    }
    @keyframes pulse-dot {
        0%   {
            transform: scale(1);
            opacity: .6;
        }
        70%  {
            transform: scale(2.6);
            opacity: 0;
        }
        100% {
            transform: scale(2.6);
            opacity: 0;
        }
    }

    /* Contador numerico de notificaciones */
    .count-badge {
        position: absolute;
        top: 0;
        right: 0;
        min-width: 18px;
        height: 18px;
        padding: 0 5px;
        background: var(--error);
        color: #fff;
        border-radius: var(--radius-full);
        font-size: 11px;
        font-weight: 600;
        line-height: 18px;
        text-align: center;
        box-shadow: 0 0 0 2px rgba(255,255,255,.7);
    }

    /* ---------- Avatar con iniciales ---------- */
    .avatar {
        height: 32px;
        width: 32px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        border: 1px solid var(--card-border);
        background: var(--surface-container-high);
        color: var(--primary);
        font-weight: 600;
        font-size: 13px;
        transition: transform var(--t-base), box-shadow var(--t-base);
    }
    .avatar:hover {
        transform: scale(1.06);
        box-shadow: var(--shadow-hover);
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
            <div class="brand">
                <span class="material-symbols-outlined">support_agent</span>
                <span class="name">TableHelp</span>
            </div>
            <c:if test="${user.role.name == 'Agente'}">
                <nav class="topbar-nav">
                    <a href="#">Dashboard</a>
                    <a href="#">Tickets</a>
                </nav>
            </c:if>
            <c:if test="${user.role.name == 'Solicitante'}">
                <nav class="topbar-nav">
                    <a href="#">Dashboard</a>
                    <a href="#">Crear Ticket</a>
                    <a href="#">Mis Tickets</a>
                </nav>
            </c:if>
            <c:if test="${user.role.name == 'Administrador'}">
                <nav class="topbar-nav">
                    <a href="#">Dashboard</a>
                    <a href="#">Todos Los Tickets</a>
                </nav>
            </c:if>
        </div>
        <div class="topbar-right">
            <button class="icon-btn" aria-label="Notificaciones">
                <span class="material-symbols-outlined">notifications</span>
                <span class="dot-badge"></span>
            </button>
        </div>
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

        /* Marca como activo el enlace que corresponde a la pagina actual */
        function setupActiveLink() {
            var links = document.querySelectorAll('.topbar-nav a');
            var path = window.location.pathname;

            Array.prototype.forEach.call(links, function (link) {
                var href = link.getAttribute('href');
                if (href && href !== '#' && path.indexOf(href) !== -1) {
                    link.classList.add('active');
                }
            });
        }

        function init() {
            setupReveal();
            setupActiveLink();
        }

        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', init);
        } else {
            init();
        }
    })();
</script>
