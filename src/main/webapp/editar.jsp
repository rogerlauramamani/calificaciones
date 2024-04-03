<%@page import="com.emergentes.calificaciones.estudiante"%>
<%
estudiante reg=(estudiante) request.getAttribute("miobjest");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
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
    <body>
        
        <h1>registro de estudiante</h1>
        <form action="MainServlet" method="post">
            <table>
                <tr>
                    <td>id</td>
                    <td><input type="text" name="id" value="<%= reg.getId() %>" size="2" readonly></td>
                </tr>
                <tr>
                    <td>nombre</td>
                    <td><input type="text" name="nombre" value="<%= reg.getNombre() %>"></td>
                </tr>
                <tr>
                    <td>p1</td>
                    <td><input type="text" name="p1" value="<%= reg.getP1() %>" ></td>
                </tr>
                <tr>
                    <td>p2</td>
                    <td><input type="text" name="p2" value="<%= reg.getP2() %>" ></td>
                </tr>
                <tr>
                    <td>Ef</td>
                    <td><input type="text" name="ef" value="<%= reg.getEf() %>" ></td>
                </tr>
                <tr>
                    <td>nota</td>
                    <td><input type="text" name="nota" value="<%= reg.getNota() %>" ></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td><input type="submit" value="enviar" ></td>
                </tr>
            </table>
        </form>
    </body>
</html>
