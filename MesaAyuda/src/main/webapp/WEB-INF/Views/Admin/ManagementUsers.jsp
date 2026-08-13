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
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&amp;family=Manrope:wght@400;600;700&amp;display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap" rel="stylesheet"/>
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
            }
            .chip.active {
                background: rgba(70,72,212,0.1);
                color: var(--color-secondary);
                border-color: rgba(70,72,212,0.2);
            }
            .table-card {
                border-radius: var(--radius-xl);
                overflow: hidden;
            }
            .table-scroll {
                overflow-x: auto;
            }
            /* Asegura que la tabla ocupe todo el ancho disponible */
            table {
                width: 100%;
                border-collapse: collapse;
                table-layout: auto;
            }

            /* Alinea los textos y contenedores de la última columna a la derecha */
            th.text-right,
            td .row-actions {
                text-align: right;
                display: flex;
                justify-content: flex-end;
                gap: 8px; /* Espacio uniforme entre el botón de Editar y Eliminar */
            }

            /* Evita que los botones se estiren de más */
            .row-actions button {
                white-space: nowrap;
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
            tbody tr {
                border-bottom: 1px solid #e2e8f2;
                transition: background 0.15s ease;
            }
            tbody tr:hover {
                background: #f6f8fb;
            }
            tbody tr:last-child {
                border-bottom: none;
            }
            td {
                padding: var(--space-md);
                font-size: 16px;
                color: var(--color-on-surface-variant);
                vertical-align: middle;
            }
            .user-cell {
                display: flex;
                align-items: center;
                gap: var(--space-sm);
            }
            .user-cell img, .avatar-fallback {
                width: 40px;
                height: 40px;
                border-radius: var(--radius-full);
                object-fit: cover;
                flex-shrink: 0;
            }
            .avatar-fallback {
                display: flex;
                align-items: center;
                justify-content: center;
                background: var(--color-primary-fixed);
                color: var(--color-primary);
                font-family: 'Manrope', sans-serif;
                font-weight: 700;
                font-size: 16px;
            }
            .user-name {
                margin: 0;
                font-weight: 600;
                color: var(--color-on-surface);
                font-size: 14px;
            }
            .user-email {
                margin: 2px 0 0;
                font-size: 12px;
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
                padding: 2px var(--space-xs);
                border-radius: var(--radius-full);
                font-size: 12px;
                font-weight: 500;
                white-space: nowrap;
            }
            .badge .dot {
                width: 8px;
                height: 8px;
                border-radius: 50%;
            }
            .badge-role-administrador {
                background: rgba(70,72,212,0.1);
                color: var(--color-secondary);
                border-radius: var(--radius-sm);
            }
            .badge-role-administrador .dot {
                background: var(--color-secondary);
            }
            .badge-role-agente {
                background: rgba(0,99,135,0.1);
                color: var(--color-tertiary);
                border-radius: var(--radius-sm);
            }
            .badge-role-agente .dot {
                background: var(--color-tertiary);
            }
            .badge-role-solicitante {
                background: rgba(114,119,133,0.1);
                color: var(--color-outline);
                border-radius: var(--radius-sm);
            }
            .badge-role-solicitante .dot {
                background: var(--color-outline);
            }
            .badge-active {
                background: rgba(16,185,129,0.1);
                color: var(--color-success-dark);
            }
            .badge-active .dot {
                background: var(--color-success);
            }
            .badge-inactive {
                background: rgba(114,119,133,0.1);
                color: var(--color-outline);
            }
            .badge-inactive .dot {
                background: var(--color-outline);
            }
            .row-actions {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: var(--space-xs);
            }
            .icon-btn {
                padding: var(--space-xs);
                border-radius: var(--radius-sm);
                border: none;
                background: transparent;
                color: var(--color-primary);
                cursor: pointer;
                display: flex;
                align-items: center;
            }
            .icon-btn:hover {
                background: var(--color-surface-container-high);
            }
            .icon-btn-danger {
                color: var(--color-error);
            }
            .icon-btn-danger:hover {
                background: rgba(186,26,26,0.08);
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
            .btn-danger {
                background: var(--color-error);
                color: #fff;
                border: none;
                border-radius: var(--radius-lg);
                padding: var(--space-xs) var(--space-md);
                font-size: 14px;
                font-weight: 500;
                cursor: pointer;
            }
            .btn-danger:hover {
                background: #a01616;
            }
            .modal-overlay {
                position: fixed;
                inset: 0;
                background: rgba(17,28,45,0.4);
                display: flex;
                align-items: center;
                justify-content: center;
                z-index: 50;
            }
            .modal-overlay[hidden] {
                display: none;
            }
            .modal-card {
                background: var(--color-surface-container-lowest);
                border-radius: var(--radius-xl);
                padding: var(--space-md);
                width: 90%;
                max-width: 360px;
                box-shadow: 0 20px 40px -10px rgba(17,28,45,0.3);
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

            /* ---------- Tabla ---------- */
            .table-card {
                border-radius: var(--radius-xl);
                overflow: hidden;
                position: relative;
            }
            .table-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 3px;
                background: var(--brand-gradient);
                z-index: 2;
            }
            .table-scroll {
                overflow-x: auto;
            }
            table {
                width: 100%;
                table-layout: fixed;
                text-align: left;
                border-collapse: collapse;
            }

            thead tr {
                border-bottom: 1px solid var(--card-border);
                background: rgba(233,238,245,.5);
            }
            th {
                padding: var(--sp-sm) var(--sp-md);
                font-size: 14px;
                font-weight: 600;
                color: var(--text-label);
            }
            th.align-right {
                text-align: right;
            }

            tbody tr {
                border-bottom: 1px solid var(--card-border);
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
            td {
                padding: var(--sp-md);
                font-size: 16px;
                vertical-align: middle;
            }

            .cell-name {
                font-weight: 600;
                color: var(--text-title);
            }
            .cell-email {
                font-size: 12px;
                line-height: 1.4;
                color: var(--text-muted);
                margin-top: var(--sp-xs);
            }

            .status {
                display: inline-flex;
                align-items: center;
                padding: 4px var(--sp-sm);
                border-radius: var(--radius-full);
                font-size: 12px;
                font-weight: 500;
                letter-spacing: .01em;
            }
            .status .dot {
                width: 6px;
                height: 6px;
                border-radius: 50%;
                margin-right: var(--sp-xs);
            }
            .status-progress {
                background: rgba(59,130,246,.1);
                color: var(--primary);
                border: 1px solid rgba(59,130,246,.2);
            }
            .status-progress .dot {
                background: var(--primary-container);
            }
            .status-pending {
                background: var(--surface-container);
                color: var(--text-secondary);
                border: 1px solid var(--card-border);
            }
            .status-pending .dot {
                background: #6b7280; /* Gris visible para Solicitante */
            }
            .status-review {
                background: rgba(56,189,248,.14);
                color: #0284c7;
                border: 1px solid rgba(56,189,248,.25);
            }
            .status-review .dot {
                background: #0284c7; /* Celeste/Azul visible para Agente */
            }

            .row-actions {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: var(--sp-sm);
                opacity: 0;
                transform: translateX(6px);
                transition: opacity var(--t-base), transform var(--t-base);
            }
            tbody tr:hover .row-actions,
            tbody tr:focus-within .row-actions {
                opacity: 1;
                transform: none;
            }

            .btn-cancel {
                padding: 4px var(--sp-sm);
                border-radius: 6px;
                border: 1px solid var(--card-border);
                color: var(--color-error);
                font-size: 12px;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: var(--sp-xs);
                white-space: nowrap;
                transition: background var(--t-fast), border-color var(--t-fast), transform var(--t-fast);
            }
            .btn-cancel:hover {
                background: rgba(220,38,38,.08);
                border-color: rgba(220,38,38,.5);
                transform: translateY(-1px);
            }
            .btn-cancel:active {
                transform: scale(.96);
            }

            .btn-reassign {
                position: relative;
                overflow: hidden;
                padding: 4px var(--sp-sm);
                border-radius: 6px;
                background: var(--btn-gradient);
                color: #fff;
                font-size: 12px;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: var(--sp-xs);
                white-space: nowrap;
                box-shadow: var(--shadow-subtle);
                transition: background var(--t-base), box-shadow var(--t-base), transform var(--t-fast);
            }
            .btn-reassign:hover {
                background: var(--btn-hover-gradient);
                box-shadow: var(--shadow-hover);
                transform: translateY(-1px);
            }
            .btn-reassign:active {
                transform: scale(.96);
            }


        </style>

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
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
                        <p>Administra los perfiles y roles de la Mesa de Ayuda</p>
                    </div>
                    <a class="newUser" href="${pageContext.request.contextPath}/AdminServlet?action=new"><span class="material-symbols-outlined">add</span> Crear Usuario</a>

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
                                <c:forEach var="item" items="${listUsers}">
                                    <tr data-name="${item.name}" data-email="${item.email}" data-role="${item.role}">
                                        <td>
                                            <div class="cell-name">${item.name}</div>
                                        </td>
                                        <td class="hide-mobile">
                                            <div class="cell-email">${item.email}</div>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.role == 'Administrador'}">
                                                    <span class="status status-progress">
                                                        <span class="dot"></span> Administrador
                                                    </span>
                                                </c:when>
                                                <c:when test="${item.role == 'Solicitante'}">
                                                    <span class="status status-pending">
                                                        <span class="dot"></span> Solicitante
                                                    </span>
                                                </c:when>
                                                <c:when test="${item.role == 'Agente'}">
                                                    <span class="status status-review">
                                                        <span class="dot"></span> Agente
                                                    </span>
                                                </c:when>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <div class="row-actions">
                                                <button class="btn-outline" type="button" data-action="edit" data-id="${item.id}">
                                                    <span class="material-symbols-outlined" style="font-size: 16px;">edit</span>
                                                    Editar
                                                </button>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <p id="emptyFilterMsg" class="empty-state" style="display:none;">Ningún usuario coincide con la búsqueda.</p>
                </div>
            </div>
        </main>

        <!-- Modal para Editar Usuario -->
        <div id="editModal" class="modal-overlay" hidden>
            <div class="modal-card" style="max-width: 420px;">
                <h3>Editar Usuario</h3>
                <p>Modifica los datos del usuario seleccionado.</p>

                <form id="editUserForm" action="${pageContext.request.contextPath}/AdminServlet" method="POST">
                    <input type="hidden" name="action" value="updateUser">
                    <input type="hidden" id="editUserId" name="id">

                    <div style="margin-bottom: var(--space-sm);">
                        <label for="editName" style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 4px; color: var(--color-on-surface);">Nombre</label>
                        <input type="text" id="editName" name="name" required style="width: 100%; padding: var(--space-xs) var(--space-sm); border-radius: var(--radius-lg); border: 1px solid var(--color-border); font-size: 14px;">
                    </div>

                    <div style="margin-bottom: var(--space-sm);">
                        <label for="editEmail" style="display: block; font-size: 14px; font-weight: 500; margin-bottom: 4px; color: var(--color-on-surface);">Correo Electrónico</label>
                        <input type="email" id="editEmail" name="email" required style="width: 100%; padding: var(--space-xs) var(--space-sm); border-radius: var(--radius-lg); border: 1px solid var(--color-border); font-size: 14px;">
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
                var oModal = document.getElementById('confirmModal');
                var oModalText = document.getElementById('confirmModalText');

                var editModal = document.getElementById('editModal');
                var editCancelBtn = document.getElementById('editCancelBtn');
                var editUserId = document.getElementById('editUserId');
                var editName = document.getElementById('editName');
                var editEmail = document.getElementById('editEmail');

                var currentRole = 'all';
                var currentTerm = '';
                var pendingDeleteId = null;

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
                        oRow.style.display = isVisible ? '' : 'none';
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

                function openDeleteModal(id, name) {
                    pendingDeleteId = id;
                    oModalText.textContent = 'Vas a eliminar a "' + name + '". Esta acción no se puede deshacer.';
                    oModal.hidden = false;
                }

                function closeDeleteModal() {
                    pendingDeleteId = null;
                    oModal.hidden = true;
                }

                if (oTableBody) {
                    oTableBody.addEventListener('click', function (e) {
                        var oEditBtn = e.target.closest('[data-action="edit"]');
                        if (oEditBtn) {
                            const row = oEditBtn.closest("tr");
                            const id = oEditBtn.getAttribute("data-id") || oEditBtn.dataset.id;

                            // Extraer los datos de los atributos de la fila
                            const name = row.getAttribute("data-name");
                            const email = row.getAttribute("data-email");
                            const role = row.getAttribute("data-role");

                            // Rellenar campos del modal de edición
                            if (editUserId)
                                editUserId.value = id;
                            if (editName)
                                editName.value = name;
                            if (editEmail)
                                editEmail.value = email;

                            // Mostrar el modal de edición
                            if (editModal)
                                editModal.removeAttribute("hidden");
                            return;
                        }
                    });
                }

                // Eventos para cerrar el modal de edición
                if (editCancelBtn && editModal) {
                    editCancelBtn.addEventListener('click', function () {
                        editModal.setAttribute("hidden", "true");
                    });
                }

                if (editModal) {
                    editModal.addEventListener('click', function (e) {
                        if (e.target === editModal) {
                            editModal.setAttribute("hidden", "true");
                        }
                    });
                }
                document.addEventListener('keydown', function (e) {
                    if (e.key === 'Escape' && !oModal.hidden)
                        closeDeleteModal();
                });

            })();

            function setupRipple() {
                if (reduced)
                    return;
                var buttons = document.querySelectorAll('.btn-primary, .btn-reassign');
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

            /* ---------- 4. Selección de fila (ignora los botones de acción) ---------- */
            function setupRowSelection() {
                var rows = document.querySelectorAll('tbody tr');
                Array.prototype.forEach.call(rows, function (row) {
                    row.addEventListener('click', function (e) {
                        if (e.target.closest('.row-actions'))
                            return;
                        Array.prototype.forEach.call(rows, function (r) {
                            r.classList.remove('selected');
                        });
                        row.classList.add('selected');
                    });
                });
            }
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
                if (url.get('exito') === 'trueupdate') {
                    Swal.fire({
                        title: '¿Realizado con éxito?',
                        text: 'Yuli te amo porfa perdoname',
                        icon: 'success',
                        timer: 2000,
                        timerProgressBar: true,
                        showConfirmButton: false,
                    });

                }
            });
        </script>
        <%}%>
    </body>
</html>
