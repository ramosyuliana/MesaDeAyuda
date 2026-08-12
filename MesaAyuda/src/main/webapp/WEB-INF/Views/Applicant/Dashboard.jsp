<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Luminous Desk - Requester Dashboard</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Manrope:wght@600;700&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
        <style>
            :root {
                /* ---- Fondo (azul-grisáceo suave, nunca blanco puro) ---- */
                --bg-page: #eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));

                /* ---- Superficies internas ---- */
                --surface-container-lowest: #f6f8fb;
                --surface-container-low: #e9eef5;
                --surface-container: #e2e8f2;
                --surface-container-high: #dbe2ee;

                /* ---- Texto ---- */
                --on-surface: #1e293b;          /* títulos */
                --on-surface-labels: #334155;   /* labels */
                --on-surface-variant: #51607a;  /* secundario */
                --on-surface-muted: #6b7a97;    /* terciario / iconos */
                --on-surface-faint: #94a3b8;    /* tenue */

                /* ---- Bordes ---- */
                --border-soft: #d7dfec;
                --outline: #c2cddd;
                --hairline: rgba(148,163,184,.25);

                /* ---- Acentos ---- */
                --link: #3b82f6;
                --link-hover: #2563eb;
                --primary: #2563eb;
                --primary-container: #3b82f6;
                --primary-hover: #1d4ed8;
                --secondary: #6366f1;
                --tertiary: #38bdf8;

                /* ---- Estados ---- */
                --error: #dc2626;
                --success: #059669;
                --warning: #d97706;

                /* ---- Degradados ---- */
                --gradient-accent: linear-gradient(90deg, #38bdf8, #6366f1);
                --gradient-button: linear-gradient(135deg, #3b82f6, #2563eb);
                --gradient-button-hover: linear-gradient(135deg, #2563eb, #1d4ed8);

                /* ---- Superficies "glass" ---- */
                --card-bg: rgba(255,255,255,.6);
                --card-bg-strong: rgba(255,255,255,.72);
                --card-border: rgba(148,163,184,.25);
                --card-blur: blur(10px);
                --input-bg: rgba(255,255,255,.5);
                --input-border: #d7dfec;
                --input-focus-bg: rgba(255,255,255,.9);
                --input-focus-border: #3b82f6;
                --input-focus-glow: 0 0 0 4px rgba(59,130,246,.16);
                --icon-circle-bg: rgba(59,130,246,.1);
                --icon-circle-border: rgba(59,130,246,.25);

                /* ---- Sombras (tinte azulado, nunca negro puro) ---- */
                --shadow-rest: 0 4px 20px rgba(30,41,59,0.06);
                --shadow-hover: 0 12px 32px rgba(30,41,59,0.12);
                --shadow-bloom: 0 10px 30px -8px rgba(59,130,246,0.14);

                /* ---- Radios generosos ---- */
                --radius-sm: 0.625rem;
                --radius-lg: 0.875rem;
                --radius-xl: 1.25rem;
                --radius-full: 9999px;

                /* ---- Espaciado ---- */
                --sp-xs: 4px;
                --sp-base: 8px;
                --sp-sm: 12px;
                --sp-md: 24px;
                --sp-lg: 48px;
                --sp-xl: 80px;
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
            html {
                height: 100%;
            }

            body {
                margin: 0;
                min-height: 100vh;
                background: var(--bg-page);
                background-image: var(--bg-gradient);
                background-attachment: fixed;
                color: var(--on-surface);
                font-family: 'Inter', sans-serif;
                font-size: 16px;
                line-height: 1.6;
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
            h1, h2, h3, h4, p {
                margin: 0;
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
            .icon-filled {
                font-variation-settings: 'FILL' 1, 'wght' 400, 'GRAD' 0, 'opsz' 24;
            }
            .icon-18 {
                font-size: 18px;
            }
            .icon-14 {
                font-size: 14px;
            }

            /* ---------- Glass ---------- */
            .glass-panel {
                background-color: var(--card-bg);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-rest);
            }

            /* Elevación en hover (se activa desde JS) */
            .is-liftable {
                transition: transform var(--t-slow), box-shadow var(--t-slow), background-color var(--t-slow);
                will-change: transform;
            }
            .is-liftable:hover {
                transform: translateY(-3px);
                box-shadow: var(--shadow-hover);
                background-color: var(--card-bg-strong);
            }

            /* Fade-in de entrada */
            .reveal {
                opacity: 0;
                transform: translateY(14px);
            }
            .reveal.is-in {
                opacity: 1;
                transform: none;
                transition: opacity .5s cubic-bezier(.4,0,.2,1), transform .5s cubic-bezier(.4,0,.2,1);
            }

            /* ---------- Top bar ---------- */
            .topbar {
                position: sticky;
                top: 0;
                z-index: 50;
                display: flex;
                justify-content: space-between;
                align-items: center;
                width: 100%;
                height: 64px;
                padding: 0 var(--sp-md);
                border-left: none;
                border-right: none;
                border-top: none;
                border-radius: 0;
            }
            .topbar::after {
                content: '';
                position: absolute;
                left: 0;
                right: 0;
                bottom: -1px;
                height: 2px;
                background: var(--gradient-accent);
                opacity: .75;
            }
            .topbar-left {
                display: flex;
                align-items: center;
                gap: var(--sp-lg);
            }
            .brand {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
            }
            .brand-mark {
                width: 32px;
                height: 32px;
                border-radius: 10px;
                background: var(--gradient-button);
                color: #fff;
                display: flex;
                align-items: center;
                justify-content: center;
                box-shadow: var(--shadow-bloom);
                transition: transform var(--t-slow);
            }
            .brand:hover .brand-mark {
                transform: rotate(-8deg) scale(1.06);
            }
            .brand-name {
                font-family: 'Manrope', sans-serif;
                font-size: 24px;
                font-weight: 700;
                line-height: 1.4;
                background: var(--gradient-accent);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }

            .topbar-nav {
                display: none;
                align-items: center;
                gap: 4px;
            }
            @media (min-width: 1024px) {
                .topbar-nav {
                    display: flex;
                }
            }
            .topbar-nav a {
                display: flex;
                align-items: center;
                gap: 8px;
                padding: 8px 12px;
                border-radius: var(--radius-sm);
                color: var(--on-surface-labels);
                font-size: 14px;
                font-weight: 500;
                line-height: 1.4;
                transition: background var(--t-base), color var(--t-base), transform var(--t-fast);
            }
            .topbar-nav a:hover {
                background: rgba(59,130,246,.08);
                color: var(--link);
                transform: translateY(-1px);
            }
            .topbar-nav a.active {
                background: var(--gradient-button);
                color: #fff;
                font-weight: 700;
                box-shadow: var(--shadow-rest);
            }
            .topbar-nav a.active:hover {
                background: var(--gradient-button-hover);
                color: #fff;
            }

            .topbar-search {
                flex: 1;
                max-width: 28rem;
                padding: 0 var(--sp-lg);
                display: none;
            }
            @media (min-width: 768px) {
                .topbar-search {
                    display: block;
                }
            }
            .search-field {
                position: relative;
                width: 100%;
            }
            .search-field .material-symbols-outlined {
                position: absolute;
                left: 12px;
                top: 50%;
                transform: translateY(-50%);
                color: var(--on-surface-muted);
                transition: color var(--t-fast);
            }
            .search-field:focus-within .material-symbols-outlined {
                color: var(--input-focus-border);
            }
            .search-field input {
                width: 100%;
                background: var(--input-bg);
                border: 1px solid var(--input-border);
                border-radius: var(--radius-sm);
                padding: 8px 16px 8px 40px;
                font-family: inherit;
                font-size: 16px;
                color: var(--on-surface);
                outline: none;
                transition: background var(--t-fast), border-color var(--t-fast), box-shadow var(--t-fast);
            }
            .search-field input::placeholder {
                color: var(--on-surface-faint);
            }
            .search-field input:focus {
                background: var(--input-focus-bg);
                border-color: var(--input-focus-border);
                box-shadow: var(--input-focus-glow);
            }

            .topbar-right {
                display: flex;
                align-items: center;
                gap: var(--sp-sm);
            }

            .btn-primary {
                position: relative;
                overflow: hidden;
                display: none;
                align-items: center;
                gap: 8px;
                background: var(--gradient-button);
                color: #fff;
                font-size: 14px;
                font-weight: 500;
                padding: 8px 14px;
                border-radius: var(--radius-sm);
                box-shadow: var(--shadow-rest);
                transition: background var(--t-slow), box-shadow var(--t-slow), transform var(--t-fast);
            }
            @media (min-width: 640px) {
                .btn-primary {
                    display: inline-flex;
                }
            }
            .btn-primary:hover {
                background: var(--gradient-button-hover);
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

            .icon-btn {
                display: flex;
                padding: 8px;
                border-radius: var(--radius-full);
                color: var(--on-surface-muted);
                transition: background var(--t-fast), color var(--t-fast), transform var(--t-fast);
            }
            .icon-btn:hover {
                background: var(--icon-circle-bg);
                color: var(--link);
            }
            .icon-btn:active {
                transform: scale(.94);
            }

            .avatar {
                width: 32px;
                height: 32px;
                border-radius: 50%;
                overflow: hidden;
                border: 1px solid var(--card-border);
                background: var(--surface-container-high);
                cursor: pointer;
                margin-left: 8px;
                transition: transform var(--t-base), box-shadow var(--t-base);
            }
            .avatar:hover {
                transform: scale(1.06);
                box-shadow: 0 0 0 3px rgba(59,130,246,.25), var(--shadow-hover);
            }
            .avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: block;
            }

            /* ---------- Layout ---------- */
            .page-wrap {
                width: 100%;
                max-width: var(--container-max);
                margin: 0 auto;
            }
            .content {
                padding: 16px;
            }
            @media (min-width: 768px) {
                .content {
                    padding: var(--sp-gutter);
                }
            }

            /* ---------- Hero ---------- */
            .hero {
                margin: var(--sp-md) 0 var(--sp-lg);
            }
            .hero h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 40px;
                line-height: 1.2;
                letter-spacing: -0.02em;
                font-weight: 700;
                color: var(--on-surface);
                margin-bottom: 8px;
            }
            @media (min-width: 768px) {
                .hero h1 {
                    font-size: 48px;
                }
            }
            .hero p {
                font-size: 18px;
                line-height: 1.6;
                color: var(--on-surface-variant);
                margin-bottom: var(--sp-md);
            }

            .hero-search {
                position: relative;
                max-width: 42rem;
            }
            .hero-search .material-symbols-outlined {
                position: absolute;
                left: 16px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 24px;
                color: var(--link);
                transition: color var(--t-fast), transform var(--t-base);
            }
            .hero-search:focus-within .material-symbols-outlined {
                color: var(--link-hover);
                transform: translateY(-50%) scale(1.06);
            }
            .hero-search input {
                width: 100%;
                background-color: var(--input-bg);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                border: 1px solid var(--card-border);
                border-radius: var(--radius-xl);
                padding: 16px 16px 16px 48px;
                font-family: inherit;
                font-size: 18px;
                line-height: 1.6;
                color: var(--on-surface);
                box-shadow: var(--shadow-rest);
                outline: none;
                transition: background var(--t-base), border-color var(--t-base), box-shadow var(--t-base);
            }
            .hero-search input::placeholder {
                color: var(--on-surface-faint);
            }
            .hero-search input:focus {
                background-color: var(--input-focus-bg);
                border-color: var(--input-focus-border);
                box-shadow: var(--input-focus-glow), var(--shadow-hover);
            }

            /* ---------- KPI ---------- */
            .kpi-grid {
                display: grid;
                grid-template-columns: 1fr;
                gap: var(--sp-md);
                margin-bottom: var(--sp-lg);
            }
            @media (min-width: 768px) {
                .kpi-grid {
                    grid-template-columns: repeat(3, 1fr);
                }
            }

            .kpi-card {
                position: relative;
                overflow: hidden;
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                display: flex;
                flex-direction: column;
                justify-content: space-between;
            }
            .kpi-blob {
                position: absolute;
                right: -16px;
                top: -16px;
                width: 96px;
                height: 96px;
                border-radius: 50%;
                filter: blur(24px);
                transition: opacity var(--t-slow), transform var(--t-slow);
                opacity: .5;
            }
            .kpi-card:hover .kpi-blob {
                opacity: 1;
                transform: scale(1.15);
            }
            .kpi-blob.error {
                background: rgba(220,38,38,.18);
            }
            .kpi-blob.teal {
                background: rgba(56,189,248,.22);
            }
            .kpi-blob.blue {
                background: rgba(59,130,246,.2);
            }

            .kpi-label {
                font-size: 14px;
                font-weight: 500;
                color: var(--on-surface-labels);
                margin-bottom: 4px;
            }
            .kpi-row {
                display: flex;
                align-items: flex-end;
                gap: var(--sp-sm);
            }
            .kpi-value {
                font-family: 'Manrope', sans-serif;
                font-size: 48px;
                font-weight: 700;
                line-height: 1;
                letter-spacing: -0.02em;
                color: var(--on-surface);
                font-variant-numeric: tabular-nums;
            }

            .chip {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                padding: 4px 8px;
                border-radius: var(--radius-sm);
                font-size: 12px;
                font-weight: 500;
                letter-spacing: .01em;
            }
            .chip-error {
                background: rgba(220,38,38,.1);
                color: var(--error);
                margin-bottom: 4px;
            }

            /* ---------- Grilla inferior ---------- */
            .lower-grid {
                display: grid;
                grid-template-columns: 1fr;
                gap: var(--sp-md);
                margin-bottom: var(--sp-lg);
            }
            @media (min-width: 1024px) {
                .lower-grid {
                    grid-template-columns: repeat(3, 1fr);
                }
            }

            .panel {
                border-radius: var(--radius-xl);
                padding: var(--sp-md);
                position: relative;
            }
            .panel-wide {
                grid-column: auto;
            }
            @media (min-width: 1024px) {
                .panel-wide {
                    grid-column: span 2;
                }
            }
            .panel::before {
                content: '';
                position: absolute;
                top: 0;
                left: var(--sp-md);
                right: var(--sp-md);
                height: 3px;
                border-radius: 0 0 3px 3px;
                background: var(--gradient-accent);
            }

            .panel-head {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: var(--sp-md);
            }
            .panel-head h2 {
                font-family: 'Manrope', sans-serif;
                font-size: 24px;
                font-weight: 600;
                line-height: 1.4;
                color: var(--on-surface);
            }
            .link-btn {
                font-size: 14px;
                font-weight: 500;
                color: var(--link);
                padding: 6px 10px;
                border-radius: var(--radius-full);
                transition: color var(--t-fast), background var(--t-fast);
            }
            .link-btn:hover {
                color: var(--link-hover);
                background: rgba(59,130,246,.08);
            }

            /* ---------- Tabla ---------- */
            .table-scroll {
                overflow-x: auto;
            }
            table {
                width: 100%;
                text-align: left;
                border-collapse: collapse;
            }
            thead tr {
                border-bottom: 1px solid var(--hairline);
            }
            th {
                padding: 12px 16px;
                font-size: 14px;
                font-weight: 600;
                color: var(--on-surface-labels);
            }
            td {
                padding: 12px 16px;
                font-size: 16px;
            }
            tbody tr {
                border-bottom: 1px solid var(--hairline);
                cursor: pointer;
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

            .cell-id {
                color: var(--on-surface-muted);
                font-family: monospace;
                font-size: 14px;
            }
            .cell-subject {
                font-weight: 500;
                color: var(--on-surface);
            }
            .cell-time {
                color: var(--on-surface-faint);
                font-size: 14px;
            }

            .status {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 4px 8px;
                border-radius: var(--radius-sm);
                font-size: 12px;
                font-weight: 500;
            }
            .status .dot {
                width: 6px;
                height: 6px;
                border-radius: 50%;
            }
            .status-progress {
                background: rgba(59,130,246,.12);
                color: var(--primary);
            }
            .status-progress .dot {
                background: var(--primary-container);
            }
            .status-pending {
                background: rgba(56,189,248,.16);
                color: #0284c7;
            }
            .status-pending .dot {
                background: var(--tertiary);
            }
            .status-done {
                background: rgba(5,150,105,.1);
                color: var(--success);
            }
            tbody tr:hover .status {
                transform: translateY(-1px);
                transition: transform var(--t-fast);
            }

            /* ---------- Base de conocimientos ---------- */
            .kb-panel {
                display: flex;
                flex-direction: column;
            }
            .kb-list {
                flex: 1;
                display: flex;
                flex-direction: column;
                gap: var(--sp-sm);
            }
            .kb-item {
                display: flex;
                align-items: center;
                gap: 16px;
                padding: var(--sp-sm);
                border: 1px solid var(--input-border);
                border-radius: var(--radius-lg);
                background: var(--input-bg);
                transition: background var(--t-base), border-color var(--t-base), transform var(--t-base), box-shadow var(--t-base);
            }
            .kb-item:hover {
                background: var(--input-focus-bg);
                border-color: var(--input-focus-border);
                transform: translateY(-2px);
                box-shadow: var(--shadow-rest);
            }
            .kb-icon {
                width: 40px;
                height: 40px;
                border-radius: var(--radius-sm);
                background: var(--surface-container-low);
                color: var(--primary-container);
                display: flex;
                align-items: center;
                justify-content: center;
                flex-shrink: 0;
                transition: background var(--t-base), color var(--t-base), transform var(--t-base);
            }
            .kb-item:hover .kb-icon {
                background: var(--gradient-button);
                background-image: var(--gradient-button);
                color: #fff;
                transform: scale(1.06);
            }
            .kb-title {
                font-size: 14px;
                font-weight: 600;
                color: var(--on-surface);
            }
            .kb-sub {
                font-size: 12px;
                line-height: 1.4;
                color: var(--on-surface-muted);
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
                .reveal {
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

        <!-- TopNavBar (Expanded with links moved from sidebar) -->
        <header class="topbar glass-panel">
            <div class="topbar-left">
                <div class="brand">
                    <div class="brand-mark">
                        <span class="material-symbols-outlined icon-18">support_agent</span>
                    </div>
                    <h1 class="brand-name">Luminous Desk</h1>
                </div>
                <nav class="topbar-nav">
                    <a class="active" href="#">
                        <span class="material-symbols-outlined icon-18 icon-filled">home</span>
                        Home
                    </a>
                    <a href="#">
                        <span class="material-symbols-outlined icon-18">confirmation_number</span>
                        My Tickets
                    </a>
                    <a href="#">
                        <span class="material-symbols-outlined icon-18">book</span>
                        Knowledge Base
                    </a>
                    <a href="#">
                        <span class="material-symbols-outlined icon-18">contact_support</span>
                        Support
                    </a>
                </nav>
            </div>
            <div class="topbar-search">
                <div class="search-field">
                    <span class="material-symbols-outlined">search</span>
                    <input placeholder="Buscar en la base de conocimientos..." type="text"/>
                </div>
            </div>
            <div class="topbar-right">
                <button class="btn-primary">
                    <span class="material-symbols-outlined icon-18">add</span>
                    New Ticket
                </button>
                <button class="icon-btn" aria-label="Notificaciones">
                    <span class="material-symbols-outlined" data-icon="notifications">notifications</span>
                </button>
                <button class="icon-btn" aria-label="Ayuda">
                    <span class="material-symbols-outlined" data-icon="help_outline">help_outline</span>
                </button>
                <div class="avatar">
                    <img alt="User profile" src="https://lh3.googleusercontent.com/aida-public/AB6AXuCx9Xl5Yu2PGaKsDvh5slfpZRJRiyka-jn_q8tHAdZoW02zJq3VeWtxolZLzmQ5qilih1EPPQMI0RHqvWyz36C7DhIUjNRxKkIfH57x4Unzg8vDH1yhnTSFbtqc99JNYrQmB50cubUnLTJc2m-A2yTwJiqOVDPmW9SlJOkg-ADodQjfSYxytoqaqqKcjDm1q0fE5O9W2Iz5QlfH-y8NRflT8c9TWcsPDzQsGDhdVOr-wamoW2SG2rya_g"/>
                </div>
            </div>
        </header>

        <div class="page-wrap">
            <!-- Main Content Area -->
            <main class="content">

                <!-- Hero Section -->
                <section class="hero">
                    <h1>¡Hola, Sarah!</h1>
                    <p>¿En qué podemos ayudarte hoy?</p>
                    <div class="hero-search">
                        <span class="material-symbols-outlined">search</span>
                        <input placeholder="Describe tu problema (ej. 'No puedo acceder al correo')..." type="text"/>
                    </div>
                </section>

                <!-- KPI Cards -->
                <section class="kpi-grid">
                    <div class="kpi-card glass-panel">
                        <div class="kpi-blob error"></div>
                        <div>
                            <p class="kpi-label">Tickets Abiertos</p>
                            <div class="kpi-row">
                                <h3 class="kpi-value">3</h3>
                                <span class="chip chip-error">
                                    <span class="material-symbols-outlined icon-14">error</span>
                                    Urgente
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="kpi-card glass-panel">
                        <div class="kpi-blob teal"></div>
                        <div>
                            <p class="kpi-label">Pendientes de Acción</p>
                            <div class="kpi-row">
                                <h3 class="kpi-value">1</h3>
                            </div>
                        </div>
                    </div>
                    <div class="kpi-card glass-panel">
                        <div class="kpi-blob blue"></div>
                        <div>
                            <p class="kpi-label">Resueltos este mes</p>
                            <div class="kpi-row">
                                <h3 class="kpi-value">12</h3>
                            </div>
                        </div>
                    </div>
                </section>

                <div class="lower-grid">
                    <!-- Mis Tickets Recientes -->
                    <section class="panel panel-wide glass-panel">
                        <div class="panel-head">
                            <h2>Mis Tickets Recientes</h2>
                            <button class="link-btn">Ver todos</button>
                        </div>
                        <div class="table-scroll">
                            <table>
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>Asunto</th>
                                        <th>Estado</th>
                                        <th>Última Act.</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="cell-id">#TCK-892</td>
                                        <td class="cell-subject">Error al sincronizar calendario Outlook</td>
                                        <td>
                                            <span class="status status-progress">
                                                <span class="dot"></span>
                                                En Progreso
                                            </span>
                                        </td>
                                        <td class="cell-time">Hace 2 horas</td>
                                    </tr>
                                    <tr>
                                        <td class="cell-id">#TCK-890</td>
                                        <td class="cell-subject">Solicitud de licencia de software (Figma)</td>
                                        <td>
                                            <span class="status status-pending">
                                                <span class="dot"></span>
                                                Pendiente
                                            </span>
                                        </td>
                                        <td class="cell-time">Ayer</td>
                                    </tr>
                                    <tr>
                                        <td class="cell-id">#TCK-875</td>
                                        <td class="cell-subject">Renovación de equipo asignado</td>
                                        <td>
                                            <span class="status status-done">
                                                <span class="material-symbols-outlined icon-14">check_circle</span>
                                                Resuelto
                                            </span>
                                        </td>
                                        <td class="cell-time">Hace 5 días</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </section>

                    <!-- Base de Conocimientos (Quick Links) -->
                    <section class="panel kb-panel glass-panel">
                        <div class="panel-head">
                            <h2>Base de Conocimientos</h2>
                        </div>
                        <div class="kb-list">
                            <a class="kb-item" href="#">
                                <div class="kb-icon">
                                    <span class="material-symbols-outlined">password</span>
                                </div>
                                <div>
                                    <h4 class="kb-title">Reset de Contraseña</h4>
                                    <p class="kb-sub">Guía paso a paso</p>
                                </div>
                            </a>
                            <a class="kb-item" href="#">
                                <div class="kb-icon">
                                    <span class="material-symbols-outlined">mark_email_read</span>
                                </div>
                                <div>
                                    <h4 class="kb-title">Configuración de Correo</h4>
                                    <p class="kb-sub">iOS &amp; Android</p>
                                </div>
                            </a>
                            <a class="kb-item" href="#">
                                <div class="kb-icon">
                                    <span class="material-symbols-outlined">vpn_key</span>
                                </div>
                                <div>
                                    <h4 class="kb-title">Guía VPN Remota</h4>
                                    <p class="kb-sub">Acceso seguro</p>
                                </div>
                            </a>
                        </div>
                    </section>
                </div>

            </main>
        </div>

        <script>
            (function () {
                'use strict';

                var reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

                /* ---------- 1. Fade-in escalonado al cargar ---------- */
                function setupReveal() {
                    var groups = [
                        document.querySelector('.topbar'),
                        document.querySelector('.hero'),
                        document.querySelectorAll('.kpi-card'),
                        document.querySelector('.panel-wide'),
                        document.querySelector('.kb-panel')
                    ];

                    var flat = [];
                    groups.forEach(function (g) {
                        if (!g)
                            return;
                        if (g instanceof NodeList) {
                            Array.prototype.forEach.call(g, function (n) {
                                flat.push(n);
                            });
                        } else {
                            flat.push(g);
                        }
                    });

                    flat.forEach(function (el) {
                        el.classList.add('reveal');
                    });

                    if (reduced) {
                        flat.forEach(function (el) {
                            el.classList.add('is-in');
                        });
                        return;
                    }

                    requestAnimationFrame(function () {
                        flat.forEach(function (el, i) {
                            setTimeout(function () {
                                el.classList.add('is-in');
                            }, 70 * i);
                        });
                    });
                }

                /* ---------- 2. Elevación en hover ---------- */
                function setupLift() {
                    var lifties = document.querySelectorAll('.kpi-card, .panel');
                    Array.prototype.forEach.call(lifties, function (el) {
                        el.classList.add('is-liftable');
                    });
                }

                /* ---------- 3. Ripple en el botón principal ---------- */
                function setupRipple() {
                    if (reduced)
                        return;
                    var buttons = document.querySelectorAll('.btn-primary');
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

                /* ---------- 4. Conteo animado de los KPI ---------- */
                function setupCounters() {
                    var values = document.querySelectorAll('.kpi-value');
                    Array.prototype.forEach.call(values, function (el, idx) {
                        var raw = el.textContent.trim();
                        var target = parseInt(raw.replace(/[^0-9]/g, ''), 10);
                        if (isNaN(target) || reduced)
                            return;

                        var duration = 800;
                        var startAt = 350 + idx * 120;
                        el.textContent = '0';

                        setTimeout(function () {
                            var t0 = performance.now();
                            (function step(now) {
                                var p = Math.min((now - t0) / duration, 1);
                                var eased = 1 - Math.pow(1 - p, 3);
                                el.textContent = Math.round(target * eased).toString();
                                if (p < 1) {
                                    requestAnimationFrame(step);
                                } else {
                                    el.textContent = raw;
                                }
                            })(performance.now());
                        }, startAt);
                    });
                }

                /* ---------- 5. Selección de fila en la tabla ---------- */
                function setupRowSelection() {
                    var rows = document.querySelectorAll('tbody tr');
                    Array.prototype.forEach.call(rows, function (row) {
                        row.addEventListener('click', function () {
                            Array.prototype.forEach.call(rows, function (r) {
                                r.classList.remove('selected');
                            });
                            row.classList.add('selected');
                        });
                    });
                }

                /* ---------- 6. Sombra del header al hacer scroll ---------- */
                function setupHeaderScroll() {
                    var header = document.querySelector('.topbar');
                    if (!header)
                        return;
                    var apply = function () {
                        var scrolled = window.scrollY > 8;
                        header.style.boxShadow = scrolled
                                ? 'var(--shadow-hover)'
                                : 'var(--shadow-rest)';
                        header.style.backgroundColor = scrolled
                                ? 'var(--card-bg-strong)'
                                : 'var(--card-bg)';
                    };
                    apply();
                    window.addEventListener('scroll', apply, {passive: true});
                }

                function init() {
                    setupReveal();
                    setupLift();
                    setupRipple();
                    setupCounters();
                    setupRowSelection();
                    setupHeaderScroll();
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