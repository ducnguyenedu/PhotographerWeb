/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DAOGallery;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Collection;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Gallery;
import model.Image;
import userController.UsertListener;

/**
 *
 * @author duchi
 */
@MultipartConfig
public class AdminController extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Gallery gallery = new Gallery();
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        gallery.setName(name);
        gallery.setDescription(description);
        Collection<Part> filesPart = request.getParts();
        for (Part part : filesPart) {
            System.out.println(part.getName());
            if (part.getName().equals("image")) {

                InputStream fios = part.getInputStream();
                ByteArrayOutputStream baos = new ByteArrayOutputStream();

                int nRead;
                byte[] data = new byte[1024];

                while ((nRead = fios.read(data, 0, data.length)) != -1) {
                    baos.write(data, 0, nRead);
                }

                Image image = new Image(baos.toByteArray());
                gallery.getImages().add(image);
            }

        }
        DAOGallery daog = new DAOGallery();
        daog.insertGalleary(gallery);
        ArrayList<Gallery> gallerys = daog.getFrontPageDisplay();
        ArrayList<String> encodes = new ArrayList<>();
        for (Gallery gallery1 : gallerys) {
            for (Image image : gallery1.getImages()) {
                String encode = Base64.getEncoder().encodeToString(image.getImage());
                encodes.add(encode);
            }
        }
        UsertListener listener = (UsertListener) request.getSession().getAttribute("UsertListener");
        listener.updateData();
        request.setAttribute("imgBase", encodes);
        request.getRequestDispatcher("admin/display.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
