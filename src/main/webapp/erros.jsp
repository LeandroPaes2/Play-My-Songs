<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page isErrorPage="true" %>
<html>
<head>
    <title>Erro</title>
</head>
<body style="background: red">
<h1>Deu erro!</h1>
<h3><%=exception.getMessage()%></h3>
</body>
</html>
