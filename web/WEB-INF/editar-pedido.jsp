<%@page import="dcc.ufjf.Itens"%>
<%@page import="java.util.List"%>
<%@page import="dcc.ufjf.ListaDeItens"%>
<%@page import="dcc.ufjf.Mesas"%>
<%@include file="jspf/header.jspf" %>
    <% Mesas mesa = (Mesas) (request.getAttribute("mesa")); %>
    <h1>Editar Itens - Mesa <%=mesa.getNumero()%></h1>
    <form method="POST">
        <input type="hidden" name="action" value="adicionar" />
        <select>
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
<%@include file="jspf/footer.jspf" %>