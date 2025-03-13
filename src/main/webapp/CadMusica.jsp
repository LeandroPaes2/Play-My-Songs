<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.io.File" %>
<%@page import="java.util.Arrays" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <title>Cadastro Músicas</title>
</head>
<body>

<div class="container mt-3">
  <div class="mt-4 p-5 bg-primary text-white rounded">
    <h1>Cadastro Músicas</h1>
  </div>
</div>

<div class="container mt-3">
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
</div>

<div class="container mt-4">
  <h2>Músicas Disponíveis</h2>
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
</div>

</body>
</html>
