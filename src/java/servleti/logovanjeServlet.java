/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servleti;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import domen.KorisnikAplikacije;
import kontroler.Kontroler;

/**
 *
 * @author nikola
 */
public class logovanjeServlet extends HttpServlet {

   
     protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        response.setContentType("text/html;charset=UTF-8");
    
        String korisnickoIme = request.getParameter("korisnickoIme");
        String lozinka = request.getParameter("lozinka");
        
        boolean provera = false;

       for(KorisnikAplikacije k : Kontroler.getInstance().vratiKorisnikeAplikacije()){
           
            if(k.getKorisnickoIme().equalsIgnoreCase(korisnickoIme)){
                if (k.getLozinka().equalsIgnoreCase(lozinka)) {
                    provera = true;
                    
                    break;
                }
            
            }
            
            }
       
       if(provera == true){
           
       request.getRequestDispatcher("pocetna.jsp").forward(request, response);
       
	}else {
           
	 request.getRequestDispatcher("index.jsp").forward(request, response);
	}
        
       
    }
     
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
