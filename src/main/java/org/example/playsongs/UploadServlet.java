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

    private static final String UPLOAD_DIR = "uploads";  // Pasta onde os arquivos serão salvos

    public void doPost(HttpServletRequest request, HttpServletResponse response) {
        response.setContentType("text/plain;charset=UTF-8");

        try {
            Part filePart = request.getPart("file");
            String fileName = filePart.getSubmittedFileName();

            // Criando a pasta "uploads" se não existir
            String uploadPath = getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Salvando o arquivo
            File file = new File(uploadPath + File.separator + fileName);
            try (InputStream fileContent = filePart.getInputStream();
                 OutputStream out = new FileOutputStream(file)) {
                byte[] buffer = new byte[1024];
                int bytesRead;
                while ((bytesRead = fileContent.read(buffer)) != -1) {
                    out.write(buffer, 0, bytesRead);
                }
            }

            response.getWriter().write("Arquivo enviado com sucesso!");
        } catch (Exception e) {
            try {
                response.getWriter().write("Erro ao receber o arquivo: " + e.getMessage());
            } catch (IOException ignored) {}
        }
    }
}
