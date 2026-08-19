<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html class="h-full" lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Login - Mesa de Ayuda CIMM</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Manrope:wght@600;700;800&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                /* ---- Fondo y superficies (claro, azul-grisáceo) ---- */
                --bg-page: #eef2f7;
                --surface-container-lowest: #f6f8fb;
                --surface-container-low: #e9eef5;
                --surface-container: #e2e8f2;
                --surface-container-high: #dbe2ee;

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

                /* ---- Acentos azules ---- */
                --link: #3b82f6;
                --link-hover: #2563eb;
                --primary: #2563eb;
                --primary-container: #3b82f6;
                --primary-hover: #1d4ed8;

                --error: #dc2626;
                --success: #16a34a;

                /* ---- Degradados ---- */
                --gradient-overlay: linear-gradient(135deg, rgba(224,231,242,.92), rgba(219,230,250,.8), rgba(214,238,242,.85));
                --gradient-accent: linear-gradient(90deg, #38bdf8, #6366f1);
                --gradient-button: linear-gradient(135deg, #3b82f6, #2563eb);
                --gradient-button-hover: linear-gradient(135deg, #2563eb, #1d4ed8);

                /* ---- Transparencias / superficies tipo "glass" ---- */
                --card-bg: rgba(255,255,255,.65);
                --input-bg: rgba(255,255,255,.55);
                --input-focus-bg: rgba(255,255,255,.9);
                --footer-bg: rgba(246,248,251,.85);
                --icon-circle-bg: rgba(37,99,235,.1);
                --icon-circle-border: rgba(59,130,246,.25);
                --card-border: rgba(148,163,184,.28);
                --hairline: rgba(148,163,184,.22);

                /* ---- Sombras ---- */
                --shadow-soft-bloom: 0px 4px 20px rgba(30,41,59,0.06);
                --shadow-card: 0 25px 50px -12px rgba(30,41,59,0.15);

                --radius-lg: 0.625rem;
                --radius-xl: 1rem;
                --radius-full: 9999px;
            }

            * {
                box-sizing: border-box;
            }

            /* Antes: html tenía "height: 100%" fijo mientras body tenía
               "min-height: 100vh; height: auto" — cuando el contenido real
               (navbar + hero + sección "Cómo funciona" + footer) supera un
               viewport, html queda más corto que su propio contenido y eso
               produce el efecto de doble barra de scroll. Se deja que html
               crezca de forma natural con su contenido: un solo dueño del
               scroll (el documento), sin altura fija compitiendo con body. */
            html {
                min-height: 100%;
            }

            body {
                margin: 0;
                background: var(--gradient-overlay), var(--bg-page);
                background-attachment: fixed;
                color: var(--on-surface);
                font-family: 'Inter', sans-serif;
                min-height: 100vh;
                display: flex;
                flex-direction: column;
                -webkit-font-smoothing: antialiased;
                overflow-x: hidden;
            }

            ::selection {
                background: var(--primary);
                color: #ffffff;
            }

            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                user-select: none;
            }

            a {
                text-decoration: none;
            }
            button {
                font-family: inherit;
                cursor: pointer;
                border: none;
            }

            /* ---------- Navbar ---------- */
            .navbar {
                position: relative;
                z-index: 20;
                background: var(--footer-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-bottom: 1px solid var(--hairline);
            }
            .navbar-inner {
                max-width: 1280px;
                margin: 0 auto;
                padding: 16px 24px;
                display: flex;
                align-items: center;
                justify-content: space-between;
            }
            .navbar-brand {
                display: flex;
                align-items: center;
                gap: 10px;
                font-family: 'Manrope', sans-serif;
                font-weight: 800;
                font-size: 18px;
                color: var(--on-surface);
                opacity: 0;
                animation: fade-down .6s ease forwards;
            }
            .navbar-brand .material-symbols-outlined {
                color: var(--primary);
                font-size: 26px;
            }
            .navbar-links {
                display: none;
                align-items: center;
                gap: 28px;
                font-size: 14px;
                font-weight: 500;
                color: var(--on-surface-variant);
            }
            @media (min-width: 768px) {
                .navbar-links {
                    display: flex;
                }
            }
            .navbar-links a {
                position: relative;
                color: var(--on-surface-variant);
                transition: color .2s ease;
                padding-bottom: 2px;
            }
            .navbar-links a::after {
                content: "";
                position: absolute;
                left: 0;
                bottom: -2px;
                width: 0%;
                height: 2px;
                background: var(--gradient-accent);
                transition: width .25s ease;
            }
            .navbar-links a:hover {
                color: var(--primary);
            }
            .navbar-links a:hover::after {
                width: 100%;
            }
            .navbar-status {
                display: flex;
                align-items: center;
                gap: 8px;
                font-size: 13px;
                color: var(--on-surface-muted);
                opacity: 0;
                animation: fade-down .6s ease .1s forwards;
            }
            .status-dot {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: var(--success);
                box-shadow: 0 0 0 0 rgba(22,163,74,.6);
                animation: pulse-dot 2s infinite;
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

            /* ---------- Main ---------- */
            main {
                flex-grow: 1;
                position: relative;
            }

            .bg-photo {
                position: absolute;
                inset: 0;
                z-index: 0;
                overflow: hidden;
            }
            .bg-photo img {
                position: absolute;
                inset: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                opacity: 0.18;
                filter: blur(2px);
                transform: scale(1.05);
            }
            .bg-photo::after {
                content: "";
                position: absolute;
                inset: 0;
                background: var(--gradient-overlay);
            }

            /* Blobs decorativos flotantes */
            .blob {
                position: absolute;
                border-radius: 50%;
                filter: blur(60px);
                opacity: .35;
                z-index: 0;
                pointer-events: none;
                animation: float-blob 10s ease-in-out infinite;
            }
            .blob-1 {
                width: 320px;
                height: 320px;
                top: -80px;
                left: -100px;
                background: #60a5fa;
            }
            .blob-2 {
                width: 280px;
                height: 280px;
                bottom: -60px;
                right: -80px;
                background: #818cf8;
                animation-delay: -3s;
            }
            .blob-3 {
                width: 200px;
                height: 200px;
                top: 40%;
                right: 10%;
                background: #38bdf8;
                animation-delay: -6s;
            }
            @keyframes float-blob {
                0%, 100% {
                    transform: translate(0,0) scale(1);
                }
                50% {
                    transform: translate(20px,-30px) scale(1.08);
                }
            }

            /* ---------- Hero + Split layout ---------- */
            .hero-wrap {
                position: relative;
                z-index: 10;
                max-width: 1280px;
                margin: 0 auto;
                padding: 56px 24px;
                display: flex;
                flex-direction: column;
                gap: 48px;
                align-items: center;
            }
            @media (min-width: 1024px) {
                .hero-wrap {
                    flex-direction: row;
                    align-items: center;
                    justify-content: space-between;
                    padding: 80px 40px;
                }
            }

            /* ---- Columna izquierda: presentación ---- */
            .hero-info {
                max-width: 520px;
                opacity: 0;
                transform: translateX(-24px);
                animation: slide-in-left .7s ease .15s forwards;
            }
            @keyframes slide-in-left {
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }

            .hero-badge {
                display: inline-flex;
                align-items: center;
                gap: 8px;
                padding: 6px 14px;
                border-radius: var(--radius-full);
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
                color: var(--primary);
                font-size: 12px;
                font-weight: 600;
                margin-bottom: 20px;
            }
            .hero-badge .material-symbols-outlined {
                font-size: 16px;
            }

            .hero-info h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 40px;
                font-weight: 800;
                line-height: 1.15;
                letter-spacing: -0.02em;
                margin: 0 0 16px;
                color: var(--on-surface);
            }
            .hero-info h1 span {
                background: var(--gradient-button);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }
            .hero-info p.lead {
                font-size: 16px;
                color: var(--on-surface-variant);
                line-height: 1.6;
                margin: 0 0 32px;
            }

            .feature-list {
                display: flex;
                flex-direction: column;
                gap: 16px;
                margin-bottom: 12px;
            }
            .feature-item {
                display: flex;
                align-items: flex-start;
                gap: 14px;
                padding: 14px 16px;
                border-radius: var(--radius-lg);
                background: var(--card-bg);
                border: 1px solid var(--card-border);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                opacity: 0;
                transform: translateY(14px);
                animation: rise-in .55s ease forwards;
            }
            .feature-item:nth-child(1) {
                animation-delay: .3s;
            }
            .feature-item:nth-child(2) {
                animation-delay: .42s;
            }
            .feature-item:nth-child(3) {
                animation-delay: .54s;
            }
            @keyframes rise-in {
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .feature-icon {
                display: flex;
                align-items: center;
                justify-content: center;
                width: 38px;
                height: 38px;
                min-width: 38px;
                border-radius: 10px;
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
            }
            .feature-icon .material-symbols-outlined {
                color: var(--primary);
                font-size: 20px;
            }
            .feature-text h3 {
                margin: 0 0 2px;
                font-size: 14px;
                font-weight: 600;
                color: var(--on-surface-labels);
            }
            .feature-text p {
                margin: 0;
                font-size: 13px;
                color: var(--on-surface-muted);
                line-height: 1.4;
            }

            /* ---------- Tarjeta de login (glass) ---------- */
            .login-card {
                position: relative;
                z-index: 10;
                width: 100%;
                max-width: 440px;
                border-radius: var(--radius-xl);
                padding: 32px;
                overflow: hidden;
                background: var(--card-bg);
                backdrop-filter: blur(16px);
                -webkit-backdrop-filter: blur(16px);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-card);
                opacity: 0;
                transform: translateY(16px);
                animation: card-in 0.5s ease .1s forwards;
                flex-shrink: 0;
            }
            @keyframes card-in {
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .login-card .accent-line {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 4px;
                background: var(--gradient-accent);
                background-size: 200% 100%;
                animation: accent-shift 4s linear infinite;
            }
            @keyframes accent-shift {
                0% {
                    background-position: 0% 0;
                }
                100% {
                    background-position: 200% 0;
                }
            }

            .login-header {
                text-align: center;
                margin-bottom: 32px;
                padding-top: 16px;
            }

            .login-icon {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 56px;
                height: 56px;
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
                border-radius: 50%;
                margin-bottom: 16px;
                transition: transform .3s ease;
            }
            .login-icon:hover {
                transform: rotate(-8deg) scale(1.06);
            }
            .login-icon .material-symbols-outlined {
                color: var(--primary);
                font-size: 30px;
            }

            .login-header h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 19px;
                font-weight: 700;
                color: var(--on-surface);
                letter-spacing: -0.01em;
                margin: 0;
            }
            .login-header p {
                font-size: 12px;
                color: var(--on-surface-muted);
                margin: 4px 0 0;
            }

            /* ---------- Formulario ---------- */
            form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .field {
                display: flex;
                flex-direction: column;
                gap: 6px;
            }
            .field label {
                font-size: 14px;
                font-weight: 600;
                color: var(--on-surface-labels);
            }
            .field-input-wrap {
                position: relative;
                display: flex;
                align-items: center;
            }
            .field-input-wrap .material-symbols-outlined {
                position: absolute;
                left: 12px;
                font-size: 18px;
                color: var(--on-surface-faint);
                transition: color 0.2s ease;
            }
            .field-input-wrap input {
                width: 100%;
                padding: 12px 16px 12px 40px;
                border: 1px solid var(--border-soft);
                background: var(--input-bg);
                border-radius: var(--radius-lg);
                font-size: 14px;
                color: var(--on-surface);
                outline: none;
                transition: border-color 0.2s ease, box-shadow 0.2s ease, background 0.2s ease;
            }
            .field-input-wrap input::placeholder {
                color: var(--on-surface-faint);
            }
            .field-input-wrap input:focus {
                border-color: var(--primary);
                background: var(--input-focus-bg);
                box-shadow: 0 0 0 4px rgba(59,130,246,0.15);
            }
            .field-input-wrap input:focus + .material-symbols-outlined,
            .field-input-wrap:focus-within .material-symbols-outlined {
                color: var(--primary);
            }
            .field-input-wrap.shake {
                animation: shake .4s ease;
            }
            @keyframes shake {
                10%, 90% {
                    transform: translateX(-1px);
                }
                20%, 80% {
                    transform: translateX(2px);
                }
                30%, 50%, 70% {
                    transform: translateX(-4px);
                }
                40%, 60% {
                    transform: translateX(4px);
                }
            }

            .btn-submit {
                width: 100%;
                color: #ffffff;
                font-weight: 600;
                font-size: 14px;
                padding: 12px 24px;
                border-radius: var(--radius-lg);
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                margin-top: 8px;
                background: var(--gradient-button);
                box-shadow: 0 10px 20px -8px rgba(37,99,235,0.4);
                transition: background 0.2s ease, transform 0.1s ease, box-shadow 0.2s ease;
                position: relative;
                overflow: hidden;
            }
            .btn-submit::before {
                content: "";
                position: absolute;
                top: 0;
                left: -75%;
                width: 50%;
                height: 100%;
                background: linear-gradient(120deg, transparent, rgba(255,255,255,.35), transparent);
                transform: skewX(-20deg);
                transition: left .6s ease;
            }
            .btn-submit:hover::before {
                left: 130%;
            }
            .btn-submit:hover {
                background: var(--gradient-button-hover);
                box-shadow: 0 12px 24px -8px rgba(37,99,235,0.5);
            }
            .btn-submit:active {
                transform: scale(0.99);
            }

            /* ---------- Sellos de confianza ---------- */
            .trust-badges {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 18px;
                margin-top: 20px;
                flex-wrap: wrap;
            }
            .trust-badge {
                display: flex;
                align-items: center;
                gap: 6px;
                font-size: 11px;
                color: var(--on-surface-faint);
            }
            .trust-badge .material-symbols-outlined {
                font-size: 15px;
                color: var(--on-surface-faint);
            }

            /* ---------- Sección "Cómo funciona" ---------- */
            .how-section {
                position: relative;
                z-index: 10;
                background: var(--surface-container-lowest);
                border-top: 1px solid var(--hairline);
                padding: 64px 24px;
            }
            .how-inner {
                max-width: 1100px;
                margin: 0 auto;
            }
            .how-title {
                text-align: center;
                margin-bottom: 40px;
            }
            .how-title h2 {
                font-family: 'Manrope', sans-serif;
                font-size: 28px;
                font-weight: 800;
                color: var(--on-surface);
                margin: 0 0 8px;
            }
            .how-title p {
                color: var(--on-surface-muted);
                font-size: 14px;
                margin: 0;
            }
            .how-steps {
                display: grid;
                grid-template-columns: 1fr;
                gap: 24px;
            }
            @media (min-width: 768px) {
                .how-steps {
                    grid-template-columns: repeat(3, 1fr);
                }
            }
            .how-step {
                background: var(--card-bg);
                border: 1px solid var(--card-border);
                border-radius: var(--radius-xl);
                padding: 28px 24px;
                text-align: center;
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                box-shadow: var(--shadow-soft-bloom);
                opacity: 0;
                transform: translateY(20px);
                transition: transform .3s ease, box-shadow .3s ease;
            }
            .how-step.in-view {
                animation: rise-in .6s ease forwards;
            }
            .how-step:hover {
                transform: translateY(-6px);
                box-shadow: var(--shadow-card);
            }
            .how-step-num {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background: var(--gradient-button);
                color: #fff;
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                font-size: 15px;
                margin-bottom: 16px;
            }
            .how-step h3 {
                font-size: 16px;
                font-weight: 700;
                color: var(--on-surface);
                margin: 0 0 8px;
            }
            .how-step p {
                font-size: 13px;
                color: var(--on-surface-muted);
                line-height: 1.5;
                margin: 0;
            }

            /* ---------- Footer general ---------- */
            footer {
                background: var(--footer-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border-top: 1px solid var(--hairline);
                position: relative;
                z-index: 10;
                color: var(--on-surface-variant);
            }
            .footer-inner {
                max-width: 1280px;
                margin: 0 auto;
                padding: 24px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-between;
                gap: 16px;
            }
            @media (min-width: 768px) {
                .footer-inner {
                    flex-direction: row;
                }
            }

            .footer-brand {
                display: flex;
                align-items: center;
                gap: 8px;
                font-weight: 700;
                font-size: 16px;
                color: var(--on-surface);
            }
            .footer-brand .material-symbols-outlined {
                color: var(--primary);
            }

            .footer-links {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 24px;
                font-size: 14px;
            }
            .footer-links a {
                color: var(--on-surface-variant);
                transition: color 0.2s ease;
            }
            .footer-links a:hover {
                color: var(--primary);
            }

            .footer-copy {
                font-size: 12px;
                color: var(--on-surface-faint);
            }

            /* Botón scroll-to-top */
            .scroll-top-btn {
                position: fixed;
                bottom: 24px;
                right: 24px;
                z-index: 30;
                width: 44px;
                height: 44px;
                border-radius: 50%;
                background: var(--gradient-button);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: 0 10px 20px -8px rgba(37,99,235,0.5);
                opacity: 0;
                pointer-events: none;
                transform: translateY(10px);
                transition: opacity .25s ease, transform .25s ease;
            }
            .scroll-top-btn.visible {
                opacity: 1;
                pointer-events: auto;
                transform: translateY(0);
            }
            .scroll-top-btn:hover {
                background: var(--gradient-button-hover);
            }

            @media (prefers-reduced-motion: reduce) {
                *, *::before, *::after {
                    animation-duration: .001ms !important;
                    animation-iteration-count: 1 !important;
                    transition-duration: .001ms !important;
                }
            }
        </style>
    </head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    <body>

        <!-- Navbar -->
        <header class="navbar">
            <div class="navbar-inner">
                <div class="navbar-brand">
                    <span class="material-symbols-outlined" aria-hidden="true">support_agent</span>
                    <span>Mesa de Ayuda CIMM</span>
                </div>
                <nav class="navbar-links">
                    <a href="#inicio">Inicio</a>
                    <a href="#como-funciona">Cómo funciona</a>
                    <a href="#soporte">Soporte</a>
                </nav>
                <div class="navbar-status">
                    <span class="status-dot" aria-hidden="true"></span>
                    <span>Sistema operativo</span>
                </div>
            </div>
        </header>

        <!-- Main Content -->
        <main id="inicio">
            <!-- Fondo con imagen y overlay claro -->
            <div class="bg-photo" aria-hidden="true">
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCIKobOXIeN8nbtV02UgQ2IlFuCSdgL2palJtK2Puxh_ymGovFcwV0gaAkVQv9_wPPwXfadZ5mZfFPNTxcD2GPKQx1OBxsKEjmu-r33Tsg99fVXxfiYRUWFp9bvu6GJ4gHMTZFaF6zyvlpkFMFc59NxN-wME_SeOsK_Sf-kwt0ip_Vv4_ghH4tCXqNtKRoiJGQALLq0sueImOCVcOAd4Gif-JpKZsfUsRPumIi07cR-si6DrtYpRmxO" alt="">
            </div>
            <div class="blob blob-1" aria-hidden="true"></div>
            <div class="blob blob-2" aria-hidden="true"></div>
            <div class="blob blob-3" aria-hidden="true"></div>

            <div class="hero-wrap">

                <!-- Columna izquierda: presentación del portal -->
                <div class="hero-info">
                    <span class="hero-badge">
                        <span class="material-symbols-outlined" aria-hidden="true">verified</span>
                        Plataforma interna CIMM
                    </span>
                    <h1>Soporte técnico <span>rápido y centralizado</span> para todo el equipo</h1>
                    <p class="lead">
                        Reporta incidencias, da seguimiento a tus tickets y comunícate directamente con
                        el equipo de soporte, todo desde un solo lugar.
                    </p>

                    <div class="feature-list">
                        <div class="feature-item">
                            <div class="feature-icon">
                                <span class="material-symbols-outlined" aria-hidden="true">bolt</span>
                            </div>
                            <div class="feature-text">
                                <h3>Respuesta rápida</h3>
                                <p>Nuestro equipo atiende la mayoría de los tickets en menos de 24 horas.</p>
                            </div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">
                                <span class="material-symbols-outlined" aria-hidden="true">history</span>
                            </div>
                            <div class="feature-text">
                                <h3>Seguimiento en tiempo real</h3>
                                <p>Consulta el estado de tus solicitudes en cualquier momento.</p>
                            </div>
                        </div>
                        <div class="feature-item">
                            <div class="feature-icon">
                                <span class="material-symbols-outlined" aria-hidden="true">lock</span>
                            </div>
                            <div class="feature-text">
                                <h3>Acceso seguro</h3>
                                <p>Autenticación exclusiva con tu correo corporativo institucional.</p>
                            </div>
                        </div>
                    </div>

                </div>

                <!-- Tarjeta de login -->
                <div class="login-card" id="login-card">
                    <div class="accent-line"></div>

                    <div class="login-header">
                        <div class="login-icon">
                            <span class="material-symbols-outlined" aria-hidden="true">support_agent</span>
                        </div>
                        <h1>Mesa de Ayuda</h1>
                        <p>Portal de Soporte Técnico</p>
                    </div>

                    <form id="loginForm" action="${pageContext.request.contextPath}/AuthServlet" method="POST" novalidate>
                        <input type="hidden" name="action" value="ingresar">
                        <div class="field">
                            <label for="email">Correo Electrónico</label>
                            <div class="field-input-wrap" id="emailWrap">
                                <span class="material-symbols-outlined">mail</span>
                                <input type="email" id="email" name="email" placeholder="Ingresa tu correo corporativo" required>
                            </div>
                        </div>

                        <button type="submit" class="btn-submit" id="submitBtn">
                            <span id="btnLabel">Iniciar Sesión</span>
                            <span class="material-symbols-outlined" style="font-size:16px" id="btnIcon">arrow_forward</span>
                        </button>
                    </form>

                </div>
            </div>
        </main>

        <!-- Sección: Cómo funciona -->
        <section class="how-section" id="como-funciona">
            <div class="how-inner">
                <div class="how-title">
                    <h2>¿Cómo funciona la Mesa de Ayuda?</h2>
                    <p>Tres pasos simples para resolver tus incidencias técnicas</p>
                </div>
                <div class="how-steps">
                    <div class="how-step">
                        <div class="how-step-num">1</div>
                        <h3>Inicia sesión</h3>
                        <p>Accede con tu correo corporativo institucional, sin contraseñas que recordar.</p>
                    </div>
                    <div class="how-step">
                        <div class="how-step-num">2</div>
                        <h3>Registra tu incidencia</h3>
                        <p>Describe tu problema y elige la categoría correspondiente para agilizar la atención.</p>
                    </div>
                    <div class="how-step">
                        <div class="how-step-num">3</div>
                        <h3>Da seguimiento</h3>
                        <p>Recibe notificaciones y consulta el avance de tu ticket hasta su resolución.</p>
                    </div>
                </div>
            </div>
        </section>

        
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

        <script>
            // ---- Observer para animar tarjetas "Cómo funciona" al hacer scroll ----
            const stepObserver = new IntersectionObserver((entries, obs) => {
                entries.forEach((entry, i) => {
                    if (entry.isIntersecting) {
                        setTimeout(() => {
                            entry.target.classList.add('in-view');
                        }, i * 120);
                        obs.unobserve(entry.target);
                    }
                });
            }, {threshold: 0.2});

            document.querySelectorAll('.how-step').forEach(step => stepObserver.observe(step));

            // ---- Scroll suave para anclas internas ----
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    const targetId = this.getAttribute('href');
                    const targetEl = document.querySelector(targetId);
                    if (targetEl) {
                        e.preventDefault();
                        targetEl.scrollIntoView({behavior: 'smooth', block: 'start'});
                    }
                });
            });

            // ---- Botón volver arriba ----
            const scrollTopBtn = document.getElementById('scrollTopBtn');
            window.addEventListener('scroll', () => {
                if (window.scrollY > 420) {
                    scrollTopBtn.classList.add('visible');
                } else {
                    scrollTopBtn.classList.remove('visible');
                }
            });
            scrollTopBtn.addEventListener('click', () => {
                window.scrollTo({top: 0, behavior: 'smooth'});
            });

            // ---- Validación suave + estado de "cargando" en el botón ----
            const loginForm = document.getElementById('loginForm');
            const emailWrap = document.getElementById('emailWrap');
            const emailInput = document.getElementById('email');
            const submitBtn = document.getElementById('submitBtn');
            const btnLabel = document.getElementById('btnLabel');
            const btnIcon = document.getElementById('btnIcon');

            loginForm.addEventListener('submit', function (e) {
                const value = emailInput.value.trim();
                const isValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);

                if (!isValid) {
                    e.preventDefault();
                    emailWrap.classList.remove('shake');
                    void emailWrap.offsetWidth;
                    emailWrap.classList.add('shake');
                    emailInput.focus();
                    return;
                }

                submitBtn.disabled = true;
                submitBtn.style.opacity = '0.85';
                btnLabel.textContent = 'Verificando...';
                btnIcon.textContent = 'progress_activity';
                btnIcon.style.animation = 'spin 0.8s linear infinite';
            });

            const spinStyle = document.createElement('style');
            spinStyle.textContent = '@keyframes spin { from { transform: rotate(0deg);} to { transform: rotate(360deg);} }';
            document.head.appendChild(spinStyle);

            // ---- Paralaje leve de los blobs con el mouse ----
            const blobs = document.querySelectorAll('.blob');
            window.addEventListener('mousemove', (e) => {
                const x = (e.clientX / window.innerWidth - 0.5) * 20;
                const y = (e.clientY / window.innerHeight - 0.5) * 20;
                blobs.forEach((blob, i) => {
                    const factor = (i + 1) * 0.4;
                    blob.style.transform = `translate(${x * factor}px, ${y * factor}px)`;
                });
            });
        </script>

    </body>
</html>
