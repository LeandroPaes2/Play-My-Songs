package org.example.playsongs;

import java.io.*;
import java.nio.file.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@MultipartConfig(
        location="/",
        fileSizeThreshold=1024*1024,
        maxFileSize=1024*1024*100,
        maxRequestSize=1024*1024*10*10
)
@WebServlet(name = "uploadServlet", value = "/upload-servlet")
public class UploadServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "MUSIQUINHAS";

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/plain;charset=UTF-8");
        String titulo = request.getParameter("titulo");
        String genero = request.getParameter("genero");
        String artista = request.getParameter("artista");

        if (titulo != null && genero != null && artista != null) {
            try (PrintWriter writer = response.getWriter()) {
                titulo = titulo.replace(" ", "_");
                genero = genero.replace(" ", "_").toLowerCase();
                artista = artista.replace(" ", "_").replace("'", "");

                String fileName = titulo + "_" + genero + "_" + artista + ".mp3";

                Part filePart = request.getPart("file");

                String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR;
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdir();
                }

                File file = new File(uploadPath + File.separator + fileName);
                try (InputStream fileContent = filePart.getInputStream();
                     OutputStream out = new FileOutputStream(file)) {
                    byte[] buffer = new byte[1024];
                    int bytesRead;
                    while ((bytesRead = fileContent.read(buffer)) != -1) {
                        out.write(buffer, 0, bytesRead);
                    }
                }


                response.sendRedirect("CadMusica.jsp");
            } catch (Exception e) {
                try (PrintWriter writer = response.getWriter()) {
                    writer.println("Erro ao receber o arquivo: " + e.getMessage());
                } catch (IOException ignored) {}
            }

        }
        else {
            response.sendRedirect("CadMusica.jsp");
        }
    }
}
