<%-- 
    Document   : index.jsp
    Created on : 7/08/2026, 9:35:22 p. m.
    Author     : Admin
--%>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login - Mesa de Ayuda</title>
        <!-- Google Material Symbols -->
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Manrope:wght@600;700;800&display=swap" rel="stylesheet">

        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: #0b1c30;
                color: #ffffff;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                -webkit-font-smoothing: antialiased;
            }

            /* Contenedor Principal / Fondo */
            main {
                flex-grow: 1;
                display: flex;
                align-items: center;
                justify-content: center;
                position: relative;
                padding: 24px;
                overflow: hidden;
            }

            .bg-container {
                position: absolute;
                inset: 0;
                z-index: 0;
                background-color: #0f172a;
                overflow: hidden;
            }

            .bg-container img {
                position: absolute;
                inset: 0;
                width: 100%;
                height: 100%;
                object-fit: cover;
                opacity: 0.4;
                filter: blur(2px);
                transform: scale(1.05);
            }

            .bg-overlay {
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, rgba(15, 23, 42, 0.8), rgba(30, 58, 138, 0.6), rgba(22, 78, 99, 0.7));
            }

            /* Tarjeta de Login Glassmorphism Oscura */
            .login-card {
                position: relative;
                z-index: 10;
                width: 100%;
                max-width: 440px;
                background: rgba(15, 23, 42, 0.75);
                backdrop-filter: blur(16px);
                -webkit-backdrop-filter: blur(16px);
                border: 1px solid rgba(255, 255, 255, 0.15);
                border-radius: 16px;
                box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
                padding: 32px;
                overflow: hidden;
                color: #ffffff;
            }

            .card-accent-line {
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 4px;
                background: linear-gradient(90deg, #38bdf8, #6366f1);
            }

            /* Cabecera del Formulario */
            .card-header {
                text-align: center;
                margin-bottom: 32px;
                padding-top: 16px;
            }

            .icon-wrapper {
                display: inline-flex;
                align-items: center;
                justify-content: center;
                width: 56px;
                height: 56px;
                background-color: rgba(37, 99, 235, 0.3);
                border-radius: 50%;
                margin-bottom: 16px;
                border: 1px solid rgba(96, 165, 250, 0.3);
            }

            .icon-wrapper span {
                color: #60a5fa;
                font-size: 30px;
            }

            .card-header h1 {
                font-family: 'Manrope', sans-serif;
                font-size: 28px;
                font-weight: 700;
                color: #ffffff;
                letter-spacing: -0.02em;
            }

            .card-header p {
                font-size: 14px;
                color: #cbd5e1;
                margin-top: 4px;
            }

            /* Estilos del Formulario */
            form {
                display: flex;
                flex-direction: column;
                gap: 20px;
            }

            .input-group {
                display: flex;
                flex-direction: column;
                gap: 6px;
            }

            .input-group label {
                font-size: 14px;
                font-weight: 600;
                color: #e2e8f0;
            }

            .input-wrapper {
                position: relative;
                display: flex;
                align-items: center;
            }

            .input-wrapper .material-symbols-outlined {
                position: absolute;
                left: 12px;
                color: #94a3b8;
                font-size: 18px;
            }

            .input-wrapper input {
                width: 100%;
                padding: 12px 16px 12px 40px;
                border: 1px solid #475569;
                background-color: rgba(30, 41, 59, 0.6);
                border-radius: 10px;
                font-size: 14px;
                color: #ffffff;
                outline: none;
                transition: all 0.2s ease;
            }

            .input-wrapper input::placeholder {
                color: #94a3b8;
            }

            .input-wrapper input:focus {
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25);
                background-color: rgba(15, 23, 42, 0.8);
            }

            /* Opciones Extra (Recordar / Olvidé contraseña) */
            .form-actions {
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
                color: #cbd5e1;
                cursor: pointer;
            }

            .remember-me input {
                width: 16px;
                height: 16px;
                accent-color: #2563eb;
                border-radius: 4px;
                background-color: #1e293b;
                border: 1px solid #475569;
            }

            .form-actions a {
                color: #60a5fa;
                text-decoration: none;
                font-weight: 500;
                transition: color 0.2s;
            }

            .form-actions a:hover {
                color: #93c5fd;
                text-decoration: underline;
            }

            /* Botón de Enviar con Gradiente */
            .btn-submit {
                width: 100%;
                background: linear-gradient(135deg, #3B82F6 0%, #2563EB 100%);
                color: #ffffff;
                border: none;
                border-radius: 10px;
                padding: 12px 24px;
                font-size: 14px;
                font-weight: 600;
                cursor: pointer;
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 8px;
                box-shadow: 0 4px 14px 0 rgba(59, 130, 246, 0.39);
                transition: all 0.2s ease;
                margin-top: 8px;
            }

            .btn-submit:hover {
                background: linear-gradient(135deg, #2563EB 0%, #1D4ED8 100%);
                transform: translateY(-1px);
                box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
            }

            .btn-submit:active {
                transform: translateY(1px);
            }

            /* Pie de la tarjeta */
            .card-footer {
                margin-top: 32px;
                text-align: center;
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                padding-top: 20px;
            }

            .card-footer p {
                font-size: 14px;
                color: #94a3b8;
            }

            .card-footer a {
                color: #60a5fa;
                text-decoration: none;
                font-weight: 500;
            }

            .card-footer a:hover {
                text-decoration: underline;
            }

            /* Footer General de la Página */
            footer {
                background-color: rgba(15, 23, 42, 0.9);
                backdrop-filter: blur(12px);
                border-top: 1px solid rgba(255, 255, 255, 0.1);
                position: relative;
                z-index: 10;
                color: #cbd5e1;
            }

            .footer-content {
                max-width: 1200px;
                margin: 0 auto;
                padding: 24px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: space-between;
                gap: 16px;
            }

            @media(min-width: 768px) {
                .footer-content {
                    flex-direction: row;
                }
            }

            .footer-brand {
                display: flex;
                align-items: center;
                gap: 8px;
                font-weight: 700;
                font-size: 16px;
                color: #ffffff;
            }

            .footer-brand span {
                color: #60a5fa;
            }

            .footer-links {
                display: flex;
                flex-wrap: wrap;
                justify-content: center;
                gap: 24px;
            }

            .footer-links a {
                font-size: 14px;
                color: #94a3b8;
                text-decoration: none;
                transition: color 0.2s;
            }

            .footer-links a:hover {
                color: #60a5fa;
            }

            .footer-copy {
                font-size: 13px;
                color: #64748b;
            }
        </style>
    </head>
    <body>

        <!-- Main Content -->
        <main>
            <!-- Modern Corporate Background -->
            <div class="bg-container" aria-hidden="true">
                <img src="https://lh3.googleusercontent.com/aida-public/AB6AXuCIKobOXIeN8nbtV02UgQ2IlFuCSdgL2palJtK2Puxh_ymGovFcwV0gaAkVQv9_wPPwXfadZ5mZfFPNTxcD2GPKQx1OBxsKEjmu-r33Tsg99fVXxfiYRUWFp9bvu6GJ4gHMTZFaF6zyvlpkFMFc59NxN-wME_SeOsK_Sf-kwt0ip_Vv4_ghH4tCXqNtKRoiJGQALLq0sueImOCVcOAd4Gif-JpKZsfUsRPumIi07cR-si6DrtYpRmxO" alt="">
                <div class="bg-overlay"></div>
            </div>

            <!-- Login Card con Estilo Oscuro / Glassmorphism -->
            <div class="login-card">
                <div class="card-accent-line"></div>
                
                <div class="card-header">
                    <div class="icon-wrapper">
                        <span class="material-symbols-outlined" aria-hidden="true">support_agent</span>
                    </div>
                    <h1>Mesa de Ayuda</h1>
                    <p>Portal de Soporte Técnico</p>
                </div>

                <!-- Formulario apuntando a tu Servlet o controlador -->
                <form action="loginController" method="POST">
                    <!-- Email Field -->
                    <div class="input-group">
                        <label for="email">Correo Electrónico</label>
                        <div class="input-wrapper">
                            <span class="material-symbols-outlined">mail</span>
                            <input type="email" id="email" name="email" placeholder="Ingresa tu correo corporativo" required>
                        </div>
                    </div>

                    <!-- Password Field -->
                    <div class="input-group">
                        <label for="password">Contraseña</label>
                        <div class="input-wrapper">
                            <span class="material-symbols-outlined">lock</span>
                            <input type="password" id="password" name="password" placeholder="Ingresa tu contraseña" required>
                        </div>
                    </div>

                    <!-- Remember Me & Forgot Password -->
                    <div class="form-actions">
                        <label class="remember-me" for="remember_me">
                            <input type="checkbox" id="remember_me" name="remember_me">
                            Recordarme
                        </label>
                        <a href="#">¿Olvidaste tu contraseña?</a>
                    </div>

                    <!-- Sign In Button -->
                    <button type="submit" class="btn-submit">
                        Iniciar Sesión
                        <span class="material-symbols-outlined" style="font-size: 16px;">arrow_forward</span>
                    </button>
                </form>

                <div class="card-footer">
                    <p>¿Necesitas ayuda? Contacta a <a href="#">Soporte IT</a>.</p>
                </div>
            </div>
        </main>



    </body>
</html>