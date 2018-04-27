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
    <h1>Pedidos da Mesa <%=mesa.getNumero()%></h1>
    <%
        List<Pedidos> asd = new ArrayList<Pedidos>();
        Itens i = new Itens(15, "sdf", 20);
        Itens i1 = new Itens(16, "sdsdff", 203);
        Pedidos p = new Pedidos(4, LocalDateTime.now());
        p.addItens(i, 200);
        p.addItens(i, 12);
        p.setHoraFechamento(LocalDateTime.now());
        Pedidos p1 = new Pedidos(23, LocalDateTime.now());
        p1.addItens(i, 23400);
        p1.addItens(i1, 122);
        p1.setHoraFechamento(LocalDateTime.now());
        asd.add(p);
        asd.add(p1);
        mesa.setPedidos(asd);
        for (Pedidos pedido : mesa.getPedidos()) {
    %>
    <span>Pedido n�mero: <%=pedido.getNumero()%></span>
    <span>Hora abertura: <%=pedido.getHoraAberturaString()%></span>
    <span>Hora fechamento: <%=pedido.getHoraFechamentoString()%></span>
    <table border="1">
        <tbody>
            <tr>
                <th>Item</th>
                <th>Pre�o</th>
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
    %>
<%@include file="jspf/footer.jspf" %>
