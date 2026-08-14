<%-- 
    Document   : EditTicket
    Created on : 13/08/2026, 1:59:35 p. m.
    Author     : Admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Editar Ticket | Mesa CIMM</title>
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
                --card-bg: rgba(255,255,255,.6);
                --card-border: rgba(148,163,184,.25);
                --border-color:#d7dfec;
                --primary:#3b82f6;
                --gradient-button: linear-gradient(135deg,#3b82f6,#2563eb);
                --gradient-button-hover: linear-gradient(135deg,#2563eb,#1d4ed8);
                --error:#dc2626;
                --radius-lg:8px;
                --radius-xl:20px;
            }
            * {
                box-sizing: border-box;
                margin:0;
                padding:0;
            }
            body {
                font-family:'Inter', sans-serif;
                background:var(--bg-page);
                background-image:var(--bg-gradient);
                background-attachment: fixed;
                min-height:100vh;
                color:var(--on-surface-variant);
            }
            .material-symbols-outlined {
                vertical-align: middle;
            }
            .page-container {
                display:flex;
                flex-direction:column;
                align-items:center;
                padding:48px 24px;
                max-width:1280px;
                margin:0 auto;
            }
            .back-link-wrapper {
                width:100%;
                max-width:42rem;
                margin-bottom:24px;
            }
            .back-link {
                display:inline-flex;
                align-items:center;
                gap:4px;
                color:var(--on-surface-variant);
                font-size:14px;
                font-weight:500;
            }
            .glass-card {
                width:100%;
                max-width:42rem;
                background: rgba(255,255,255,.6);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border:1px solid var(--card-border);
                border-radius:var(--radius-xl);
                box-shadow:0 10px 30px -5px rgba(30,41,59,.06);
                padding:48px;
            }
            .form-title {
                font-family:'Manrope', sans-serif;
                font-size:28px;
                font-weight:600;
                color:var(--on-surface);
                margin-bottom:8px;
            }
            .form-desc {
                font-size:15px;
                margin-bottom:24px;
            }
            .form-group {
                margin-bottom:20px;
            }
            .form-label {
                display:block;
                font-size:14px;
                font-weight:500;
                color:var(--on-surface);
                margin-bottom:4px;
            }
            .form-input, .form-select, .form-textarea {
                width:100%;
                background: rgba(255,255,255,.5);
                border:1px solid var(--border-color);
                border-radius:var(--radius-lg);
                padding:12px;
                font-family:'Inter', sans-serif;
                font-size:15px;
                color:var(--on-surface);
            }
            .form-input:focus, .form-select:focus, .form-textarea:focus {
                outline:none;
                border-color:var(--primary);
                background:#fff;
            }
            .form-textarea {
                resize:vertical;
                min-height:120px;
            }
            .form-actions {
                display:flex;
                justify-content:flex-end;
                gap:12px;
                padding-top:16px;
                margin-top:8px;
                border-top:1px solid var(--border-color);
            }
            .btn-cancel {
                padding:10px 22px;
                border-radius:var(--radius-lg);
                font-size:14px;
                font-weight:600;
                color:var(--primary);
                background:transparent;
                border:1px solid transparent;
            }
            .btn-submit {
                padding:10px 22px;
                border-radius:var(--radius-lg);
                font-size:14px;
                font-weight:600;
                color:#fff;
                background: var(--gradient-button);
                border:none;
                display:flex;
                align-items:center;
                gap:6px;
            }
            .btn-submit:hover {
                background: var(--gradient-button-hover);
            }
            .alert-error {
                background:#fee2e2;
                color:#991b1b;
                padding:12px;
                border-radius:var(--radius-lg);
                margin-bottom:16px;
                max-width:42rem;
                width:100%;
            }
        </style>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="${pageContext.request.contextPath}/js/sweetAlert.js"></script>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />
        <main class="page-container">


            <div class="glass-card">
                <h1 class="form-title">Editar Ticket ${ticket.id}</h1>
                <p class="form-desc">Actualiza la información de tu solicitud mientras siga sin ser atendida.</p>

                <form action="${pageContext.request.contextPath}/TicketServlet?action=editTicket" method="post" style="display:flex; flex-direction:column; gap:4px;">
                    <div class="form-group">
                        <input type="hidden" name="idTicket" value="${ticket.id}"/>
                        <label class="form-label" for="title">Título</label>
                        <input class="form-input" id="title" name="Title" type="text" value="${ticket.title}"/>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="category">Categoría</label>
                        <select class="form-select" id="category" name="Category">
                            <c:forEach var="c" items="${categories}">
                                <option value="${c.id}" ${c.id == ticket.idCategory ? 'selected' : ''}>${c.name}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="form-group">
                        <label class="form-label" for="description">Descripción</label>
                        <textarea class="form-textarea" id="description" name="Description" maxlength="1000">"${ticket.description}</textarea>
                    </div>

                    <div class="form-actions">
                        <a class="btn-cancel" href="${pageContext.request.contextPath}/TicketServlet?action=view&id=${ticket.id}">Cancelar</a>
                        <button class="btn-submit" type="submit">
                            <span class="material-symbols-outlined" style="font-size:18px;">save</span> Guardar cambios
                        </button>
                    </div>
                </form>
            </div>
        </main>
        <%
            String error = (String) request.getAttribute("error");
            String success = (String) request.getAttribute("success");
            if (error != null && !error.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.error("¡Error!", "<%= error%>");
            });
        </script>
        <%
        } else if (success != null && !success.isEmpty()) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                sweetAlert.success("Éxito", "<%= success%>");
            });
        </script>
        <%
            }
        %>
    </body>
</html>

