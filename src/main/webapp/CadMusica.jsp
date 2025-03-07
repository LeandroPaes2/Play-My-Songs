<%@page errorPage="erros.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>

<%@include file="acesso.jsp"%>

<html lang="pt-br">
<head>
  <script src="javascript/indexController.js"></script>
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
  <form method="post" action="upload-servlet" enctype="multipart/form-data" id="uploadForm">
    <div class="mb-3 mt-3">
      <label for="titulo">Título:</label>
      <input type="text" class="form-control" id="titulo" placeholder="Informe o título da música" name="titulo">
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
    <div class="mb-3 mt-3">
      <label for="artista">Artista:</label>
      <input type="text" class="form-control" id="artista" placeholder="Informe o nome do artista" name="artista">
    </div>

    <div class="mb-3">
      <label for="file">Arquivo:</label>
      <input type="file" class="form-control" name="file" id="file" required>
    </div>

    <button type="submit" class="btn btn-primary" onclick="EnviarArquivo()">Enviar Arquivo</button>
  </form>

  <div id="mensagem" class="mt-3" style="display: none; padding: 10px; background-color: green; color: white; text-align: center;">
    Arquivo enviado com sucesso!
  </div>
<form method="get" action="list-files">
  <h3 class="mt-4">Arquivos Enviados</h3>
  <button class="btn btn-secondary mb-3" onclick="carregarArquivos()">Atualizar Lista</button>
  <ul id="listaArquivos" class="list-group"></ul>
</form>

</div>

<script>
  document.getElementById("uploadForm").addEventListener("submit", function(event) {
    event.preventDefault();

    let formData = new FormData(this);

    fetch("upload-servlet", {
      method: "POST",
      body: formData
    })
            .then(response => response.text())
            .then(data => {
              let mensagem = document.getElementById("mensagem");
              mensagem.style.display = "block";
              setTimeout(() => {
                mensagem.style.display = "none";
              }, 3000);
              this.reset();
              carregarArquivos(); // Atualiza a lista de arquivos após o upload
            })
            .catch(error => console.error("Erro ao enviar o arquivo:", error));
  });

  function carregarArquivos() {
    fetch("list-files")
            .then(response => response.json())
            .then(arquivos => {
              let lista = document.getElementById("listaArquivos");
              lista.innerHTML = "";
              if (arquivos.length === 0) {
                lista.innerHTML = "<li class='list-group-item'>Nenhum arquivo enviado.</li>";
              } else {
                arquivos.forEach(arquivo => {
                  let item = document.createElement("li");
                  item.className = "list-group-item";
                  item.innerHTML = `<a href="uploads/${arquivo}" target="_blank">${arquivo}</a>`;
                  lista.appendChild(item);
                });
              }
            })
            .catch(error => console.error("Erro ao carregar os arquivos:", error));
  }

  window.onload = carregarArquivos; // Carrega os arquivos ao abrir a página
</script>

</body>
</html>
