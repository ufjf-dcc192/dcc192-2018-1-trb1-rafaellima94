<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="dcc.ufjf.Itens"%>
<%@page import="dcc.ufjf.Pedidos"%>
<%@page import="java.util.List"%>
<%@page import="dcc.ufjf.Mesas"%>
<%@include file="jspf/header.jspf" %>
    <%  
        Mesas mesa = (Mesas) (request.getAttribute("mesa"));
        Pedidos pedido = ((Mesas) request.getAttribute("mesa")).getPedidoAtual();
    %>
    <h1>Fechamento de pedido - Mesa <%=mesa.getNumero()%></h1>
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
                double valorTotal = 0;
                for (Map.Entry<Itens, Integer> item : ((Map<Itens, Integer>) pedido.getItens()).entrySet()) {
                    double valor = item.getKey().getPreco()*item.getValue();
                    valorTotal += valor;
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
                    R$<%=valor%>
                </td>
            </tr>
            <%
                }
            %>
            <tr>
                <td colspan="3">
                    Total
                </td>
                <td>
                    R$<%=valorTotal%>
                </td>
            </tr>
        </tbody>
    </table>
<%@include file="jspf/footer.jspf" %>