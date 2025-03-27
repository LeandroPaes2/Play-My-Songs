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
    <title>OuvirMusica</title>
</head>
<body class=" bg-dark text-white p-3 ">
    <header class=" bg-dark text-white p-3 ">


            <div class="d-flex justify-content-between align-items-center">
                <h2>Músicas Disponíveis</h2>
                <%
                    if(usuario!= null)
                    {
                %>
                <nav>
                    <form method="get" action="logoff-servlet">
                        <label>Logado como: <%=usuario.getEmail()%></label>
                    </form>
                </nav>
                <% } %>
            </div>

    </header>

    <div class="container mt-5 pt-5" >
                 <%
                    String uploadPath = application.getRealPath("/") + "MUSIQUINHAS";
                    File uploadDir = new File(uploadPath);
                    if (uploadDir.exists() && uploadDir.isDirectory()) {
                        File[] files = uploadDir.listFiles((dir, name) -> name.toLowerCase().endsWith(".mp3"));
                        if (files != null && files.length > 0) {
                            Arrays.sort(files);
                            for (File file : files) {
                                String fileName = file.getName();
                 %>

                <audio controls>
                    <source src="MUSIQUINHAS/<%= fileName %>" type="audio/mpeg">
                    Seu navegador não suporta o elemento de áudio.
                </audio>

                <p><%= fileName %></p>
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
            <button type="submit" class="btn btn-primary">Cadastrar Musicas</button>
        </form>
    </div>

</body>
</html>
