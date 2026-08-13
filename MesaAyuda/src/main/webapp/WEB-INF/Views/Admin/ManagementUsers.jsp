<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Gestión de Usuarios - Mesa de Ayuda CIMM</title>
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
                --color-surface-container-high: #dee8ff;
                --color-on-surface: #111c2d;
                --color-on-surface-variant: #424754;
                --color-outline: #727785;
                --color-border: #d7dfec;
                --color-error: #ba1a1a;
                --color-error-container: #ffdad6;
                --color-success: #10b981;
                --color-success-dark: #059669;
                --color-primary-fixed: #d8e2ff;
                --radius-sm: 0.25rem;
                --radius-lg: 0.5rem;
                --radius-xl: 0.75rem;
                --radius-full: 9999px;
                --space-xs: 4px;
                --space-sm: 12px;
                --space-base: 8px;
                --space-md: 24px;
                --space-lg: 48px;
            }
            * {
                box-sizing: border-box;
            }
            body {
                margin: 0;
                background: var(--color-background);
                color: var(--color-on-surface);
                font-family: 'Inter', sans-serif;
                font-size: 16px;
                line-height: 1.6;
            }
            h1, h2, h3 {
                font-family: 'Manrope', sans-serif;
                margin: 0;
            }
            .content-canvas {
                max-width: 1280px;
                margin: 0 auto;
                padding: var(--space-md);
            }
            .page-header {
                display: flex;
                flex-wrap: wrap;
                justify-content: space-between;
                align-items: center;
                gap: var(--space-md);
                margin-bottom: var(--space-lg);
                animation: fadeInUp .4s ease both;
            }
            .page-header h2 {
                font-size: 40px;
                letter-spacing: -0.02em;
            }
            .page-header p {
                color: var(--color-on-surface-variant);
                font-size: 18px;
                margin-top: 4px;
            }
            .alert-error {
                background: var(--color-error-container);
                color: var(--color-error);
                padding: var(--space-sm);
                border-radius: var(--radius-lg);
                margin-bottom: var(--space-md);
                font-size: 14px;
                animation: shake .4s ease;
            }
            .glass-panel {
                background: rgba(255,255,255,0.6);
                backdrop-filter: blur(12px);
                border: 1px solid var(--color-border);
                box-shadow: 0 10px 30px -5px rgba(59,130,246,0.12);
            }
            .toolbar {
                border-radius: var(--radius-xl);
                padding: var(--space-md);
                margin-bottom: var(--space-md);
                display: flex;
                flex-wrap: wrap;
                gap: var(--space-md);
                align-items: center;
                justify-content: space-between;
                animation: fadeInUp .4s ease .05s both;
            }
            .search-box {
                position: relative;
                width: 100%;
                max-width: 24rem;
            }
            .search-box .material-symbols-outlined {
                position: absolute;
                left: var(--space-sm);
                top: 50%;
                transform: translateY(-50%);
                color: var(--color-outline);
            }
            .search-box input {
                width: 100%;
                padding: var(--space-sm) var(--space-sm) var(--space-sm) 40px;
                border-radius: var(--radius-lg);
                border: 1px solid var(--color-border);
                background: rgba(255,255,255,0.4);
                font-size: 16px;
                color: var(--color-on-surface);
                transition: box-shadow .2s ease, border-color .2s ease;
            }
            .search-box input:focus {
                outline: none;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59,130,246,0.2);
            }
            .filter-chips {
                display: flex;
                align-items: center;
                gap: var(--space-base);
                overflow-x: auto;
            }
            .chip {
                padding: var(--space-xs) var(--space-sm);
                border-radius: var(--radius-full);
                border: 1px solid transparent;
                background: transparent;
                color: var(--color-on-surface-variant);
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                white-space: nowrap;
                transition: all 0.15s ease;
            }
            .chip:hover {
                background: var(--color-surface-container-high);
                transform: translateY(-1px);
            }
            .chip.active {
                background: rgba(70,72,212,0.1);
                color: var(--color-secondary);
                border-color: rgba(70,72,212,0.2);
            }
            .table-card {
                border-radius: var(--radius-xl);
                overflow: hidden;
                animation: fadeInUp .4s ease .1s both;
            }
            .table-scroll {
                overflow-x: auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                text-align: left;
            }
            thead tr {
                border-bottom: 1px solid var(--color-border);
                background: rgba(255,255,255,0.3);
            }
            th {
                padding: var(--space-md);
                font-size: 14px;
                font-weight: 600;
                color: var(--color-on-surface-variant);
            }
            th.text-right {
                text-align: right;
            }
            tbody tr {
                border-bottom: 1px solid #e2e8f2;
                transition: background 0.15s ease, transform 0.15s ease;
                opacity: 0;
                animation: fadeInUp .35s ease forwards;
            }
            tbody tr:hover {
                background: #f6f8fb;
            }
            tbody tr:last-child {
                border-bottom: none;
            }
            tbody tr.row-hidden {
                display: none;
            }
            td {
                padding: var(--space-md);
                font-size: 16px;
                color: var(--color-on-surface-variant);
                vertical-align: middle;
            }
            .cell-name {
                font-weight: 600;
                color: var(--color-on-surface);
                font-size: 14px;
            }
            .cell-email {
                font-size: 13px;
                color: var(--color-on-surface-variant);
            }
            .hide-mobile {
                display: table-cell;
            }
            .hide-desktop {
                display: none;
            }
            .text-right {
                text-align: right;
            }
            .badge {
                display: inline-flex;
                align-items: center;
                gap: var(--space-xs);
                padding: 3px var(--space-sm);
                border-radius: var(--radius-full);
                font-size: 12px;
                font-weight: 500;
                white-space: nowrap;
            }
            .badge .dot {
                width: 7px;
                height: 7px;
                border-radius: 50%;
            }
            .badge-role-administrador {
                background: rgba(70,72,212,0.1);
                color: var(--color-secondary);
            }
            .badge-role-administrador .dot {
                background: var(--color-secondary);
            }
            .badge-role-agente {
                background: rgba(0,99,135,0.1);
                color: var(--color-tertiary);
            }
            .badge-role-agente .dot {
                background: var(--color-tertiary);
            }
            .badge-role-solicitante {
                background: rgba(114,119,133,0.12);
                color: var(--color-outline);
            }
            .badge-role-solicitante .dot {
                background: var(--color-outline);
            }
            .row-actions {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: var(--space-xs);
            }
            .icon-btn {
                position: relative;
                overflow: hidden;
                padding: var(--space-xs) var(--space-sm);
                border-radius: var(--radius-sm);
                border: none;
                background: transparent;
                color: var(--color-primary);
                cursor: pointer;
                display: flex;
                align-items: center;
                gap: var(--space-xs);
                font-size: 13px;
                font-weight: 500;
                transition: background 0.15s ease, transform 0.1s ease;
            }
            .icon-btn:hover {
                background: var(--color-surface-container-high);
                transform: translateY(-1px);
            }
            .icon-btn:active {
                transform: scale(.96);
            }
            .empty-state {
                padding: var(--space-lg) var(--space-md);
                text-align: center;
                color: var(--color-on-surface-variant);
            }
            .newUser {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: #fff;
                border: none;
                text-decoration: none;
                border-radius: var(--radius-lg);
                padding: var(--space-sm) var(--space-md);
                font-size: 14px;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: var(--space-xs);
                cursor: pointer;
                box-shadow: 0 4px 14px 0 rgba(59,130,246,0.2);
                transition: all 0.2s ease;
            }
            .newUser:hover {
                background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%);
                transform: translateY(-1px);
            }
            .newUser:active {
                transform: scale(0.97);
            }
            .btn-outline {
                background: transparent;
                border: 1px solid var(--color-border);
                color: var(--color-primary);
                border-radius: var(--radius-lg);
                padding: var(--space-xs) var(--space-sm);
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                transition: background 0.15s ease;
            }
            .btn-outline:hover {
                background: var(--color-surface-container-low);
            }
            .btn-gradient {
                background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
                color: #fff;
                border: none;
                border-radius: var(--radius-lg);
                padding: var(--space-xs) var(--space-md);
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
                transition: all .2s ease;
            }
            .btn-gradient:hover {
                transform: translateY(-1px);
            }
            .modal-overlay {
                position: fixed;
                inset: 0;
                background: rgba(17,28,45,0.4);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 50;
                animation: fadeIn .2s ease;
            }
            .modal-overlay[hidden] {
                display: none;
            }
            .modal-card {
                background: var(--color-surface-container-lowest);
                border-radius: var(--radius-xl);
                padding: var(--space-md);
                width: 90%;
                max-width: 420px;
                box-shadow: 0 20px 40px -10px rgba(17,28,45,0.3);
                animation: popIn .2s ease;
            }
            .modal-card h3 {
                font-size: 18px;
                margin-bottom: var(--space-xs);
            }
            .modal-card p {
                color: var(--color-on-surface-variant);
                font-size: 14px;
                margin: 0 0 var(--space-md);
            }
            .modal-actions {
                display: flex;
                justify-content: flex-end;
                gap: var(--space-xs);
                margin-top: var(--space-md);
            }
            .field {
                margin-bottom: var(--space-sm);
            }
            .field label {
                display: block;
                font-size: 14px;
                font-weight: 500;
                margin-bottom: 4px;
                color: var(--color-on-surface);
            }
            .field input {
                width: 100%;
                padding: var(--space-xs) var(--space-sm);
                border-radius: var(--radius-lg);
                border: 1px solid var(--color-border);
                font-size: 14px;
                transition: border-color .15s ease, box-shadow .15s ease;
            }
            .field input:focus {
                outline: none;
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
            }
            .ripple {
                position: absolute;
                border-radius: 50%;
                transform: scale(0);
                background: rgba(255,255,255,0.55);
                animation: rippleAnim .6s ease-out;
                pointer-events: none;
            }
            @keyframes rippleAnim {
                to {
                    transform: scale(2.5);
                    opacity: 0;
                }
            }
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(8px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @keyframes fadeIn {
                from {
                    opacity: 0;
                }
                to {
                    opacity: 1;
                }
            }
            @keyframes popIn {
                from {
                    opacity: 0;
                    transform: scale(.94);
                }
                to {
                    opacity: 1;
                    transform: scale(1);
                }
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
            @media (max-width: 768px) {
                .hide-mobile {
                    display: none;
                }
                .hide-desktop {
                    display: block;
                }
                .page-header h2 {
                    font-size: 28px;
                }
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />

        <c:if test="${not empty errorMsg}">
            <div class="alert-error">${errorMsg}</div>
        </c:if>

        <main>
            <div class="content-canvas">
                <div class="page-header">
                    <div>
                        <h2>Gestión de Usuarios</h2>
                        <p>Administra los perfiles de la Mesa de Ayuda.</p>
                    </div>
                    <a class="newUser" href="${pageContext.request.contextPath}/AdminServlet?action=new">
                        <span class="material-symbols-outlined">add</span> Crear Usuario
                    </a>
                </div>

                <div class="toolbar glass-panel">
                    <div class="search-box">
                        <span class="material-symbols-outlined">search</span>
                        <input id="userSearchInput" type="text" placeholder="Buscar por nombre o correo...">
                    </div>
                    <div class="filter-chips" id="roleFilters">
                        <button class="chip active" data-role="all">Todos</button>
                        <button class="chip" data-role="Administrador">Admins</button>
                        <button class="chip" data-role="Agente">Agentes</button>
                        <button class="chip" data-role="Solicitante">Solicitantes</button>
                    </div>
                </div>

                <div class="table-card glass-panel">
                    <div class="table-scroll">
                        <table>
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th class="hide-mobile">Correo Electrónico</th>
                                    <th>Rol</th>
                                    <th class="text-right">Acciones</th>
                                </tr>
                            </thead>
                            <tbody id="userTableBody">
                                <c:forEach var="item" items="${listUsers}" varStatus="loop">
                                    <tr data-name="${fn:toLowerCase(item.name)}"
                                        data-email="${fn:toLowerCase(item.email)}"
                                        data-role="${item.role}"
                                        style="animation-delay: ${loop.index * 0.04}s;">
                                        <td><div class="cell-name">${item.name}</div></td>
                                        <td class="hide-mobile"><div class="cell-email">${item.email}</div></td>
                                        <td>
                                            <span class="badge badge-role-${fn:toLowerCase(item.role)}">
                                                <span class="dot"></span>${item.role}
                                            </span>
                                        </td>
                                        <td class="text-right">
                                            <div class="row-actions">
                                                <button class="icon-btn" type="button" data-action="edit"
                                                        data-id="${item.id}" data-name="${item.name}"
                                                        data-email="${item.email}">
                                                    <span class="material-symbols-outlined" style="font-size: 16px;">edit</span>
                                                    Editar
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <c:if test="${empty listUsers}">
                                    <tr><td colspan="4" class="empty-state">No hay usuarios registrados.</td></tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    <p id="emptyFilterMsg" class="empty-state" style="display:none;">Ningún usuario coincide con la búsqueda.</p>
                </div>
            </div>
        </main>

        <div id="editModal" class="modal-overlay" hidden>
            <div class="modal-card">
                <h3>Editar Usuario</h3>
                <p>Modifica los datos del usuario seleccionado.</p>
                <form id="editUserForm" action="${pageContext.request.contextPath}/AdminServlet" method="post">
                    <input type="hidden" name="action" value="updateUser">
                    <input type="hidden" id="editUserId" name="id">
                    <div class="field">
                        <label for="editName">Nombre</label>
                        <input type="text" id="editName" name="name" required>
                    </div>
                    <div class="field">
                        <label for="editEmail">Correo Electrónico</label>
                        <input type="email" id="editEmail" name="email" required>
                    </div>
                    <div class="modal-actions">
                        <button id="editCancelBtn" class="btn-outline" type="button">Cancelar</button>
                        <button type="submit" class="btn-gradient">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>

        <script>
            (function () {
                'use strict';

                var oSearchInput = document.getElementById('userSearchInput');
                var oRoleFilters = document.getElementById('roleFilters');
                var oTableBody = document.getElementById('userTableBody');
                var oEmptyFilterMsg = document.getElementById('emptyFilterMsg');

                var oEditModal = document.getElementById('editModal');
                var oEditCancelBtn = document.getElementById('editCancelBtn');
                var oEditUserIdInput = document.getElementById('editUserId');
                var oEditNameInput = document.getElementById('editName');
                var oEditEmailInput = document.getElementById('editEmail');

                var currentRole = 'all';
                var currentTerm = '';

                function normalize(text) {
                    return (text || '')
                            .toLowerCase()
                            .normalize('NFD')
                            .replace(/[\u0300-\u036f]/g, '');
                }

                function applyFilters() {
                    var oRows = oTableBody.querySelectorAll('tr[data-name]');
                    var visibleCount = 0;

                    oRows.forEach(function (oRow) {
                        var matchesRole = currentRole === 'all' || oRow.dataset.role === currentRole;
                        var matchesTerm =
                                currentTerm === '' ||
                                normalize(oRow.dataset.name).indexOf(currentTerm) !== -1 ||
                                normalize(oRow.dataset.email).indexOf(currentTerm) !== -1;

                        var isVisible = matchesRole && matchesTerm;
                        oRow.classList.toggle('row-hidden', !isVisible);
                        if (isVisible)
                            visibleCount++;
                    });

                    oEmptyFilterMsg.style.display = (visibleCount === 0 && oRows.length > 0) ? 'block' : 'none';
                }

                if (oSearchInput) {
                    oSearchInput.addEventListener('input', function (e) {
                        currentTerm = normalize(e.target.value.trim());
                        applyFilters();
                    });
                }

                if (oRoleFilters) {
                    oRoleFilters.addEventListener('click', function (e) {
                        var oChip = e.target.closest('.chip');
                        if (!oChip)
                            return;

                        oRoleFilters.querySelectorAll('.chip').forEach(function (c) {
                            c.classList.remove('active');
                        });
                        oChip.classList.add('active');

                        currentRole = oChip.dataset.role;
                        applyFilters();
                    });
                }

                function openEditModal(id, name, email) {
                    oEditUserIdInput.value = id;
                    oEditNameInput.value = name;
                    oEditEmailInput.value = email;
                    oEditModal.hidden = false;
                }

                function closeEditModal() {
                    oEditModal.hidden = true;
                }

                if (oTableBody) {
                    oTableBody.addEventListener('click', function (e) {
                        var oEditBtn = e.target.closest('[data-action="edit"]');
                        if (!oEditBtn)
                            return;
                        openEditModal(oEditBtn.dataset.id, oEditBtn.dataset.name, oEditBtn.dataset.email);
                    });
                }

                if (oEditCancelBtn)
                    oEditCancelBtn.addEventListener('click', closeEditModal);
                if (oEditModal) {
                    oEditModal.addEventListener('click', function (e) {
                        if (e.target === oEditModal)
                            closeEditModal();
                    });
                }
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && oEditModal && !oEditModal.hidden)
                        closeEditModal();
                });

                function addRippleTo(oButton) {
                    oButton.addEventListener('click', function (e) {
                        var rect = oButton.getBoundingClientRect();
                        var size = Math.max(rect.width, rect.height);
                        var oRipple = document.createElement('span');
                        oRipple.className = 'ripple';
                        oRipple.style.width = oRipple.style.height = size + 'px';
                        oRipple.style.left = (e.clientX - rect.left - size / 2) + 'px';
                        oRipple.style.top = (e.clientY - rect.top - size / 2) + 'px';
                        oButton.appendChild(oRipple);
                        setTimeout(function () {
                            oRipple.remove();
                        }, 600);
                    });
                }
                document.querySelectorAll('.icon-btn, .newUser, .btn-gradient').forEach(addRippleTo);
            })();
        </script>

        <%
            String error = (String) request.getAttribute("errorMsg");
            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                Swal.fire({icon: 'error', title: '¡Error!', text: <%= "\"" + error.replace("\"", "\\\"") + "\""%>});
            });
        </script>
        <% } else { %>
        <script>
            window.addEventListener('DOMContentLoaded', function () {
                var url = new URLSearchParams(window.location.search);
                if (url.get('exito') === 'trueupdate') {
                    Swal.fire({
                        title: '¡Realizado con éxito!',
                        text: 'Información actualizada correctamente',
                        icon: 'success',
                        timer: 3500,
                        timerProgressBar: true,
                        showConfirmButton: false
                    });
                }
            });
        </script>
        <% }%>
    </body>
</html>
