<%@page import="java.util.Map"%>
<%@page import="dcc.ufjf.Pedidos"%>
<%@page import="dcc.ufjf.Itens"%>
<%@page import="java.util.List"%>
<%@page import="dcc.ufjf.ListaDeItens"%>
<%@page import="dcc.ufjf.Mesas"%>
<%@include file="jspf/header.jspf" %>
    <%
        Mesas mesa = (Mesas) (request.getAttribute("mesa"));
        Pedidos pedido = ((Mesas) request.getAttribute("mesa")).getPedidoAtual();
    %>
    <div class="container">
        <h2>Editar Pedido - Mesa <%=mesa.getNumero()%></h2>
        <hr class="border-top" />
        <div class="d-flex justify-content-between mb-4">
            <div class="d-flex flex-column">
                <span class="mb-2">Pedido número: <%=pedido.getNumero()%></span>
                <span>Hora abertura: <%=pedido.getHoraAberturaString()%></span>
            </div>
            <form class="align-self-end" method="POST">
                <input type="hidden" name="action" value="fechar" />
                <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
                <button class="btn btn-primary" type="submit">
                    Fechar mesa
                </button>
            </form>
        </div>
        <form method="POST">
            <input type="hidden" name="action" value="adicionarItem" />
            <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
            <div class="d-flex">
                <select class="form-control col-3 mr-3" name="item">
                    <%
                        for (Itens item : (List<Itens>) ListaDeItens.getInstance()) {
                    %>
                    <option value="<%=item.getId()%>"><%=item.getNome()%></option>
                    <%
                        }
                    %>
                </select>
                <input class="form-control col-3 mr-3" type="number" name="quantidade" />
                <button class="btn btn-success" type="submit">Adicionar</button>
            </div>
        </form>
        <% if (!pedido.getItens().isEmpty()) { %>
        <table class="table table-sm table-bordered mt-4">
            <tbody>
                <tr>
                    <th>Item</th>
                    <th>Preço</th>
                    <th>Quantidade</th>
                    <th>Valor</th>
                    <th>Remover</th>
                </tr>
                <%
                    for (Map.Entry<Itens, Integer> item : ((Map<Itens, Integer>) pedido.getItens()).entrySet()) {
                %>
                <tr>
                    <td>
                        <%=item.getKey().getNome()%>
                    </td>
                    <td>
                        R$<%=item.getKey().getPreco()%>
                    </td>
                    <td>
                        <%=item.getValue()%>
                    </td>
                    <td>
                        R$<%=item.getKey().getPreco()*item.getValue()%>
                    </td>
                    <td class="p-0" style="width: 24px">
                        <form method="POST">
                            <input type="hidden" name="action" value="removerItem" />
                            <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
                            <input type="hidden" name="itemId" value="<%=item.getKey().getId()%>" />
                            <button class="btn btn-danger rounded-0 w-100" type="submit">
                                <i class="fa fa-times"></i>
                            </button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        <% } %>
    </div>
<%@include file="jspf/footer.jspf" %>