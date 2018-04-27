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
                        <a href="editar-pedido?mesa=<%=mesa.getNumero()%>">
                            <button>
                                Realizar pedido
                            </button>
                        </a>
                    </td>
                    <td>
                        <form method="POST">
                            <button type="submit">
                            <input type="hidden" name="action" value="fechar" />
                            <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
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
                            <input type="hidden" name="action" value="abrir" />
                            <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
                                Abrir mesa
                            </button>
                        </form>
                    </td>
                    <td>
                        <a href="listar-pedidos?mesa=<%=mesa.getNumero()%>">
                            <button>
                                Ver pedidos
                            </button>
                        </a>
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