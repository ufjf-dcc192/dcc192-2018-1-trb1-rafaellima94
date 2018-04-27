<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="dcc.ufjf.Itens"%>
<%@page import="dcc.ufjf.Mesas"%>
<%@page import="dcc.ufjf.Pedidos"%>
<%@include file="jspf/header.jspf" %>
    <%
        Mesas mesa = (Mesas) request.getAttribute("mesa");
    %>
    <div class="container">
        <h2>Pedidos da Mesa <%=mesa.getNumero()%></h2>
        <hr class="border-top" />
        <%
            if (mesa.getPedidos().size() > 0) {
                for (Pedidos pedido : mesa.getPedidos()) {
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
        <%
                }
            } else {
        %>
        <h4 class="text-muted">Não há pedidos até o momento.</h4>
        <%  } %>
    </div>
<%@include file="jspf/footer.jspf" %>
