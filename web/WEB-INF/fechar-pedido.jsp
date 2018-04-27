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
    <div class="container">
        <h2>Fechamento de Pedido - Mesa <%=mesa.getNumero()%></h2>
        <hr class="border-top" />
        <div class="d-flex align-items-center">
            <div class="card rounded-0 mx-auto">
                <div class="card-header">
                    <span class="mb-2 font-weight-bold">Pedido número: <%=pedido.getNumero()%></span>
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
        </div>
    </div>
<%@include file="jspf/footer.jspf" %>