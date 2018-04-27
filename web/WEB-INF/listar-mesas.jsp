<%@page import="dcc.ufjf.Mesas"%>
<%@page import="java.util.List"%>
<%@include file="jspf/header.jspf" %>
    <div class="container">
        <h2>Lista de Mesas</h2>
        <hr class="border-top" />
        <table class="table table-sm table-bordered col-6">
            <tbody>
                <%
                    for (Mesas mesa : (List<Mesas>) request.getAttribute("mesas")) {
                %>
                <tr>
                    <td>Mesa <%=mesa.getNumero()%></td>
                    <td class="p-0 w-25">
                        <div class="d-flex">
                        <%
                            if(mesa.isAberta()) {
                        %>
                            <a class="w-50" href="editar-pedido?mesa=<%=mesa.getNumero()%>">
                                <button class="btn btn-primary rounded-0 w-100">
                                    Editar pedido
                                </button>
                            </a>
                            <form method="POST" class="w-50">
                                <input type="hidden" name="action" value="fechar" />
                                <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
                                <button class="btn btn-danger rounded-0 w-100" type="submit">
                                    Fechar mesa
                                </button>
                            </form>
                        <%
                            } else {
                        %>
                            <form method="POST" class="w-50">
                                <input type="hidden" name="action" value="abrir" />
                                <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
                                <button class="btn btn-success rounded-0 w-100" type="submit">
                                    Abrir mesa
                                </button>
                            </form>
                            <a class="w-50" href="listar-pedidos?mesa=<%=mesa.getNumero()%>">
                                <button class="btn btn-primary rounded-0 w-100">
                                    Ver pedidos
                                </button>
                            </a>
                        <%
                            }
                        %>
                        </div>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
<%@include file="jspf/footer.jspf" %>