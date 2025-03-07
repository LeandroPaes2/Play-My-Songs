<%@ page import="org.example.playsongs.util.Usuario" %><%
    boolean acesso=true;
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if(usuario==null)
        acesso=false;
    else
    if(!usuario.isAtivo())
        acesso=false;
    if(!acesso)
        response.sendRedirect(".");
%>