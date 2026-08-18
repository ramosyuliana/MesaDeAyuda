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

            html, body {
                height: 100%;
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

            /* ---------- Main ---------- */
            main {
                flex-grow: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                padding: 24px;
                overflow: hidden;
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
                animation: card-in 0.5s ease forwards;
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
            }
            .login-icon .material-symbols-outlined {
                color: var(--primary);
                font-size: 30px;
            }

            .login-header h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 28px;
                font-weight: 700;
                color: var(--on-surface);
                letter-spacing: -0.01em;
                margin: 0;
            }
            .login-header p {
                font-size: 14px;
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

            .row-between {
                display: flex;
                align-items: center;
                justify-content: space-between;
                font-size: 14px;
                padding: 4px 0;
            }
            .remember-me {
                display: flex;
                align-items: center;
                gap: 8px;
                color: var(--on-surface-variant);
                cursor: pointer;
                user-select: none;
            }
            .remember-me input {
                width: 16px;
                height: 16px;
                accent-color: var(--primary);
                border-radius: 4px;
                border: 1px solid var(--border-soft);
                background: var(--surface-container-low);
            }
            .link-accent {
                color: var(--link);
                font-weight: 500;
                transition: color 0.2s ease;
            }
            .link-accent:hover {
                color: var(--link-hover);
                text-decoration: underline;
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
            }
            .btn-submit:hover {
                background: var(--gradient-button-hover);
                box-shadow: 0 12px 24px -8px rgba(37,99,235,0.5);
            }
            .btn-submit:active {
                transform: scale(0.99);
            }

            .login-footer-note {
                margin-top: 32px;
                text-align: center;
                border-top: 1px solid var(--hairline);
                padding-top: 20px;
            }
            .login-footer-note p {
                font-size: 14px;
                color: var(--on-surface-muted);
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

            h1{
                font-size: 2px;
            }
        </style>
    </head>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    <body>

        <!-- Main Content -->
        <main>
            <!-- Fondo con imagen y overlay claro -->
            <div class="bg-photo" aria-hidden="true">
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCIKobOXIeN8nbtV02UgQ2IlFuCSdgL2palJtK2Puxh_ymGovFcwV0gaAkVQv9_wPPwXfadZ5mZfFPNTxcD2GPKQx1OBxsKEjmu-r33Tsg99fVXxfiYRUWFp9bvu6GJ4gHMTZFaF6zyvlpkFMFc59NxN-wME_SeOsK_Sf-kwt0ip_Vv4_ghH4tCXqNtKRoiJGQALLq0sueImOCVcOAd4Gif-JpKZsfUsRPumIi07cR-si6DrtYpRmxO" alt="">
            </div>

            <!-- Tarjeta de login -->
            <div class="login-card">
                <div class="accent-line"></div>

                <div class="login-header">
                    <div class="login-icon">
                        <span class="material-symbols-outlined" aria-hidden="true">support_agent</span>
                    </div>
                    <h1 style="font-size: 19px;">Mesa de Ayuda</h1>
                    <p style="font-size: 12px;">Portal de Soporte Técnico</p>
                </div>

                <!-- Formulario apuntando a tu Servlet o controlador -->
                <form action="${pageContext.request.contextPath}/AuthServlet" method="POST">
                    <input type="hidden" name="action" value="ingresar">
                    <div class="field">
                        <label for="email">Correo Electrónico</label>
                        <div class="field-input-wrap">
                            <span class="material-symbols-outlined">mail</span>
                            <input type="email" id="email" name="email" placeholder="Ingresa tu correo corporativo" required>
                        </div>
                    </div>

                    <button type="submit" class="btn-submit">
                        Iniciar Sesión
                        <span class="material-symbols-outlined" style="font-size:16px">arrow_forward</span>
                    </button>
                </form>

            </div>
        </main>

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


    </body>
</html>
