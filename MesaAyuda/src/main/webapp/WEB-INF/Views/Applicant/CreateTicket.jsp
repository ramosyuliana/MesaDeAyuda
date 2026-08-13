<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="light" lang="en">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Submit a Ticket | Luminous Ether Help Desk</title>
        <link href="https://fonts.googleapis.com" rel="preconnect"/>
        <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect"/>
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600&family=Manrope:wght@600;700&display=swap" rel="stylesheet"/>
        <link href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&display=swap" rel="stylesheet"/>
        <style>
            :root {
                --surface-container-lowest: #f6f8fb;
                --surface-container-low: #e9eef5;
                --surface-container: #e2e8f2;
                --text-title: #1e293b;
                --text-label: #334155;
                --text-secondary: #51607a;
                --text-tertiary: #6b7a97;
                --text-muted: #94a3b8;
                --bg-base: #eef2f7;
                --border-color: #d7dfec;
                --success: #059669;
                --error: #dc2626;
                --warning: #d97706;
            }

            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }

            body {
                font-family: 'Inter', sans-serif;
                background-color: var(--bg-base);
                background-image: linear-gradient(135deg, rgba(224,231,242,.9), rgba(219,230,250,.7), rgba(214,238,242,.8));
                background-attachment: fixed;
                min-height: 100vh;
                color: var(--text-secondary);
                overflow-x: hidden;
                -webkit-font-smoothing: antialiased;
                opacity: 0;
                transform: translateY(20px);
                transition: opacity 0.4s ease, transform 0.4s ease;
            }

            .material-symbols-outlined {
                font-variation-settings: 'FILL' 0, 'wght' 400, 'GRAD' 0, 'opsz' 24;
                display: inline-block;
                vertical-align: middle;
            }

            textarea::-webkit-scrollbar {
                width: 8px;
            }
            textarea::-webkit-scrollbar-track {
                background: transparent;
            }
            textarea::-webkit-scrollbar-thumb {
                background: rgba(107, 122, 151, 0.3);
                border-radius: 4px;
            }
            textarea::-webkit-scrollbar-thumb:hover {
                background: rgba(107, 122, 151, 0.5);
            }

            .page-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh;
                padding: 48px 24px;
                max-width: 1280px;
                margin: 0 auto;
                position: relative;
                z-index: 10;
            }

            .back-link-wrapper {
                width: 100%;
                max-width: 42rem;
                margin-bottom: 24px;
            }

            .back-link {
                display: inline-flex;
                align-items: center;
                gap: 4px;
                color: var(--text-secondary);
                text-decoration: none;
                font-size: 14px;
                font-weight: 500;
                transition: color 0.2s ease;
            }

            .back-link:hover {
                color: #3b82f6;
            }

            .back-link span {
                transition: transform 0.2s ease;
            }

            .back-link:hover span {
                transform: translateX(-4px);
            }

            .glass-card {
                width: 100%;
                max-width: 42rem;
                background: rgba(255, 255, 255, 0.6);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border: 1px solid rgba(148, 163, 184, 0.25);
                border-radius: 20px;
                box-shadow: 0 10px 30px -5px rgba(30, 41, 59, 0.06);
                padding: 24px;
                position: relative;
                overflow: hidden;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            @media (min-width: 768px) {
                .glass-card {
                    padding: 48px;
                }
            }

            .glass-card:hover {
                transform: translateY(-4px);
                box-shadow: 0 20px 40px -10px rgba(30, 41, 59, 0.12);
            }

            .card-glow {
                position: absolute;
                top: -96px;
                right: -96px;
                width: 192px;
                height: 192px;
                background: rgba(59, 130, 246, 0.1);
                border-radius: 9999px;
                filter: blur(48px);
                pointer-events: none;
            }

            .form-title {
                font-family: 'Manrope', sans-serif;
                font-size: 32px;
                line-height: 1.3;
                font-weight: 600;
                color: var(--text-title);
                margin: 0 0 8px 0;
                letter-spacing: -0.01em;
            }

            .form-desc {
                font-size: 16px;
                line-height: 1.6;
                color: var(--text-secondary);
                margin: 0;
            }

            .form-group {
                margin-bottom: 24px;
            }

            .form-label {
                display: block;
                font-size: 14px;
                font-weight: 500;
                color: var(--text-label);
                margin-bottom: 4px;
            }

            .form-input, .form-select, .form-textarea {
                width: 100%;
                background: rgba(255, 255, 255, 0.5);
                border: 1px solid var(--border-color);
                border-radius: 8px;
                padding: 12px;
                font-family: 'Inter', sans-serif;
                font-size: 16px;
                line-height: 1.5;
                color: var(--text-title);
                transition: all 0.2s ease;
            }

            .form-input::placeholder, .form-textarea::placeholder {
                color: var(--text-muted);
            }

            .form-input:hover, .form-select:hover, .form-textarea:hover {
                border-color: rgba(59, 130, 246, 0.5);
            }

            .form-input:focus, .form-select:focus, .form-textarea:focus {
                outline: none;
                background: rgba(255, 255, 255, 0.9);
                border-color: #3b82f6;
                box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.2);
            }

            .select-wrapper {
                position: relative;
            }

            .form-select {
                appearance: none;
                padding-right: 40px;
            }

            .select-icon {
                position: absolute;
                right: 12px;
                top: 50%;
                transform: translateY(-50%);
                pointer-events: none;
                color: var(--text-secondary);
            }

            .form-textarea {
                resize: vertical;
                min-height: 120px;
            }

            .form-actions {
                display: flex;
                align-items: center;
                justify-content: flex-end;
                gap: 12px;
                padding-top: 16px;
                margin-top: 24px;
                border-top: 1px solid rgba(215, 223, 236, 0.5);
            }

            .btn-cancel {
                padding: 10px 24px;
                border-radius: 8px;
                font-size: 14px;
                font-weight: 600;
                color: #3b82f6;
                background: transparent;
                border: 1px solid transparent;
                cursor: pointer;
                transition: all 0.2s ease;
            }

            .btn-cancel:hover {
                background: var(--surface-container-low);
                border-color: var(--border-color);
            }

            .btn-submit {
                padding: 10px 24px;
                border-radius: 8px;
                font-size: 14px;
                font-weight: 600;
                color: #ffffff;
                background: linear-gradient(135deg, #3b82f6, #2563eb);
                border: none;
                cursor: pointer;
                box-shadow: 0 4px 14px 0 rgba(59, 130, 246, 0.3);
                display: flex;
                align-items: center;
                gap: 6px;
                transition: all 0.3s ease;
            }

            .btn-submit:hover {
                background: linear-gradient(135deg, #2563eb, #1d4ed8);
                box-shadow: 0 6px 20px rgba(59, 130, 246, 0.4);
                transform: translateY(-1px);
            }

            .btn-submit:active {
                transform: translateY(1px);
            }
        </style>
    </head>
    <body>
    <c:if test="${not empty errorMsg}">
        <div style="background: #fee2e2; color: #991b1b; padding: 12px; border-radius: 8px; margin-bottom: 16px;">
            <strong>Error:</strong> ${errorMsg}
        </div>
    </c:if>
    <main class="page-container">
        <div class="back-link-wrapper">
            <a class="back-link" href="#">
                <span class="material-symbols-outlined" style="font-size: 18px;">arrow_back</span>
                Back to Dashboard
            </a>
        </div>

        <div class="glass-card">
            <div class="card-glow"></div>

            <div style="margin-bottom: 32px;">
                <h1 class="form-title">Create a New Ticket</h1>
                <p class="form-desc">Describe your issue and our team will get back to you shortly.</p>
            </div>

            <form style="display: flex; flex-direction: column; gap: 24px;"    action="${pageContext.request.contextPath}/TicketServlet?action=register" method="POST">
                <div class="form-group" style="margin-bottom: 0;">
                    <label class="form-label" for="subject">Ticket Subject</label>
                    <div>
                        <input class="form-input" id="subject" name="Title" placeholder="Brief summary of the issue" type="text"/>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 0;">
                    <label class="form-label" for="category">Category</label>
                    <div class="select-wrapper">
                        <select class="form-select" id="category" name="Category">
                            <option disabled="" selected="" value="">Select a category...</option>
                            <c:forEach var="c"  items="${categories}">
                                <option value="${c.id}">${c.name}</option>
                            </c:forEach>
                        </select>
                        <div class="select-icon">
                            <span class="material-symbols-outlined">expand_more</span>
                        </div>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 0;">
                    <label class="form-label" for="description">Problem Description</label>
                    <div>
                        <textarea class="form-textarea" id="description" name="Description" placeholder="Please provide detailed information about the issue..." rows="5"></textarea>
                    </div>
                </div>

                <div class="form-actions">
                    <button class="btn-cancel" type="button">
                        Cancel
                    </button>
                    <button class="btn-submit" type="submit">
                        <span class="material-symbols-outlined" style="font-size: 18px;">send</span>
                        Submit Ticket
                    </button>
                </div>
            </form>
        </div>
    </main>

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            document.body.style.opacity = "1";
            document.body.style.transform = "translateY(0)";
        });
    </script>
</body>
</html>