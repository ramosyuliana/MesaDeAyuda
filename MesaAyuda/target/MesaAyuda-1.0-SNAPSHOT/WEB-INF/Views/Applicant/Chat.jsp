<%-- 
    Document   : Chat
    Created on : 27/08/2026, 9:16:38 a. m.
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="utf-8"/>
        <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
        <title>Chat - Ticket #${idTicket} | Mesa CIMM</title>
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
                --border-color:#d7dfec;
                --primary:#3b82f6;
                --secondary:#6366f1;
                --success:#059669;
                --error:#dc2626;
                --warning:#d97706;
                --gradient-button: linear-gradient(135deg,#3b82f6,#2563eb);
                --gradient-button-hover: linear-gradient(135deg,#2563eb,#1d4ed8);
                --radius-lg:8px;
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

            /* ---------- Mismo esqueleto que el resto de las vistas ---------- */
            .page-container {
                max-width:900px;
                margin:0 auto;
                padding:40px 24px;
                display:flex;
                flex-direction:column;
                gap:16px;
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
                background: var(--card-bg);
                backdrop-filter: blur(10px);
                -webkit-backdrop-filter: blur(10px);
                border:1px solid var(--card-border);
                border-radius:var(--radius-xl);
                box-shadow:0 10px 30px -5px rgba(30,41,59,.06);
                padding:32px;
            }

            .head-row {
                display:flex;
                justify-content:space-between;
                align-items:flex-start;
                gap:16px;
                flex-wrap:wrap;
                margin-bottom:20px;
            }
            .head-row h1 {
                font-family:'Manrope', sans-serif;
                font-size:20px;
                font-weight:600;
                color:var(--on-surface);
                margin-top:8px;
            }

            .tag-badge {
                display:inline-flex;
                align-items:center;
                padding:3px 10px;
                border-radius:var(--radius-full);
                font-size:11px;
                font-weight:600;
            }
            .tag-blue {
                background: rgba(59,130,246,.12);
                color:var(--primary);
            }
            .tag-success {
                background: rgba(5,150,105,.12);
                color:var(--success);
            }
            .tag-neutral {
                background: rgba(107,122,151,.12);
                color:var(--on-surface-muted);
            }
            .status-dot {
                width:6px; height:6px; border-radius:50%;
                background: currentColor;
                display:inline-block;
                margin-right:5px;
            }

            /* ---------- Chat ---------- */
            #chatMessages {
                display:flex;
                flex-direction:column;
                gap:12px;
                max-height:420px;
                overflow-y:auto;
                padding-bottom:8px;
                margin-bottom:16px;
            }

            .msg-row { display:flex; gap:10px; max-width:80%; }
            .msg-row.own { align-self:flex-end; flex-direction:row-reverse; }

            .msg-avatar {
                width:32px; height:32px; border-radius:50%;
                background: var(--gradient-button);
                color:#fff; flex-shrink:0;
                display:flex; align-items:center; justify-content:center;
                font-size:13px; font-weight:600;
            }
            .msg-bubble {
                background: rgba(255,255,255,.5);
                border:1px solid var(--hairline);
                border-radius: var(--radius-lg);
                padding:10px 14px;
            }
            .msg-row.own .msg-bubble {
                background: var(--gradient-button);
                color:#fff;
                border:none;
            }
            .msg-author {
                font-size:11px;
                font-weight:600;
                margin-bottom:2px;
                color: var(--on-surface);
            }
            .msg-row.own .msg-author { color: rgba(255,255,255,.85); }
            .msg-text { font-size:14px; line-height:1.4; color: var(--on-surface-variant); }
            .msg-row.own .msg-text { color:#fff; }
            .msg-date {
                font-size:10px;
                margin-top:4px;
                color: var(--on-surface-faint);
            }
            .msg-row.own .msg-date { color: rgba(255,255,255,.7); text-align:right; }

            .empty-chat {
                text-align:center;
                color: var(--on-surface-faint);
                font-size:13px;
                padding:32px 0;
            }

            .chat-input-bar {
                display:flex;
                gap:8px;
                padding-top:16px;
                border-top:1px solid var(--hairline);
            }
            .chat-input-bar input {
                flex:1;
                padding:11px 16px;
                border-radius: var(--radius-full);
                border:1px solid var(--border-color);
                background: rgba(255,255,255,.6);
                font-size:14px;
                outline:none;
            }
            .chat-input-bar input:focus {
                border-color: var(--primary);
                background:#fff;
            }
            .chat-input-bar button {
                width:44px; height:44px;
                border-radius:50%;
                background: var(--gradient-button);
                color:#fff;
                border:none;
                display:flex; align-items:center; justify-content:center;
                flex-shrink:0;
                transition: background .15s ease;
            }
            .chat-input-bar button:hover {
                background: var(--gradient-button-hover);
            }
        </style>
    </head>
    <body>
        <jsp:include page="/WEB-INF/Views/TopNavBar.jsp" />
        <main class="page-container">
            <a class="back-link" href="${pageContext.request.contextPath}/TicketServlet?action=view&id=${idTicket}">
                <span class="material-symbols-outlined" style="font-size:18px;">arrow_back</span> Volver al ticket
            </a>

            <div class="glass-card">
                <div class="head-row">
                    <div>
                        <span class="tag-badge tag-blue">TCK-${idTicket}</span>
                        <h1>Chat en vivo</h1>
                    </div>
                    <span class="tag-badge tag-neutral" id="statusBadge">
                        <span class="status-dot"></span><span id="statusText">Conectando...</span>
                    </span>
                </div>

                <div id="chatMessages">
                    <c:choose>
                        <c:when test="${empty chatHistory}">
                            <p class="empty-chat">Aún no hay mensajes. Escribe el primero.</p>
                        </c:when>
                        <c:otherwise>
                            <c:forEach var="m" items="${chatHistory}">
                                <div class="msg-row ${m.idAuthor == sessionScope.user.id ? 'own' : ''}">
                                    <div class="msg-avatar">${fn:substring(m.authorName, 0, 1)}</div>
                                    <div class="msg-bubble">
                                        <p class="msg-author">${m.authorName}</p>
                                        <p class="msg-text">${m.text}</p>
                                        <p class="msg-date">${m.date}</p>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                </div>

                <div class="chat-input-bar">
                    <input type="text" id="chatInput" placeholder="Escribe un mensaje..." autocomplete="off"/>
                    <button id="chatSendBtn" type="button" title="Enviar">
                        <span class="material-symbols-outlined">send</span>
                    </button>
                </div>
            </div>
        </main>

        <script>
            (function () {
                const idTicket = ${idTicket};
                const idUser = ${sessionScope.user.id};

                const chatBox = document.getElementById("chatMessages");
                const input = document.getElementById("chatInput");
                const sendBtn = document.getElementById("chatSendBtn");
                const statusBadge = document.getElementById("statusBadge");
                const statusText = document.getElementById("statusText");

                function setStatus(state) {
                    statusBadge.classList.remove("tag-neutral", "tag-success", "tag-blue");
                    if (state === "online") {
                        statusBadge.classList.add("tag-success");
                        statusText.textContent = "En línea";
                    } else if (state === "connecting") {
                        statusBadge.classList.add("tag-blue");
                        statusText.textContent = "Conectando...";
                    } else {
                        statusBadge.classList.add("tag-neutral");
                        statusText.textContent = state === "error" ? "Error de conexión" : "Desconectado";
                    }
                }

                const protocol = window.location.protocol === "https:" ? "wss:" : "ws:";
                const socket = new WebSocket(protocol + "//" + window.location.host + "${pageContext.request.contextPath}/chat/" + idTicket);

                socket.onopen = function () { setStatus("online"); };
                socket.onclose = function () { setStatus("offline"); };
                socket.onerror = function (err) {
                    console.error("Error WebSocket:", err);
                    setStatus("error");
                };

                socket.onmessage = function (event) {
                    const msg = JSON.parse(event.data);
                    appendMessage(msg.idAuthor, msg.authorName, msg.date, msg.text);
                };

                function appendMessage(idAuthor, author, date, text) {
                    const emptyMsg = chatBox.querySelector(".empty-chat");
                    if (emptyMsg) emptyMsg.remove();

                    const isOwn = idAuthor === idUser;
                    const row = document.createElement("div");
                    row.className = "msg-row" + (isOwn ? " own" : "");

                    const avatar = document.createElement("div");
                    avatar.className = "msg-avatar";
                    avatar.textContent = author.charAt(0);

                    const bubble = document.createElement("div");
                    bubble.className = "msg-bubble";

                    const pAuthor = document.createElement("p");
                    pAuthor.className = "msg-author";
                    pAuthor.textContent = author;

                    const pText = document.createElement("p");
                    pText.className = "msg-text";
                    pText.textContent = text;

                    const pDate = document.createElement("p");
                    pDate.className = "msg-date";
                    pDate.textContent = date;

                    bubble.appendChild(pAuthor);
                    bubble.appendChild(pText);
                    bubble.appendChild(pDate);
                    row.appendChild(avatar);
                    row.appendChild(bubble);

                    chatBox.appendChild(row);
                    chatBox.scrollTop = chatBox.scrollHeight;
                }

                function sendMessage() {
                    const text = input.value.trim();
                    if (text === "") return;
                    socket.send(JSON.stringify({ idAuthor: idUser, text: text }));
                    input.value = "";
                }

                sendBtn.addEventListener("click", sendMessage);
                input.addEventListener("keypress", function (e) {
                    if (e.key === "Enter") sendMessage();
                });

                chatBox.scrollTop = chatBox.scrollHeight;
                input.focus();
            })();
        </script>
    </body>
</html>
