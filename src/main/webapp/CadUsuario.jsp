<%@page errorPage="erros.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>

<%@include file="acesso.jsp"%>

<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<div class="container mt-3">
    <div class="mt-4 p-5 bg-primary text-white rounded">
        <h1>Login</h1>
    </div>
</div>
<div class="container mt-3">
    <form method="post" action="CadMusica.jsp">
        <div class="mb-3 mt-3">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" placeholder="Informe o email" name="email">
        </div>
        <div class="mb-3">
            <label for="senha">Senha:</label>
            <input type="password" class="form-control" id="senha" placeholder="Informe sua senha" name="senha">
        </div>
        <button type="submit" class="btn btn-primary">Confirmar</button>
    </form>
</div>

</body>
</html>