
package com.emergentes.controlador;

import com.emergentes.calificaciones.estudiante;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class MainServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String op= request.getParameter("op");
        estudiante objest= new estudiante();
        int id, pos;
        HttpSession ses=request.getSession();
        ArrayList<estudiante> lista =(ArrayList<estudiante> )ses.getAttribute("listaEst");
        switch(op){
            case "nuevo":
                request.setAttribute("miobjest", objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "editar":
                id= Integer.parseInt(request.getParameter("id"));
                pos= buscarPorIndice(request,id);
                objest=lista.get(pos);
                request.setAttribute("miobjest",objest);
                request.getRequestDispatcher("editar.jsp").forward(request, response);
                break;
            case "eliminar":
                 id= Integer.parseInt(request.getParameter("id"));
                 pos= buscarPorIndice(request,id);
                 if(pos>=0){
                   lista.remove(pos);
                 }
                 request.setAttribute("listaEst",lista);
                 response.sendRedirect("index.jsp");
                break;
            default:    
        }
        
    }

        @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id =Integer.parseInt(request.getParameter("id"));
        int p1 =Integer.parseInt(request.getParameter("p1"));
        int p2 =Integer.parseInt(request.getParameter("p2"));
        int Ef =Integer.parseInt(request.getParameter("ef"));
        int nota =Integer.parseInt(request.getParameter("nota"));
        HttpSession ses = request.getSession();
        ArrayList<estudiante> lista = (ArrayList<estudiante>)ses.getAttribute("listaEst");
        estudiante objest= new estudiante();
        objest.setId(id);
        objest.setNombre(request.getParameter("nombre"));
        objest.setP1(p1);
        objest.setP2(p2);
        objest.setEf(Ef);
        objest.setNota(nota);
       if(id==0){
         int idNuevo=obtenerId(request);
         objest.setId(idNuevo);
         lista.add(objest);
       } 
       else{
       int pos=buscarPorIndice(request,id);
       lista.set(pos, objest);
       
       }
       request.setAttribute("listaEst",lista);
       response.sendRedirect("index.jsp");

    }
       public int buscarPorIndice(HttpServletRequest request, int id){
       HttpSession ses=request.getSession();
       ArrayList<estudiante> lista= (ArrayList<estudiante>)ses.getAttribute("listaEst");
       int pos =-1;
       if (lista!=null){
        for(estudiante ele: lista){
         ++pos;
         if(ele.getId()==id){
          break;
         }
        }
       }
       return pos;
       }
    public int obtenerId(HttpServletRequest request){
    HttpSession ses= request.getSession();
    ArrayList<estudiante> lista=(ArrayList<estudiante>) ses.getAttribute("listaEst");
    int idn=0;
    for(estudiante ele: lista){
    idn= ele.getId();
    }
    return idn +1;
    } 
}
