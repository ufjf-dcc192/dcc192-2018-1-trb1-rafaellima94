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
        <div class="d-flex align-items-center">
            <div class="card rounded-0 mx-auto">
                <div class="card-header">
                    <span class="font-weight-bold">Pedido número: <%=pedido.getNumero()%></span>
                </div>
                <div class="card-body">
                    <div class="d-flex flex-column">
                        <span class="mb-2">Hora abertura: <%=pedido.getHoraAberturaString()%></span>
                        <span>Hora fechamento: <%=pedido.getHoraFechamentoString()%></span>
                    </div>
                </div>
            </div>
            <table class="table table-sm table-bordered w-50">
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
        </div>
        <hr class="border-top" />
        <%
                }
            } else {
        %>
        <h4 class="text-muted">Não há pedidos até o momento.</h4>
        <%  } %>
    </div>
<%@include file="jspf/footer.jspf" %>
