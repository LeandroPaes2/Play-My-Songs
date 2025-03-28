<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Login</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<header class=" bg-dark text-white p-3 ">
  <div class="container">
    <div class="d-flex justify-content-between align-items-center">
      <h1>Login</h1>
    </div>
  </div>
</header>
  <div class="container mt-3">
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
    <button type="submit" class="btn btn-primary">Confirmar</button>
  </form>
</div>

</body>
</html>
