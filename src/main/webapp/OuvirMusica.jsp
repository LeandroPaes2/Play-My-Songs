<%@ page import="java.io.File" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="org.example.playsongs.entities.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="Acesso.jsp"%>

<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <title>OuvirMúsica</title>
</head>
<body class="bg-dark text-white p-3">
<header class="bg-dark text-white p-3">
    <div class="d-flex justify-content-between align-items-center">
        <h2>Músicas Disponíveis</h2>
        <% if (usuario != null) { %>
        <nav>
            <form method="get" action="logoff-servlet">
                <label>Logado como: <%= usuario.getEmail() %></label>
            </form>
        </nav>
        <% } %>
    </div>
</header>

<div class="container mt-5 pt-5">
    <!-- Formulário de busca -->
    <form method="get">
        <div class="input-group mb-3">
            <input type="text" name="buscarArtista" class="form-control" placeholder="Digite o nome do artista" value="<%= request.getParameter("buscarArtista") != null ? request.getParameter("buscarArtista") : "" %>">
            <button type="submit" class="btn btn-primary">Buscar</button>
        </div>
    </form>

    <%
        // Captura o nome do artista digitado
        String filtroArtista = request.getParameter("buscarArtista");
        if (filtroArtista != null) {
            filtroArtista = filtroArtista.trim().toLowerCase();
        }

        String uploadPath = application.getRealPath("/") + "MUSIQUINHAS";
        File uploadDir = new File(uploadPath);
        if (uploadDir.exists() && uploadDir.isDirectory()) {
            File[] files = uploadDir.listFiles((dir, name) -> name.toLowerCase().endsWith(".mp3"));
            if (files != null && files.length > 0) {
                Arrays.sort(files);
                boolean encontrou = false;

                for (File file : files) {
                    String fileName = file.getName();

                    // Remove extensão .mp3
                    String baseName = fileName.replace(".mp3", "");

                    // Separa artista e música
                    String[] parts = baseName.split("[-_]", 2);
                    String artista = (parts.length > 1) ? parts[0].trim() : "Desconhecido";
                    String musica = (parts.length > 1) ? parts[1].trim() : baseName;

                    // Filtra pelo artista digitado
                    if (filtroArtista == null || filtroArtista.isEmpty() || artista.toLowerCase().contains(filtroArtista)) {
                        encontrou = true;
    %>

    <div class="mb-3">
        <p><strong>Artista:</strong> <%= artista %></p>
        <p><strong>Música:</strong> <%= musica %></p>
        <audio controls>
            <source src="MUSIQUINHAS/<%= fileName %>" type="audio/mpeg">
            Seu navegador não suporta o elemento de áudio.
        </audio>
    </div>

    <%
            }
        }
        if (!encontrou) {
    %>
    <p>Nenhuma música encontrada para este artista.</p>
    <%
        }
    } else {
    %>
    <p>Nenhuma música disponível.</p>
    <%
        }
    } else {
    %>
    <p>Diretório de uploads não encontrado.</p>
    <%
        }
    %>

    <form action="CadMusica.jsp">
        <button type="submit" class="btn btn-primary">Cadastrar Músicas</button>
    </form>
</div>
</body>
</html>
