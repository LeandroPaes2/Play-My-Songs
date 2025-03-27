package org.example.playsongs;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.example.playsongs.entities.Usuario;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (email != null && senha != null && email.contains("@")) {
            String senhaEsperada = email.substring(0, email.indexOf("@"));

            if (senha.equals(senhaEsperada)) {

                Usuario usuario = new Usuario(email,1);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("usuario", usuario);
                response.sendRedirect("CadMusica.jsp");
                return;
            }
        }


        response.sendRedirect("erro.jsp?erro=1");
    }
}
