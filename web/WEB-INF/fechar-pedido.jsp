<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dcc.ufjf.Itens"%>
<%@page import="dcc.ufjf.Pedidos"%>
<%@page import="java.util.List"%>
<%@page import="dcc.ufjf.Mesas"%>
<%@include file="jspf/header.jspf" %>
    <% Mesas mesa = (Mesas) (request.getAttribute("mesa")); %>
    <h1>Fechhamento de pedido - Mesa <%=mesa.getNumero()%></h1>
    <%
        Pedidos pedido = ((Mesas) request.getAttribute("mesa")).getPedidoAtual();
    %>
    <span>Pedido número: <%=pedido.getNumero()%></span>
    <span>Hora abertura: <%=pedido.getHoraAberturaString()%></span>
    <span>Hora fechamento: <%=pedido.getHoraFechamentoString()%></span>
    <table border="1">
        <tbody>
            <tr>
                <th>Item</th>
                <th>Preço</th>
                <th>Quantidade</th>
                <th>Valor</th>
            </tr>
            <%
//                Itens i = new Itens("sdf", 20);
//                Itens i1 = new Itens("sdsdff", 203);
//                pedido.addItens(i, 3);
//                pedido.addItens(i1, 4);
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
<%@include file="jspf/footer.jspf" %>