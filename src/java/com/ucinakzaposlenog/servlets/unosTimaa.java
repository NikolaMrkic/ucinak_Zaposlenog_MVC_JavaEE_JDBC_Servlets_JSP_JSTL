/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ucinakzaposlenog.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.ucinakzaposlenog.model.Zaposleni;
import java.util.ArrayList;
import com.ucinakzaposlenog.controller.Kontroler;

/**
 *
 * @author nikol
 */
public class unosTimaa extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
       
    }

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
        processRequest(request, response);
        
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
        processRequest(request, response);
        
                String Zaposleni = request.getParameter("cbZaposleni");
        String ime= Zaposleni.substring(0, Zaposleni.indexOf(" "));
        
        int idZaposlenog = 0;
        for(Zaposleni z : Kontroler.getInstance().vratiZaposlene()){
            if(z.getIme().equalsIgnoreCase(ime)){
            idZaposlenog = z.getId();
               // System.out.println(z.getId());
            }
        }
       String tim = request.getParameter("nazivTima");
       Kontroler.getInstance().unesiZaposlenogUTim(tim,idZaposlenog);
       // PrintWriter pw=response.getWriter();
       //pw.print("Id JE "+idZaposlenog+"      "+tim);
       
       request.getRequestDispatcher("dodavanjeZaposlenogUtim.jsp").forward(request, response);
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
