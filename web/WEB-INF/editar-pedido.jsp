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
    <h1>Editar Itens - Mesa <%=mesa.getNumero()%></h1>
    <span>Pedido número: <%=pedido.getNumero()%></span>
    <span>Hora abertura: <%=pedido.getHoraAberturaString()%></span>
    <% if (!pedido.getItens().isEmpty()) { %>
    <table border="1">
        <tbody>
            <tr>
                <th>Item</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Valor</th>
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
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
    <% } %>
    <form method="POST">
        <input type="hidden" name="action" value="adicionarItem" />
        <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
        <select name="item">
            <%
                for (Itens item : (List<Itens>) ListaDeItens.getInstance()) {
            %>
            <option value="<%=item.getId()%>"><%=item.getNome()%></option>
            <%
                }
            %>
        </select>
        <input type="number" name="quantidade" />
        <button type="submit">Adicionar itens</button>
    </form>
    <form method="POST">
        <input type="hidden" name="action" value="fechar" />
        <input type="hidden" name="mesaNum" value="<%=mesa.getNumero()%>" />
        <button class="btn btn-default" type="submit">
            Fechar mesa
        </button>
    </form>
<%@include file="jspf/footer.jspf" %>