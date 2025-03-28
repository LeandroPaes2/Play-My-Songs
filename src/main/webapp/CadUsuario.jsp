<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<header class=" bg-dark text-white p-2 fixed-top">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <h1>Login</h1>
        </div>
    </div>
</header>
    <div class="container mt-5 pt-5">
    <% String erro = request.getParameter("erro"); %>
    <% if ("1".equals(erro)) { %>
    <div class="alert alert-danger" role="alert">
        Email ou senha incorretos!
    </div>
    <% } %>

    <form method="post" action="login-servlet">
        <div class="mb-3 mt-3">
            <label for="email">Email:</label>
            <input type="email" class="form-control" id="email" placeholder="Informe o email" name="email" required>
        </div>
        <div class="mb-3">
            <label for="senha">Senha:</label>
            <input type="password" class="form-control" id="senha" placeholder="Informe sua senha" name="senha" required>
        </div>
        <button type="submit" class="btn btn-primary">Login</button>
    </form>
</div>

</body>
</html>
