<%-- 
    Document   : Notificator
    Created on : 14/08/2026, 2:11:02 p. m.
    Author     : julil
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Notificaciones | Mesa CIMM</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Manrope:wght@600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                --bg-page:#eef2f7;
                --bg-gradient: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));
                --on-surface:#1e293b;
                --on-surface-variant:#51607a;
                --on-surface-muted:#6b7a97;
                --on-surface-faint:#94a3b8;
                --card-bg: rgba(255,255,255,.6);
                --card-bg-strong: rgba(255,255,255,.85);
                --card-border: rgba(148,163,184,.25);
                --hairline: rgba(215,223,236,.6);
                --primary:#3b82f6;
                --primary-container:#3b82f6;
                --error:#dc2626;
                --gradient-button: linear-gradient(135deg,#3b82f6,#2563eb);
                --gradient-button-hover: linear-gradient(135deg,#2563eb,#1d4ed8);
                --radius-lg:10px;
                --radius-xl:18px;
                --radius-full:999px;
            }
            * {
                box-sizing:border-box;
                margin:0;
                padding:0;
            }
            body {
                font-family:'Inter', sans-serif;
                background:var(--bg-page);
                background-image:var(--bg-gradient);
                background-attachment:fixed;
                min-height:100vh;
                color:var(--on-surface-variant);
            }
            a {
                text-decoration:none;
                color:inherit;
            }
            button {
                font-family:inherit;
                cursor:pointer;
            }
            .material-symbols-outlined {
                vertical-align: middle;
            }

            /* --- Topbar simplificada solo para el preview --- */
            header.topbar {
                position: fixed;
                top:0;
                left:0;
                right:0;
                z-index:50;
                height:64px;
                display:flex;
                align-items:center;
                padding:0 24px;
                background-color: rgba(255,255,255,.8);
                backdrop-filter: blur(12px);
                -webkit-backdrop-filter: blur(12px);
                border-bottom:1px solid var(--card-border);
            }
            header.topbar::after {
                content:'';
                position:absolute;
                left:0;
                right:0;
                bottom:-1px;
                height:2px;
                background: linear-gradient(90deg,#38bdf8,#6366f1);
                opacity:.75;
            }
            .brand {
                display:flex;
                align-items:center;
                gap:8px;
            }
            .brand .material-symbols-outlined {
                color:#3b82f6;
                font-size:28px;
            }
            .brand span {
                font-family:'Manrope', sans-serif;
                font-weight:700;
                font-size:18px;
                background: linear-gradient(90deg,#38bdf8,#6366f1);
                -webkit-background-clip:text;
                background-clip:text;
                color:transparent;
            }

            .page-container {
                max-width: 760px;
                margin: 0 auto;
                padding: 100px 24px 48px;
                display: flex;
                flex-direction: column;
                gap: 16px;
            }

            .page-head {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 8px;
            }
            .page-head h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 28px;
                font-weight: 700;
                color: var(--on-surface);
            }
            .page-head p {
                font-size: 14px;
                color: var(--on-surface-variant);
                margin-top: 4px;
            }
            .unread-badge {
                display: inline-flex;
                align-items: center;
                padding: 4px 12px;
                border-radius: var(--radius-full);
                background: rgba(59,130,246,.12);
                color: var(--primary);
                font-size: 13px;
                font-weight: 600;
                white-space: nowrap;
            }

            .list-panel {
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border: 1px solid var(--card-border);
                border-radius: var(--radius-xl);
                box-shadow: 0 10px 30px -5px rgba(30,41,59,.06);
                overflow: hidden;
            }

            .notification-item {
                display: flex;
                gap: 14px;
                padding: 18px 24px;
                border-bottom: 1px solid var(--hairline);
                position: relative;
                transition: background .15s ease;
            }
            .notification-item:last-child {
                border-bottom: none;
            }
            .notification-item.unread {
                background: rgba(59,130,246,.05);
            }
            .notification-item:hover {
                background: rgba(59,130,246,.08);
            }

            .notif-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                flex-shrink: 0;
                display: flex;
                align-items: center;
                justify-content: center;
                background: var(--gradient-button);
                color: #fff;
            }
            .notification-item.unread .notif-icon {
                box-shadow: 0 0 0 3px rgba(59,130,246,.18);
            }

            .notif-body {
                flex: 1;
                min-width: 0;
            }
            .notif-subject {
                font-size: 14px;
                font-weight: 600;
                color: var(--on-surface);
                margin-bottom: 2px;
            }
            .notif-message {
                font-size: 13px;
                color: var(--on-surface-variant);
                line-height: 1.5;
            }
            .notif-footer {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-top: 10px;
                gap: 12px;
                flex-wrap: wrap;
            }
            .notif-date {
                font-size: 11px;
                color: var(--on-surface-faint);
                white-space: nowrap;
            }
            .notif-actions {
                display: flex;
                gap: 12px;
                align-items: center;
            }
            .notif-link {
                font-size: 12px;
                font-weight: 600;
                color: var(--primary);
            }
            .notif-link:hover {
                text-decoration: underline;
            }
            form.inline-mark {
                margin: 0;
            }
            .btn-mark-read {
                font-size: 12px;
                font-weight: 500;
                color: var(--on-surface-muted);
                border: 1px solid var(--card-border);
                padding: 4px 10px;
                border-radius: 6px;
                background: rgba(255,255,255,.5);
                transition: all .15s ease;
            }
            .btn-mark-read:hover {
                border-color: var(--primary);
                color: var(--primary);
            }

            .unread-dot {
                position: absolute;
                top: 20px;
                right: 24px;
                width: 8px;
                height: 8px;
                border-radius: 50%;
                background: var(--error);
            }

            .empty-state {
                padding: 60px 24px;
                text-align: center;
                color: var(--on-surface-muted);
            }
            .empty-state .material-symbols-outlined {
                font-size: 40px;
                opacity: .5;
                margin-bottom: 8px;
                display: block;
            }

            .back-link {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                color: var(--on-surface-variant);
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 8px;
            }
        </style>
    </head>
    <body>

        <header class="topbar">
            <div class="brand">
                <span class="material-symbols-outlined">support_agent</span>
                <span>TableHelp</span>
            </div>
        </header>

        <main class="page-container">

            <a class="back-link" href="#">
                <span class="material-symbols-outlined" style="font-size:18px;">arrow_back</span> Volver
            </a>

            <div class="page-head">
                <div>
                    <h1>Notificaciones</h1>
                    <p>Actualizaciones sobre tus tickets</p>
                </div>
                <span class="unread-badge">3 sin leer</span>
            </div>

            <div class="list-panel">

                <div class="notification-item unread">
                    <div class="notif-icon">
                        <span class="material-symbols-outlined" style="font-size:20px;">confirmation_number</span>
                    </div>
                    <div class="notif-body">
                        <p class="notif-subject">Ticket #4091 - EN_PROCESO</p>
                        <p class="notif-message">Su ticket "Falla en conexión Red Laboratorio 3" pasó de ASIGNADO a EN_PROCESO.</p>
                        <div class="notif-footer">
                            <span class="notif-date">Hace 10 minutos</span>
                            <div class="notif-actions">
                                <a class="notif-link" href="#">Ver ticket</a>
                                <form class="inline-mark">
                                    <button class="btn-mark-read" type="button">Marcar como leída</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <span class="unread-dot"></span>
                </div>

                <div class="notification-item unread">
                    <div class="notif-icon">
                        <span class="material-symbols-outlined" style="font-size:20px;">confirmation_number</span>
                    </div>
                    <div class="notif-body">
                        <p class="notif-subject">Ticket #4090 - ASIGNADO</p>
                        <p class="notif-message">Su ticket "Mantenimiento preventivo videobeam" fue asignado al agente Ana Torres.</p>
                        <div class="notif-footer">
                            <span class="notif-date">Hace 2 horas</span>
                            <div class="notif-actions">
                                <a class="notif-link" href="#">Ver ticket</a>
                                <form class="inline-mark">
                                    <button class="btn-mark-read" type="button">Marcar como leída</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <span class="unread-dot"></span>
                </div>

                <div class="notification-item unread">
                    <div class="notif-icon">
                        <span class="material-symbols-outlined" style="font-size:20px;">confirmation_number</span>
                    </div>
                    <div class="notif-body">
                        <p class="notif-subject">Ticket #4083 - RESUELTO</p>
                        <p class="notif-message">Su ticket "Instalación Git y GitHub Desktop" fue marcado como resuelto.</p>
                        <div class="notif-footer">
                            <span class="notif-date">Hace 1 día</span>
                            <div class="notif-actions">
                                <a class="notif-link" href="#">Ver ticket</a>
                                <form class="inline-mark">
                                    <button class="btn-mark-read" type="button">Marcar como leída</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <span class="unread-dot"></span>
                </div>

                <div class="notification-item">
                    <div class="notif-icon">
                        <span class="material-symbols-outlined" style="font-size:20px;">confirmation_number</span>
                    </div>
                    <div class="notif-body">
                        <p class="notif-subject">Ticket #4080 - CANCELADO</p>
                        <p class="notif-message">Su ticket "Solicitud de acceso a laboratorio de redes" fue cancelado por el administrador.</p>
                        <div class="notif-footer">
                            <span class="notif-date">Hace 3 días</span>
                            <div class="notif-actions">
                                <a class="notif-link" href="#">Ver ticket</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </main>
    </body>
</html>
