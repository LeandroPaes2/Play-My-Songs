<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Arrays" %>
<%@ page import="org.example.playsongs.entities.Usuario" %>
<%@include file="Acesso.jsp"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>Cadastro Músicas</title>
</head>
<body class=" bg-dark text-white p-3 ">

    <header class=" bg-dark text-white p-3 ">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
          <h1>Cadastro Músicas</h1>
            <%

                if(usuario!= null)
                {
                    %>
                   <nav>
                     <form method="get" action="logoff-servlet">
                      <label>Logado como: <%=usuario.getEmail()%></label>
                      <input type="submit" value="Logoff">
                    </form>
                  </nav>
                <% } %>
        </div>
      </div>
    </header>
    <div class="container mt-5 pt-5">
      <form method="post" action="upload-servlet" enctype="multipart/form-data">
        <div class="mb-3">
          <label for="titulo">Título:</label>
          <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Informe o título da música">
        </div>
        <div class="mb-3">
          <label for="genero">Gênero:</label>
          <select class="form-select" id="genero" name="genero">
            <option selected disabled value="">Selecione</option>
            <option value="funk">Funk</option>
            <option value="sertanejo">Sertanejo</option>
            <option value="rock">Rock</option>
            <option value="pop">Pop</option>
          </select>
        </div>
        <div class="mb-3">
          <label for="artista">Artista:</label>
          <input type="text" class="form-control" id="artista" name="artista" placeholder="Informe o nome do artista">
        </div>
        <div class="mb-3">
          <label for="file">Arquivo:</label>
          <input type="file" class="form-control" name="file" id="file" required>
        </div>
        <button type="submit" class="btn btn-primary" onclick="EnviarArquivo()">Enviar Arquivo</button>
      </form>
      <form action="OuvirMusica.jsp">
        <button type="submit" class="btn btn-primary">Ouvir Musicas</button>
      </form>
    </div>
  </body>
</html>
