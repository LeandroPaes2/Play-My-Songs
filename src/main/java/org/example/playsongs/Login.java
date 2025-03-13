package org.example.playsongs;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class Login extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (email != null && senha != null && email.contains("@")) {
            String senhaEsperada = email.substring(0, email.indexOf("@"));

            if (senha.equals(senhaEsperada)) {
                // Login válido
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("usuario", email);
                response.sendRedirect("CadMusica.jsp");
                return;
            }
        }

        // Login inválido
        response.sendRedirect("erro.jsp?erro=1");
    }
}
