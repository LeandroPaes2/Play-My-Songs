package org.example.playsongs;

import java.io.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet(name = "listFilesServlet", value = "/list-files")
public class ListFilesServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "uploads";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("application/json;charset=UTF-8");

        File uploadDir = new File(getServletContext().getRealPath("/") + File.separator + UPLOAD_DIR);
        String[] fileList = uploadDir.exists() ? uploadDir.list() : new String[0];

        PrintWriter out = response.getWriter();
        out.print("[");
        for (int i = 0; i < fileList.length; i++) {
            out.print("\"" + fileList[i] + "\"");
            if (i < fileList.length - 1) out.print(",");
        }
        out.print("]");
        out.flush();
    }
}
