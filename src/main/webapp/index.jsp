<%@page import="java.util.ArrayList"%>
<%@page import="com.emergentes.calificaciones.estudiante"%>
<%
    if(session.getAttribute("listaEst")==null){
      ArrayList<estudiante> lisAux= new ArrayList<estudiante>();
      session.setAttribute("listaEst", lisAux);
    }
    ArrayList<estudiante> lista=(ArrayList<estudiante>)session.getAttribute("listaEst");
    
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr>
                <td>primer parcial tem-742</td>
            </tr>    
            <tr>
                <td>nombre: roger laura mamani</td>
            </tr>     
            <tr>
                <td>carnet: 8390722</td>
            </tr>     
        </table>
        <h1>registro de calificaciones</h1>
        <a href="MainServlet?op=nuevo">nuevo registro</a>
        <table border="1">
            <tr>
                <th>Id</th>
                <th>Nombre</th>
                <th>P1</th>
                <th>P2</th>
                <th>Ef</th>
                <th>Nota</th>
                <th></th>
                <th></th>
            </tr>
            <%
            if(lista !=null){
               for(estudiante item: lista){

            %>    
            <tr>
                <td><%= item.getId() %></td>
                <td><%= item.getNombre() %></td>
                <td><%= item.getP1 ()%></td> 
                <td><%= item.getP2() %></td> 
                <td><%= item.getEf() %></td> 
                <td><%= item.getNota() %></td> 
                <td>
                    <a href="<a href="MainServlet?op=editar&id=<%= item.getId()%>">editar</a>

                </td>
                <td>
                    <a href="MainServlet?op=eliminar&id=<%= item.getId()%>"
                       onclick ="return(confirm('esta seguro de eliminar?'))">eliminar</a>
                </td> 
            </tr>
            <%
                           }
            }
            %>
        </table>
    </body>
</html>
