<%@page import="dcc.ufjf.Mesas"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>
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
<%@include file="jspf/footer.jspf" %>