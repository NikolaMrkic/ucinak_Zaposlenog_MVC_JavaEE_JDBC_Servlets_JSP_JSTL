/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import domen.Tim;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import kontroler.Kontroler;

/**
 *
 * @author nikol
 */
public class dodavanjeTimaUProjekat extends HttpServlet {

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

        String tim = request.getParameter("cbTim");
        //String ime= Tim.substring(0, Tim.indexOf(" "));

        int idTima = 0;
        for (Tim t : Kontroler.getInstance().vratiTim()) {
            if (t.getNazivTima().equalsIgnoreCase(tim)) {
                idTima = t.getId();
                // System.out.println(z.getId());
            }
        }

        String nazivProjekta = request.getParameter("nazivProjektaa");

        double brSati = Double.parseDouble(request.getParameter("brRadihSati"));

        Kontroler.getInstance().unesiTimUProjekat(nazivProjekta, brSati, idTima);
        // PrintWriter pw=response.getWriter();
        // pw.print("Naziv tima je "+"'"+tim +"'"+" ID TIMA JE "+idTima+" NAziv Projekta "+ nazivProjekta+" Br.SAti "+brSati);
        request.getRequestDispatcher("dodavanjeTimaUProjekat.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
