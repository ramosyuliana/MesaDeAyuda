<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-full" lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Knowledge Base - EtherHelp</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500&family=Manrope:wght@600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
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
                --outline-variant: #d7dfec;
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
                --warning-star: #d97706;

                /* ---- Degradados ---- */
                --gradient-overlay: var(--bg-gradient);
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
                --shadow-card: var(--shadow-rest);
                --shadow-soft-bloom: 0 10px 30px -8px rgba(59,130,246,0.14);

                /* ---- Radios generosos ---- */
                --radius-sm: 0.625rem;
                --radius-lg: 0.875rem;
                --radius-xl: 1.25rem;
                --radius-full: 9999px;

                /* ---- Espaciado ---- */
                --sp-xs: 4px;
                --sp-sm: 12px;
                --sp-base: 8px;
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

            /* ---------- Glass ---------- */
            .glass-panel {
                background-color: var(--card-bg);
                backdrop-filter: var(--card-blur);
                -webkit-backdrop-filter: var(--card-blur);
                border: 1px solid var(--card-border);
                box-shadow: var(--shadow-rest);
            }

            /* Elevación por hover (activada desde JS con .is-liftable) */
            .is-liftable {
                transition: transform var(--t-slow), box-shadow var(--t-slow), background-color var(--t-slow);
                will-change: transform;
            }
            .is-liftable:hover {
                transform: translateY(-3px);
                box-shadow: var(--shadow-hover);
                background-color: var(--card-bg-strong);
            }

            /* Revelado inicial (fade-in) */
            .reveal {
                opacity: 0;
                transform: translateY(12px);
            }
            .reveal.is-in {
                opacity: 1;
                transform: none;
                transition: opacity .5s cubic-bezier(.4,0,.2,1), transform .5s cubic-bezier(.4,0,.2,1);
            }

            /* ---------- Header ---------- */
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

            .avatar {
                height: 32px;
                width: 32px;
                border-radius: 50%;
                overflow: hidden;
                border: 1px solid var(--card-border);
                background: var(--surface-container-high);
                transition: transform var(--t-base), box-shadow var(--t-base);
            }
            .avatar:hover {
                transform: scale(1.06);
                box-shadow: var(--shadow-hover);
            }
            .avatar img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                display: block;
            }

            /* ---------- Layout ---------- */
            .app-body {
                display: flex;
                flex: 1;
                overflow: hidden;
                height: 100vh;
                padding-top: 64px;
            }

            /* ---------- Sidebar ---------- */
            aside.sidebar {
                display: none;
                flex-direction: column;
                height: 100%;
                width: 256px;
                flex-shrink: 0;
                z-index: 40;
                position: relative;
                border-radius: 0;
                border-top: none;
                border-bottom: none;
                border-left: none;
            }
            @media (min-width: 768px) {
                aside.sidebar {
                    display: flex;
                }
            }

            .sidebar-header {
                padding: var(--sp-md);
                display: flex;
                flex-direction: column;
                gap: 2px;
                border-bottom: 1px solid var(--hairline);
            }
            .sidebar-header h2 {
                margin: 0;
                font-family: 'Manrope', sans-serif;
                font-size: 24px;
                font-weight: 600;
                background: var(--gradient-accent);
                -webkit-background-clip: text;
                background-clip: text;
                color: transparent;
            }
            .sidebar-header p {
                margin: 0;
                font-size: 12px;
                color: var(--on-surface-muted);
            }

            .sidebar-nav {
                flex: 1;
                overflow-y: auto;
                padding: var(--sp-md) var(--sp-sm);
                display: flex;
                flex-direction: column;
                gap: 8px;
            }
            .sidebar-nav a {
                color: var(--on-surface-labels);
                border-radius: var(--radius-lg);
                display: flex;
                align-items: center;
                gap: 12px;
                padding: 12px;
                font-size: 16px;
                position: relative;
                transition: background-color var(--t-base), color var(--t-base), transform var(--t-fast);
            }
            .sidebar-nav a .material-symbols-outlined {
                color: var(--on-surface-muted);
                transition: color var(--t-base);
            }
            .sidebar-nav a:hover {
                background: rgba(59,130,246,.07);
                color: var(--link);
                transform: translateX(3px);
            }
            .sidebar-nav a:hover .material-symbols-outlined {
                color: var(--link);
            }
            .sidebar-nav a.active {
                background: rgba(59,130,246,.12);
                color: var(--primary);
                font-weight: 700;
                transform: translateX(4px);
            }
            .sidebar-nav a.active .material-symbols-outlined {
                color: var(--primary);
            }
            .sidebar-nav a.active::before {
                content: '';
                position: absolute;
                left: -12px;
                top: 10px;
                bottom: 10px;
                width: 3px;
                border-radius: 3px;
                background: var(--gradient-accent);
            }
            .sidebar-nav a.push-bottom {
                margin-top: auto;
            }

            .sidebar-footer {
                padding: var(--sp-md);
                border-top: 1px solid var(--hairline);
            }

            /* ---------- Botones principales ---------- */
            .btn-new-article, .btn-edit {
                position: relative;
                overflow: hidden;
                width: 100%;
                color: #ffffff;
                font-size: 14px;
                font-weight: 500;
                padding: 12px;
                border-radius: var(--radius-lg);
                display: flex;
                justify-content: center;
                align-items: center;
                gap: 8px;
                background: var(--gradient-button);
                box-shadow: var(--shadow-rest);
                transition: background var(--t-slow), transform var(--t-fast), box-shadow var(--t-slow);
            }
            .btn-new-article:hover, .btn-edit:hover {
                background: var(--gradient-button-hover);
                box-shadow: var(--shadow-hover);
                transform: translateY(-2px);
            }
            .btn-new-article:active, .btn-edit:active {
                transform: translateY(0) scale(0.98);
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

            /* ---------- Main content ---------- */
            main.content {
                flex: 1;
                overflow-y: auto;
                padding: var(--sp-md) var(--sp-gutter);
                position: relative;
            }
            .content-inner {
                max-width: var(--container-max);
                margin: 0 auto;
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
                padding-bottom: var(--sp-xl);
            }

            .page-head {
                display: flex;
                flex-direction: column;
                gap: var(--sp-md);
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
                margin: 0 0 8px;
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                font-size: 32px;
                letter-spacing: -0.01em;
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

            .stat-row {
                display: flex;
                flex-wrap: wrap;
                gap: var(--sp-sm);
            }
            .stat-card {
                border-radius: var(--radius-xl);
                padding: 16px;
                display: flex;
                align-items: center;
                gap: 12px;
                min-width: 160px;
            }
            .stat-icon {
                padding: 8px;
                border-radius: var(--radius-lg);
                display: flex;
                transition: transform var(--t-slow);
            }
            .stat-card:hover .stat-icon {
                transform: scale(1.08) rotate(-4deg);
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
                font-size: 24px;
                font-weight: 700;
                color: var(--on-surface);
                font-variant-numeric: tabular-nums;
            }

            /* ---------- Bento grid ---------- */
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
            .see-all-btn .material-symbols-outlined {
                transition: transform var(--t-base);
            }
            .see-all-btn:hover .material-symbols-outlined {
                transform: translateX(3px);
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
                transition: background-color var(--t-fast), transform var(--t-fast);
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
            .article-updated {
                font-size: 12px;
                color: var(--on-surface-faint);
                margin: 2px 0 0;
            }

            .tag-badge {
                display: inline-flex;
                align-items: center;
                padding: 2px 10px;
                border-radius: var(--radius-full);
                font-size: 12px;
                font-weight: 500;
                transition: transform var(--t-fast);
            }
            tbody tr:hover .tag-badge {
                transform: translateY(-1px);
            }
            .tag-blue {
                background: rgba(59,130,246,.12);
                color: var(--primary);
            }
            .tag-violet {
                background: rgba(99,102,241,.12);
                color: var(--secondary);
            }
            .tag-teal {
                background: rgba(56,189,248,.14);
                color: #0284c7;
            }

            .rating-cell {
                display: flex;
                align-items: center;
                gap: 4px;
                font-size: 14px;
                color: var(--on-surface-variant);
            }
            .rating-cell .material-symbols-outlined {
                font-size: 14px;
                color: var(--warning);
            }

            /* ---------- Detail panel ---------- */
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
                font-size: 24px;
                font-weight: 600;
                color: var(--on-surface);
            }
            .bookmark-chip {
                background: var(--icon-circle-bg);
                border: 1px solid var(--icon-circle-border);
                color: var(--primary);
                padding: 6px;
                border-radius: 10px;
                display: flex;
                transition: transform var(--t-base), background var(--t-base);
            }
            .bookmark-chip:hover {
                transform: translateY(-2px);
                background: rgba(59,130,246,.18);
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
            .detail-meta-row.accent span:last-child {
                color: var(--primary);
            }

            .detail-actions-label {
                font-size: 12px;
                color: var(--on-surface-muted);
                text-transform: uppercase;
                letter-spacing: 0.05em;
                margin: 0 0 12px;
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
                margin-bottom: 12px;
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
                transition: color var(--t-fast);
            }
            .action-btn:hover span.label, .action-btn:hover .material-symbols-outlined {
                color: var(--link);
            }
            .action-btn .material-symbols-outlined {
                color: var(--on-surface-muted);
                transition: color var(--t-fast);
            }

            .btn-edit {
                margin-top: 8px;
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

        <!-- TopAppBar -->
        <header class="topbar glass-panel">
            <div class="topbar-inner">
                <div class="topbar-left">
                    <div class="brand">
                        <span class="material-symbols-outlined">support_agent</span>
                        <span class="name">EtherHelp</span>
                    </div>
                    <nav class="topbar-nav">
                        <a href="#">Dashboard</a>
                        <a href="#">Tickets</a>
                        <a href="#" class="active">Knowledge Base</a>
                        <a href="#">Reports</a>
                    </nav>
                </div>
                <div class="topbar-right">
                    <div class="topbar-search">
                        <span class="material-symbols-outlined">search</span>
                        <input type="text" placeholder="Buscar artículos...">
                    </div>
                    <button class="icon-btn" aria-label="Notificaciones">
                        <span class="material-symbols-outlined">notifications</span>
                        <span class="dot-badge"></span>
                    </button>
                    <button class="icon-btn" aria-label="Configuración">
                        <span class="material-symbols-outlined">settings</span>
                    </button>
                    <div class="avatar">
                        <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuB3m9EkKo6N0PIIjPm5vPDZVlo_tUdyK3bVdlPwTHTwI58u_n_0rI-UcunhNAP01Wgx0ei4BeEz1tsFK24igkp0qonw70S36W4fQSY0NK4zadzd06Mw2mMwG-7ab5hwRsTboQc_4vxgHHUNhytmiOkTi8xBqIxn0_NjdrvuyIEKzNf6lYcTkvuryWD7CTQdpVdEmgOP2GCkaLQUBBjDLxZu8KqmgRKE2PjVj7nM_U_SMZwBeiS87cvpmQ" alt="Avatar de usuario">
                    </div>
                </div>
            </div>
        </header>

        <div class="app-body">
            <!-- SideNavBar -->
            <aside class="sidebar glass-panel">
                <div class="sidebar-header">
                    <h2>Knowledge Base</h2>
                    <p>Luminous Ether v1.0</p>
                </div>
                <nav class="sidebar-nav">
                    <a href="#" class="active"><span class="material-symbols-outlined icon-filled">article</span> Todos los artículos</a>
                    <a href="#"><span class="material-symbols-outlined">dns</span> Cloud &amp; Sync</a>
                    <a href="#"><span class="material-symbols-outlined">lock</span> Acceso y Seguridad</a>
                    <a href="#"><span class="material-symbols-outlined">receipt_long</span> Facturación y Q3</a>
                    <a href="#" class="push-bottom"><span class="material-symbols-outlined">bookmark</span> Guardados</a>
                </nav>
                <div class="sidebar-footer">
                    <button class="btn-new-article">
                        <span class="material-symbols-outlined" style="font-size:16px">add</span>
                        Nuevo Artículo
                    </button>
                </div>
            </aside>

            <!-- Main Content Canvas -->
            <main class="content">
                <div class="content-inner">

                    <!-- Header Area -->
                    <section class="page-head">
                        <div>
                            <h1>Base de Conocimiento</h1>
                            <p>Encuentra guías, manuales de resolución y documentación oficial.</p>
                        </div>
                        <div class="stat-row">
                            <div class="stat-card glass-panel" style="animation-delay:.05s">
                                <div class="stat-icon blue"><span class="material-symbols-outlined">library_books</span></div>
                                <div>
                                    <p class="stat-label">Artículos totales</p>
                                    <p class="stat-value">42</p>
                                </div>
                            </div>
                            <div class="stat-card glass-panel" style="animation-delay:.15s">
                                <div class="stat-icon violet"><span class="material-symbols-outlined">trending_up</span></div>
                                <div>
                                    <p class="stat-label">Consultas hoy</p>
                                    <p class="stat-value">128</p>
                                </div>
                            </div>
                        </div>
                    </section>

                    <!-- Bento Grid -->
                    <div class="bento-grid">
                        <!-- Articles Table -->
                        <section class="articles-panel glass-panel">
                            <div class="panel-head">
                                <h3>Artículos Frecuentes</h3>
                                <button class="see-all-btn">Ver todos <span class="material-symbols-outlined" style="font-size:16px">arrow_forward</span></button>
                            </div>
                            <div class="table-scroll">
                                <table>
                                    <thead>
                                        <tr>
                                            <th>Código</th>
                                            <th>Título del Artículo</th>
                                            <th>Categoría</th>
                                            <th>Utilidad</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="selected">
                                            <td class="code-cell">KB-204</td>
                                            <td>
                                                <p class="article-title">Guía de resolución de errores de sincronización DB</p>
                                                <p class="article-updated">Actualizado hace 2 días</p>
                                            </td>
                                            <td><span class="tag-badge tag-blue">Cloud &amp; Sync</span></td>
                                            <td><span class="rating-cell"><span class="material-symbols-outlined icon-filled">star</span> 98%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="code-cell">KB-198</td>
                                            <td>
                                                <p class="article-title">Restablecimiento de accesos y permisos en portal cloud</p>
                                                <p class="article-updated">Actualizado hace 5 días</p>
                                            </td>
                                            <td><span class="tag-badge tag-violet">Seguridad</span></td>
                                            <td><span class="rating-cell"><span class="material-symbols-outlined icon-filled">star</span> 94%</span></td>
                                        </tr>
                                        <tr>
                                            <td class="code-cell">KB-185</td>
                                            <td>
                                                <p class="article-title">Políticas de facturación y ciclos fiscales Q3</p>
                                                <p class="article-updated">Actualizado hace 1 semana</p>
                                            </td>
                                            <td><span class="tag-badge tag-teal">Facturación</span></td>
                                            <td><span class="rating-cell"><span class="material-symbols-outlined icon-filled">star</span> 91%</span></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </section>

                        <!-- Article Detail & Quick Actions -->
                        <section class="detail-col">
                            <div class="detail-card glass-panel">
                                <div class="detail-top">
                                    <div>
                                        <span class="detail-eyebrow">KB-204 Seleccionado</span>
                                        <h4 class="detail-title">Guía de resolución de errores de sincronización DB</h4>
                                    </div>
                                    <span class="bookmark-chip"><span class="material-symbols-outlined" style="font-size:16px">bookmark</span></span>
                                </div>

                                <div class="detail-meta">
                                    <div class="detail-meta-row">
                                        <span>Autor:</span>
                                        <span>Equipo de Ingeniería</span>
                                    </div>
                                    <div class="detail-meta-row accent">
                                        <span>Lecturas:</span>
                                        <span>1,420 veces</span>
                                    </div>
                                </div>

                                <div>
                                    <p class="detail-actions-label">Acciones del Artículo</p>
                                    <button class="action-btn">
                                        <span class="label"><span class="material-symbols-outlined" style="font-size:20px">visibility</span> Vista Previa Completa</span>
                                    </button>
                                    <button class="action-btn">
                                        <span class="label"><span class="material-symbols-outlined" style="font-size:20px">share</span> Compartir con Solicitante</span>
                                    </button>
                                    <button class="btn-edit">
                                        <span class="material-symbols-outlined icon-filled" style="font-size:16px">edit</span>
                                        Editar Artículo
                                    </button>
                                </div>
                            </div>
                        </section>
                    </div>

                </div>
            </main>
        </div>

        <script>
            (function () {
                'use strict';

                var reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

                /* ---------- 1. Fade-in escalonado al cargar ---------- */
                function setupReveal() {
                    var targets = [
                        document.querySelector('header.topbar'),
                        document.querySelector('aside.sidebar'),
                        document.querySelector('.page-head > div'),
                        document.querySelectorAll('.stat-card'),
                        document.querySelector('.articles-panel'),
                        document.querySelector('.detail-card')
                    ];

                    var flat = [];
                    targets.forEach(function (t) {
                        if (!t)
                            return;
                        if (t instanceof NodeList) {
                            Array.prototype.forEach.call(t, function (n) {
                                flat.push(n);
                            });
                        } else {
                            flat.push(t);
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
                            }, 60 * i);
                        });
                    });
                }

                /* ---------- 2. Elevación en hover ---------- */
                function setupLift() {
                    var lifties = document.querySelectorAll('.stat-card, .articles-panel, .detail-card');
                    Array.prototype.forEach.call(lifties, function (el) {
                        el.classList.add('is-liftable');
                    });
                }

                /* ---------- 3. Ripple en botones principales ---------- */
                function setupRipple() {
                    if (reduced)
                        return;
                    var buttons = document.querySelectorAll('.btn-new-article, .btn-edit');
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

                /* ---------- 4. Conteo animado de las métricas ---------- */
                function setupCounters() {
                    var values = document.querySelectorAll('.stat-value');
                    Array.prototype.forEach.call(values, function (el, idx) {
                        var raw = el.textContent.trim();
                        var target = parseInt(raw.replace(/[^0-9]/g, ''), 10);
                        if (isNaN(target) || reduced)
                            return;

                        var duration = 900;
                        var startAt = 300 + idx * 120;
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

                function init() {
                    setupReveal();
                    setupLift();
                    setupRipple();
                    setupCounters();
                    setupRowSelection();
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