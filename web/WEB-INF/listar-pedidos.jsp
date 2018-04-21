<%@page import="dcc.ufjf.Pedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos da Mesa <%=1%></title>
    </head>
    <body>
        <h1>Pedidos da Mesa <%=1%></h1>
        <table border="1">
            <tbody>
                <%
                    for (Pedidos pedido : mesa.get) {
                %>
                <tr>
                    <td><%=1%></td>
                    <td><%=1%></td>
                    <%
                        if(mesa.isAberta()) {
                    %>
                        <td><a href="">Realizar pedido</a></td>
                        <td><a href="">Fechar mesa</a></td>
                    <%
                        } else {
                    %>
                        <td><a href="">Abrir mesa</a></td>
                        <td><a href=">Ver pedidos</a></td>
                    <%
                        }
                    %>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </body>
</html>
