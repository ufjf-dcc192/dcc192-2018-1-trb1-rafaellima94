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
                    <td>
                        <form method="POST" action="">
                            <button type="submit">
                            <input type="hidden" name="mesaNum" value="<%= mesa.getNumero() %>" />
                                Realizar pedido
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="">
                            <button type="submit">
                            <input type="hidden" name="mesaNum" value="<%= mesa.getNumero() %>" />
                                Fechar mesa
                            </button>
                        </form>
                    </td>
                <%
                    } else {
                %>
                    <td>
                        <form method="POST">
                            <button type="submit">
                            <input type="hidden" name="mesaNum" value="<%= mesa.getNumero() %>" />
                                Abrir mesa
                            </button>
                        </form>
                    </td>
                    <td>
                        <form method="POST" action="">
                            <input type="hidden" name="mesaNum" value="<%= mesa.getNumero() %>" />
                            <button type="submit">
                                Ver pedidos
                            </button>
                        </form>
                    </td>
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