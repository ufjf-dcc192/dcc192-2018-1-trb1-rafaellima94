<%@page import="dcc.ufjf.Mesas"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Mesas</title>
    </head>
    <body>
        <h1>Lista de Mesas</h1>
        <table border="1">
            <tbody>
                <%
                    for (Mesas mesa : (List<Mesas>) request.getAttribute("mesas")) {
                %>
                <tr>
                    <td>Mesa <%=mesa.getNumero()%></td>
                    <%
                        if(mesa.isAberta()) {
                    %>
                        <td><a href="/pedido?mesa="<%= mesa.getNumero() %>>Realizar pedido</a></td>
                        <td><a href="/fechar?mesa="<%= mesa.getNumero() %>>Fechar mesa</a></td>
                    <%
                        } else {
                    %>
                        <td><a href="/abrir?mesa="<%= mesa.getNumero() %>>Abrir mesa</a></td>
                        <td><a href="/listar-pedidos?mesa="<%= mesa.getNumero() %>>Ver pedidos</a></td>
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
