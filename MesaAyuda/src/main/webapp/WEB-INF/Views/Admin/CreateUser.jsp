<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Crear Usuario - Mesa de Ayuda CIMM</title>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Manrope:wght@600;700&amp;display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet">
        <style>
            :root {
                --color-primary: #0058be;
                --color-secondary: #4648d4;
                --color-tertiary: #006387;
                --color-background: #f9f9ff;
                --color-surface-container-lowest: #ffffff;
                --color-surface-container-low: #f0f3ff;
                --color-on-surface: #111c2d;
                --color-on-surface-variant: #424754;
                --color-outline: #727785;
                --color-border: #d7dfec;
                --color-error: #ba1a1a;
                --color-error-container: #ffdad6;
                --color-primary-fixed: #d8e2ff;
                --color-tertiary-fixed: #c4e7ff;
                --radius-lg: 0.5rem;
                --radius-xl: 0.75rem;
                --space-xs: 4px;
                --space-sm: 12px;
                --space-md: 24px;
                --space-lg: 48px;
            }
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
                min-height: 100vh;
                display: flex;
                justify-content: center;
                align-items: flex-start;
                padding: var(--space-lg) var(--space-md);
                background: linear-gradient(135deg, #f0f3ff 0%, #e7eeff 100%);
                color: var(--color-on-surface);
                font-family: 'Inter', sans-serif;
                font-size: 16px;
                line-height: 1.6;
                overflow-x: hidden;
            }
            h2 {
                font-family: 'Manrope', sans-serif;
                margin: 0;
            }

            /* Animaciones de entrada generales */
            @keyframes cardEntrance {
                0% {
                    opacity: 0;
                    transform: translateY(30px) scale(0.98);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0) scale(1);
                }
            }

            @keyframes fadeInStagger {
                0% {
                    opacity: 0;
                    transform: translateY(15px);
                }
                100% {
                    opacity: 1;
                    transform: translateY(0);
                }
            }

            .form-card {
                position: relative;
                width: 100%;
                max-width: 42rem;
                background: rgba(255,255,255,0.7);
                backdrop-filter: blur(16px);
                -webkit-backdrop-filter: blur(16px);
                border: 1px solid var(--color-border);
                border-radius: var(--radius-xl);
                box-shadow: 0 20px 40px -10px rgba(59,130,246,0.15);
                padding: var(--space-lg);
                overflow: hidden;
                animation: cardEntrance 0.6s cubic-bezier(0.16, 1, 0.3, 1) forwards;
            }

            /* Elementos internos con animación en cascada */
            .form-header, .field, .form-actions {
                animation: fadeInStagger 0.5s ease forwards;
                opacity: 0;
            }
            .form-header {
                animation-delay: 0.1s;
            }
            .field:nth-child(2) {
                animation-delay: 0.2s;
            }
            .field:nth-child(3) {
                animation-delay: 0.3s;
            }
            .field:nth-child(4) {
                animation-delay: 0.4s;
            }
            .form-actions {
                animation-delay: 0.5s;
            }

            .form-card::before, .form-card::after {
                content: '';
                position: absolute;
                width: 16rem;
                height: 16rem;
                border-radius: 50%;
                filter: blur(60px);
                opacity: 0.4;
                pointer-events: none;
                transition: transform 0.5s ease;
            }
            .form-card::before {
                top: -6rem;
                right: -6rem;
                background: var(--color-primary-fixed);
            }
            .form-card::after {
                bottom: -6rem;
                left: -6rem;
                background: var(--color-tertiary-fixed);
            }
            .form-header {
                position: relative;
                z-index: 1;
                text-align: center;
                margin-bottom: var(--space-lg);
            }
            .form-header h2 {
                font-size: 32px;
                margin-bottom: var(--space-xs);
                background: linear-gradient(135deg, var(--color-primary), var(--color-secondary));
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
            }
            .form-header p {
                color: var(--color-on-surface-variant);
                margin: 0;
            }
            form {
                position: relative;
                z-index: 1;
                display: flex;
                flex-direction: column;
                gap: var(--space-md);
            }
            .field {
                display: flex;
                flex-direction: column;
                gap: var(--space-xs);
                position: relative;
            }
            label {
                font-size: 14px;
                font-weight: 500;
                color: var(--color-on-surface);
                transition: color 0.2s ease;
            }
            input, select {
                background: rgba(255,255,255,0.5);
                border: 1px solid var(--color-border);
                border-radius: var(--radius-lg);
                padding: var(--space-sm) var(--space-md);
                font-size: 16px;
                color: var(--color-on-surface);
                font-family: inherit;
                width: 100%;
                transition: all 0.25s cubic-bezier(0.4, 0, 0.2, 1);
            }
            input::placeholder {
                color: var(--color-outline);
            }
            input:hover, select:hover {
                border-color: #93c5fd;
                background: rgba(255,255,255,0.8);
            }
            input:focus, select:focus {
                outline: none;
                border-color: #3b82f6;
                background: #ffffff;
                box-shadow: 0 0 0 4px rgba(59,130,246,0.15);
                transform: translateY(-1px);
            }
            input.invalid, select.invalid {
                border-color: var(--color-error);
                animation: shake 0.4s ease-in-out;
            }

            @keyframes shake {
                0%, 100% {
                    transform: translateX(0);
                }
                20%, 60% {
                    transform: translateX(-4px);
                }
                40%, 80% {
                    transform: translateX(4px);
                }
            }

            .field-error {
                font-size: 12px;
                color: var(--color-error);
                min-height: 14px;
                margin: 0;
                opacity: 0;
                transform: translateY(-4px);
                transition: opacity 0.2s ease, transform 0.2s ease;
            }
            .field-error.visible {
                opacity: 1;
                transform: translateY(0);
            }
            .select-wrap {
                position: relative;
            }
            .select-wrap select {
                appearance: none;
                cursor: pointer;
                padding-right: var(--space-lg);
            }
            .select-wrap .material-symbols-outlined {
                position: absolute;
                right: var(--space-md);
                top: 50%;
                transform: translateY(-50%);
                color: var(--color-on-surface-variant);
                pointer-events: none;
                transition: transform 0.3s ease;
            }
            .select-wrap select:focus ~ .material-symbols-outlined {
                transform: translateY(-50%) rotate(180deg);
                color: var(--color-primary);
            }
            .form-actions {
                display: flex;
                justify-content: flex-end;
                gap: var(--space-md);
                margin-top: var(--space-md);
                padding-top: var(--space-md);
                border-top: 1px solid var(--color-border);
            }
            .btn-outline {
                background: rgba(255,255,255,0.5);
                border: 1px solid var(--color-border);
                color: var(--color-primary);
                border-radius: var(--radius-lg);
                padding: var(--space-sm) var(--space-md);
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                transition: all 0.2s ease;
            }
            .btn-outline:hover {
                background: var(--color-surface-container-low);
                border-color: #93c5fd;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            }
            .btn-outline:active {
                transform: translateY(0);
            }
            .btn-gradient {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: #fff;
                border: none;
                border-radius: var(--radius-lg);
                padding: var(--space-sm) var(--space-md);
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                box-shadow: 0 4px 14px 0 rgba(59,130,246,0.3);
                transition: all 0.25s ease;
                position: relative;
                overflow: hidden;
            }
            .btn-gradient:hover {
                background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
                transform: translateY(-2px);
                box-shadow: 0 6px 20px 0 rgba(59,130,246,0.4);
            }
            .btn-gradient:active {
                transform: translateY(0);
            }
            .btn-gradient:disabled {
                opacity: 0.6;
                cursor: not-allowed;
                transform: none;
                box-shadow: none;
            }
        </style>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>
    <body>
        <div class="form-card">
            <div class="form-header">
                <h2>Crear Usuario</h2>
                <p>Agrega un nuevo miembro al sistema y asígnale un rol.</p>
            </div>

            <form id="createUserForm" action="${pageContext.request.contextPath}/AdminServlet" method="post">
                <input type="hidden" name="action" value="createUser">

                <div class="field">
                    <label for="fullName">Nombre completo</label>
                    <input id="fullName" name="fullName" type="text" placeholder="ej. Ana López" autocomplete="off">
                    <p class="field-error" data-error-for="fullName"></p>
                </div>

                <div class="field">
                    <label for="email">Correo electrónico</label>
                    <input id="email" name="email" type="email" placeholder="ana.lopez@sena.edu.co" autocomplete="off">
                    <p class="field-error" data-error-for="email"></p>
                </div>

                <div class="field">
                    <label for="role">Rol</label>
                    <div class="select-wrap">
                        <select id="role" name="idRole">
                            <option value="" disabled selected>-- Seleccione un rol registrado --</option>
                            <c:forEach var="r" items="${listRoles}">
                                <option value="${r.id}"> - ${r.name} - </option>
                            </c:forEach>
                        </select>
                        <span class="material-symbols-outlined">expand_more</span>
                    </div>
                    <p class="field-error" data-error-for="role"></p>
                </div>

                <div class="form-actions">
                    <button class="btn-outline" type="button" onclick="window.location.href = '${pageContext.request.contextPath}/AdminServlet?action=manageUsers'">Cancelar</button>
                    <button id="submitBtn" class="btn-gradient" type="submit">Crear Usuario</button>
                </div>
            </form>
        </div>

        <script>
            (function () {
                'use strict';

                var oForm = document.getElementById('createUserForm');
                var oSubmitBtn = document.getElementById('submitBtn');

                function showError(oInput, message) {
                    var oErrorEl = oForm.querySelector('[data-error-for="' + oInput.name + '"]');
                    if (oErrorEl) {
                        oErrorEl.textContent = message;
                        if (message) {
                            oErrorEl.classList.add('visible');
                        } else {
                            oErrorEl.classList.remove('visible');
                        }
                    }
                    oInput.classList.toggle('invalid', !!message);
                }

                function validateField(oInput) {
                    var validate = oValidators[oInput.name];
                    if (!validate)
                        return true;
                    var message = validate(oInput);
                    showError(oInput, message);
                    return message === '';
                }

                Object.keys(oValidators).forEach(function (fieldName) {
                    var oInput = oForm.elements[fieldName];
                    if (!oInput)
                        return;

                    oInput.addEventListener('blur', function () {
                        validateField(oInput);
                    });

                    oInput.addEventListener('input', function () {
                        if (oInput.classList.contains('invalid')) {
                            validateField(oInput);
                        }
                    });
                });

                oForm.addEventListener('submit', function (e) {
                    var isFormValid = Object.keys(oValidators).reduce(function (valid, fieldName) {
                        var oInput = oForm.elements[fieldName];
                        return oInput ? validateField(oInput) && valid : valid;
                    }, true);

                    if (!isFormValid) {
                        e.preventDefault();
                        // Efecto de enfoque visual al primer elemento con error
                        var firstInvalid = oForm.querySelector('.invalid');
                        if (firstInvalid) {
                            firstInvalid.focus();
                        }
                        return;
                    }

                    oSubmitBtn.disabled = true;
                    oSubmitBtn.style.opacity = '0.8';
                    oSubmitBtn.innerHTML = '<span style="display:inline-block; animation: rotation 1s infinite linear;">⏳</span> Creando...';
                });
            })();
        </script>

        <%
            String error = (String) request.getAttribute("errorMsg");
            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.error("¡Error!", "<%= error%>");
            });
        </script>
        <%} else {%>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                const url = new URLSearchParams(window.location.search);
                if (url.get('exito') === 'truecreate') {
                    Swal.fire({
                        title: '¡Realizado con éxito!',
                        text: 'El usuario ha sido creado',
                        icon: 'success',
                        timer: 3500,
                        timerProgressBar: true,
                        showConfirmButton: false,
                        showClass: {
                            popup: 'animate__animated animate__fadeInDown animate__faster'
                        },
                        hideClass: {
                            popup: 'animate__animated animate__fadeOutUp animate__faster'
                        },
                        willClose: () => {
                            window.location.href = 'AdminServlet?action=manageUsers';
                        }
                    });
                }
            });
        </script>
        <%}%>
    </body>
</html>