<%@page contentType="text/html" pageEncoding="UTF-8"%>


        * { box-sizing: border-box; }
        html, body { height: 100%; }
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

        a { text-decoration: none; color: inherit; }
        button { font-family: inherit; cursor: pointer; border: none; background: none; color: inherit; }
        table { width: 100%; border-collapse: collapse; text-align: left; }

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

        .glass-panel {
            background-color: var(--card-bg);
            backdrop-filter: var(--card-blur);
            -webkit-backdrop-filter: var(--card-blur);
            border: 1px solid var(--card-border);
            box-shadow: var(--shadow-rest);
        }

        .is-liftable {
            transition: transform var(--t-slow), box-shadow var(--t-slow), background-color var(--t-slow);
        }
        .is-liftable:hover {
            transform: translateY(-3px);
            box-shadow: var(--shadow-hover);
            background-color: var(--card-bg-strong);
        }

        .reveal { opacity: 0; transform: translateY(12px); }
        .reveal.is-in {
            opacity: 1;
            transform: none;
            transition: opacity .5s cubic-bezier(.4,0,.2,1), transform .5s cubic-bezier(.4,0,.2,1);
        }

        /* Header */
        header.topbar {
            position: fixed;
            top: 0; left: 0; right: 0;
            z-index: 50;
            border-radius: 0;
            border-left: none; border-right: none; border-top: none;
        }
        header.topbar::after {
            content: '';
            position: absolute; left: 0; right: 0; bottom: -1px;
            height: 2px;
            background: var(--gradient-accent);
            opacity: .75;
        }
        .topbar-inner {
            display: flex; justify-content: space-between; align-items: center;
            width: 100%; height: 64px;
            padding: 0 var(--sp-gutter);
            max-width: var(--container-max);
            margin: 0 auto;
        }
        .topbar-left { display: flex; align-items: center; gap: var(--sp-md); }
        .brand { display: flex; align-items: center; gap: 8px; }
        .brand .material-symbols-outlined { color: var(--primary-container); font-size: 30px; }
        .brand span.name {
            font-family: 'Manrope', sans-serif; font-weight: 700; font-size: 20px;
            background: var(--gradient-accent);
            -webkit-background-clip: text; background-clip: text; color: transparent;
        }

        .topbar-nav { display: none; gap: var(--sp-md); }
        @media (min-width: 768px) { .topbar-nav { display: flex; } }
        .topbar-nav a {
            color: var(--on-surface-variant); font-weight: 500; font-size: 14px;
            position: relative; padding-bottom: 4px; transition: color var(--t-fast);
        }
        .topbar-nav a.active { color: var(--primary); font-weight: 700; }

        .topbar-right { display: flex; align-items: center; gap: var(--sp-md); }
        .avatar {
            height: 32px; width: 32px; border-radius: 50%; overflow: hidden;
            border: 1px solid var(--card-border); background: var(--surface-container-high);
        }
        .avatar img { width: 100%; height: 100%; object-fit: cover; display: block; }

        /* App Layout */
        .app-body { display: flex; flex: 1; overflow: hidden; height: 100vh; }

        aside.sidebar {
            display: none; flex-direction: column; height: 100%; width: 256px;
            flex-shrink: 0; z-index: 40; position: relative;
            border-radius: 0; border-top: none; border-bottom: none; border-left: none;
        }
        @media (min-width: 768px) { aside.sidebar { display: flex; } }

        .sidebar-header {
            padding: var(--sp-md); display: flex; flex-direction: column; gap: 2px;
            border-bottom: 1px solid var(--hairline);
        }
        .sidebar-header h2 {
            margin: 0; font-family: 'Manrope', sans-serif; font-size: 24px; font-weight: 600;
            background: var(--gradient-accent); -webkit-background-clip: text; background-clip: text; color: transparent;
        }
        .sidebar-header p { margin: 0; font-size: 12px; color: var(--on-surface-muted); }

        .sidebar-nav {
            flex: 1; overflow-y: auto; padding: var(--sp-md) var(--sp-sm);
            display: flex; flex-direction: column; gap: 8px;
        }
        .sidebar-nav a {
            color: var(--on-surface-labels); border-radius: var(--radius-lg);
            display: flex; align-items: center; gap: 12px; padding: 12px; font-size: 15px;
            position: relative; transition: background-color var(--t-base), color var(--t-base);
        }
        .sidebar-nav a .material-symbols-outlined { color: var(--on-surface-muted); }
        .sidebar-nav a:hover { background: rgba(59,130,246,.07); color: var(--link); }
        .sidebar-nav a.active {
            background: rgba(59,130,246,.12); color: var(--primary); font-weight: 700;
        }
        .sidebar-nav a.active::before {
            content: ''; position: absolute; left: -12px; top: 10px; bottom: 10px;
            width: 3px; border-radius: 3px; background: var(--gradient-accent);
        }

        /* Main Content */
        main.content { flex: 1; overflow-y: auto; padding: var(--sp-md) var(--sp-gutter); position: relative; }
        .content-inner {
            max-width: var(--container-max); margin: 0 auto;
            display: flex; flex-direction: column; gap: var(--sp-md); padding-bottom: var(--sp-xl);
        }

        .page-head {
            display: flex; flex-direction: column; gap: var(--sp-md);
            justify-content: space-between; align-items: flex-start;
        }
        @media (min-width: 768px) { .page-head { flex-direction: row; align-items: flex-end; } }
        .page-head h1 {
            margin: 0 0 8px; font-family: 'Manrope', sans-serif; font-weight: 700;
            font-size: 32px; letter-spacing: -0.01em; color: var(--on-surface);
        }
        .page-head p { margin: 0; font-size: 16px; color: var(--on-surface-variant); }

        .stat-row { display: flex; flex-wrap: wrap; gap: var(--sp-sm); }
        .stat-card { border-radius: var(--radius-xl); padding: 16px; display: flex; align-items: center; gap: 12px; min-width: 170px; }
        .stat-icon { padding: 8px; border-radius: var(--radius-lg); display: flex; }
        .stat-icon.blue { background: rgba(59,130,246,.1); color: var(--primary-container); }
        .stat-icon.violet { background: rgba(99,102,241,.1); color: var(--secondary); }
        .stat-label { margin: 0; font-size: 12px; color: var(--on-surface-muted); }
        .stat-value { margin: 0; font-size: 22px; font-weight: 700; color: var(--on-surface); }

        /* Bento Grid for Agent Work */
        .bento-grid {
            display: grid; grid-template-columns: 1fr; gap: var(--sp-md);
        }
        @media (min-width: 1024px) { .bento-grid { grid-template-columns: 1.8fr 1.2fr; } }

        .articles-panel {
            border-radius: var(--radius-xl); overflow: hidden; display: flex; flex-direction: column; height: 520px; position: relative;
        }
        .articles-panel::before {
            content: ''; position: absolute; top: 0; left: 0; right: 0; height: 3px; background: var(--gradient-accent); z-index: 2;
        }
        .panel-head {
            padding: var(--sp-md); border-bottom: 1px solid var(--hairline);
            display: flex; justify-content: space-between; align-items: center; background: rgba(255,255,255,.25);
        }
        .panel-head h3 { margin: 0; font-family: 'Manrope', sans-serif; font-size: 20px; font-weight: 600; color: var(--on-surface); }

        .table-scroll { flex: 1; overflow: auto; }
        thead {
            background: rgba(233,238,245,.75); position: sticky; top: 0;
            backdrop-filter: blur(10px); -webkit-backdrop-filter: blur(10px); z-index: 1;
        }
        th { padding: 14px 16px; font-size: 11px; font-weight: 600; color: var(--on-surface-labels); letter-spacing: .03em; }
        td { padding: 14px 16px; border-top: 1px solid var(--hairline); font-size: 15px; }
        tbody tr { transition: background-color var(--t-fast); cursor: pointer; }
        tbody tr:hover { background: rgba(59,130,246,.06); }
        tbody tr.selected { background: rgba(59,130,246,.1); }

        .code-cell { color: var(--on-surface-muted); font-family: monospace; font-size: 13px; font-weight: 600; }
        .article-title { color: var(--on-surface); font-weight: 500; margin: 0; font-size: 14px; }
        .article-updated { font-size: 11px; color: var(--on-surface-faint); margin: 2px 0 0; }

        .tag-badge {
            display: inline-flex; align-items: center; padding: 2px 10px;
            border-radius: var(--radius-full); font-size: 11px; font-weight: 600;
        }
        .tag-blue { background: rgba(59,130,246,.12); color: var(--primary); }
        .tag-violet { background: rgba(99,102,241,.12); color: var(--secondary); }
        .tag-warning { background: rgba(217,119,6,0.12); color: var(--warning); }
        .tag-success { background: rgba(5,150,105,0.12); color: var(--success); }

        /* Agent Workflow Detail Panel (State & Actions) */
        .detail-col { display: flex; flex-direction: column; gap: var(--sp-md); height: 520px; }
        .detail-card {
            border-radius: var(--radius-xl); padding: var(--sp-md);
            flex-shrink: 0; background-color: var(--card-bg-strong);
            display: flex; flex-direction: column; height: 100%;
        }
        .detail-top { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 12px; }
        .detail-eyebrow { font-family: monospace; font-size: 11px; color: var(--link); letter-spacing: .04em; }
        .detail-title { margin: 2px 0 0; font-family: 'Manrope', sans-serif; font-size: 20px; font-weight: 600; color: var(--on-surface); }
        
        .detail-meta { display: flex; flex-direction: column; gap: 8px; margin-bottom: 16px; }
        .detail-meta-row {
            display: flex; justify-content: space-between; align-items: center; font-size: 13px;
            border-bottom: 1px solid var(--hairline); padding-bottom: 6px;
        }
        .detail-meta-row span:first-child { color: var(--on-surface-variant); }
        .detail-meta-row span:last-child { color: var(--on-surface); font-weight: 500; }

        .workflow-box {
            background: rgba(255, 255, 255, 0.5);
            border: 1px solid var(--border-soft);
            border-radius: var(--radius-lg);
            padding: 12px;
            margin-bottom: 16px;
        }
        .workflow-box p { margin: 0 0 8px; font-size: 12px; font-weight: 600; color: var(--on-surface-muted); text-transform: uppercase; }

        .state-actions-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 8px;
        }
        .action-state-btn {
            padding: 10px;
            border-radius: var(--radius-lg);
            font-size: 13px;
            font-weight: 500;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 6px;
            border: 1px solid var(--input-border);
            background: var(--input-bg);
            transition: all var(--t-fast);
        }
        .action-state-btn:hover {
            border-color: var(--input-focus-border);
            background: var(--input-focus-bg);
            transform: translateY(-1px);
        }
        .action-state-btn.primary-action {
            background: var(--gradient-button);
            color: white;
            border: none;
            grid-column: span 2;
            box-shadow: var(--shadow-rest);
        }
        .action-state-btn.primary-action:hover {
            background: var(--gradient-button-hover);
        }

        .comment-section {
            margin-top: auto;
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .comment-input-wrapper {
            position: relative;
            display: flex;
        }
        .comment-input-wrapper input {
            width: 100%;
            padding: 10px 40px 10px 12px;
            border-radius: var(--radius-lg);
            background: var(--input-bg);
            border: 1px solid var(--input-border);
            font-size: 13px;
            outline: none;
            color: var(--on-surface);
        }
        .comment-input-wrapper button {
            position: absolute; right: 4px; top: 50%; transform: translateY(-50%);
            color: var(--primary); padding: 6px; display: flex; border-radius: 50%;
        }

        /* Scrollbars */
        ::-webkit-scrollbar { width: 8px; height: 8px; }
        ::-webkit-scrollbar-track { background: transparent; }
        ::-webkit-scrollbar-thumb {
            background: rgba(148,163,184,.35); border-radius: var(--radius-full); border: 2px solid transparent; background-clip: content-box;
        }
    </style>
</head>
<body>

    <!-- Topbar -->
    <header class="topbar glass-panel">
        <div class="topbar-inner">
            <div class="topbar-left">
                <a href="#" class="brand">
                    <span class="material-symbols-outlined">support_agent</span>
                    <span class="name">EtherHelp • Panel de Agente</span>
                </a>
                <nav class="topbar-nav">
                    <a href="#" class="active">Mis Tickets Asignados</a>
                    <a href="#">Base de Conocimiento</a>
                    <a href="#">Historial y SLA</a>
                </nav>
            </div>
            <div class="topbar-right">
                <div class="avatar" title="Agente Activo">
                    <img src="[https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80](https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=120&q=80)" alt="Avatar"/>
                </div>
            </div>
        </div>
    </header>

    <!-- App Body -->
    <div class="app-body">
        <!-- Sidebar -->
        <aside class="sidebar glass-panel">
            <div class="sidebar-header">
                <h2>Mesa CIMM</h2>
                <p>SENA - ADSO Ficha 3232460[cite: 1]</p>
            </div>
            <nav class="sidebar-nav">
                <a href="#" class="active">
                    <span class="material-symbols-outlined">assignment</span>
                    <span>Tickets Asignados</span>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">hourglass_top</span>
                    <span>En Proceso (State)</span>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">timer</span>
                    <span>Control de SLA</span>
                </a>
                <a href="#">
                    <span class="material-symbols-outlined">chat_bubble</span>
                    <span>Comentarios y Notas</span>
                </a>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="content">
            <div class="content-inner">
                
                <!-- Page Head -->
                <div class="page-head reveal is-in">
                    <div>
                        <h1>Gestión y Ciclo de Tickets</h1>
                        <p>Centro Industrial de Mantenimiento y Manufactura (CIMM)[cite: 1] — Patrón State & Strategy (SLA)</p>
                    </div>
                    <div class="stat-row">
                        <div class="stat-card glass-panel is-liftable">
                            <div class="stat-icon blue">
                                <span class="material-symbols-outlined">assignment_ind</span>
                            </div>
                            <div>
                                <p class="stat-label">Asignados a Mí</p>
                                <p class="stat-value">5 Tickets</p>
                            </div>
                        </div>
                        <div class="stat-card glass-panel is-liftable">
                            <div class="stat-icon violet">
                                <span class="material-symbols-outlined">verified</span>
                            </div>
                            <div>
                                <p class="stat-label">SLA Vigente</p>
                                <p class="stat-value">100%</p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Bento Grid -->
                <div class="bento-grid">
                    
                    <!-- Panel de Tickets Asignados (RF-05) -->
                    <div class="articles-panel glass-panel reveal is-in">
                        <div class="panel-head">
                            <h3>Cola de Atención de Tickets</h3>
                            <span class="tag-badge tag-blue">Rol: Agente</span>
                        </div>
                        <div class="table-scroll">
                            <table>
                                <thead>
                                    <tr>
                                        <th>CÓDIGO</th>
                                        <th>TÍTULO / SOLICITANTE</th>
                                        <th>CATEGORÍA</th>
                                        <th>ESTADO (STATE)</th>
                                        <th>SLA / PRIORIDAD</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="selected">
                                        <td class="code-cell">TCK-4091</td>
                                        <td>
                                            <p class="article-title">Falla en conexión Red Laboratorio 3</p>
                                            <p class="article-updated">Solicitante: Instructor Osan[cite: 1]</p>
                                        </td>
                                        <td><span class="tag-badge tag-blue">Redes</span></td>
                                        <td><span class="tag-badge tag-warning">EN_PROCESO</span></td>
                                        <td><span class="tag-badge tag-warning">CRÍTICA (2h)</span></td>
                                    </tr>
                                    <tr>
                                        <td class="code-cell">TCK-4090</td>
                                        <td>
                                            <p class="article-title">Mantenimiento preventivo videobeam</p>
                                            <p class="article-updated">Solicitante: Coordinación</p>
                                        </td>
                                        <td><span class="tag-badge tag-violet">Hardware</span></td>
                                        <td><span class="tag-badge tag-blue">ASIGNADO</span></td>
                                        <td><span class="tag-badge tag-blue">MEDIA (6h)</span></td>
                                    </tr>
                                    <tr>
                                        <td class="code-cell">TCK-4087</td>
                                        <td>
                                            <p class="article-title">Instalación entorno Java JDK 17</p>
                                            <p class="article-updated">Solicitante: Aprendiz ADSO</p>
                                        </td>
                                        <td><span class="tag-badge tag-blue">Software</span></td>
                                        <td><span class="tag-badge tag-success">RESUELTO</span></td>
                                        <td><span class="tag-badge tag-success">BAJA (24h)</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- Panel de Acciones de Estado y Negocio del Agente -->
                    <div class="detail-col reveal is-in">
                        <div class="detail-card glass-panel">
                            <div class="detail-top">
                                <div>
                                    <span class="detail-eyebrow">TCK-4091 • CONTROL STATE</span>
                                    <h4 class="detail-title">Falla en Red Lab 3</h4>
                                </div>
                                <span class="tag-badge tag-warning">EnProcesoState</span>
                            </div>
                            <div class="detail-meta">
                                <div class="detail-meta-row">
                                    <span>Transición Actual</span>
                                    <span>EN_PROCESO $\rightarrow$ RESUELTO</span>
                                </div>
                                <div class="detail-meta-row">
                                    <span>Estrategia SLA</span>
                                    <span>Prioridad Crítica (Estrategia Activa)</span>
                                </div>
                            </div>

                            <div class="workflow-box">
                                <p>Acciones del Ciclo de Vida (Patrón State)</p>
                                <div class="state-actions-grid">
                                    <button class="action-state-btn primary-action">
                                        <span class="material-symbols-outlined">check_circle</span>
                                        <span>Resolver Ticket (ResolverAction)</span>
                                    </button>
                                    <button class="action-state-btn">
                                        <span class="material-symbols-outlined">pause</span>
                                        <span>Pausar Atención</span>
                                    </button>
                                    <button class="action-state-btn" style="color: var(--error);">
                                        <span class="material-symbols-outlined">cancel</span>
                                        <span>Cancelar</span>
                                    </button>
                                </div>
                            </div>

                            <div class="comment-section">
                                <span style="font-size: 12px; font-weight: 600; color: var(--on-surface-muted);">Agregar Nota / Comentario (RF-07)</span>
                                <div class="comment-input-wrapper">
                                    <input type="text" placeholder="Escribe un comentario técnico..."/>
                                    <button title="Enviar comentario">
                                        <span class="material-symbols-outlined">send</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>
        </main>
    </div>

</body>

```