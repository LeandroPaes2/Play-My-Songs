package org.example.playsongs;

import java.io.*;

import org.example.playsongs.util.Usuario;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "loginServlet", value = "/login-servlet")
public class Login extends HttpServlet{

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("email");
        String senha  = request.getParameter("senha");
        if(email!=null && senha!=null)
        {
            Usuario user=new Usuario(email,1);
            //guardar as informações do usuário na sessão
            HttpSession httpSession=request.getSession();
            httpSession.setAttribute("usuario",user);
            response.sendRedirect("CadUsuario.jsp");
            return;

        }
        response.sendRedirect(".");
    }

}
