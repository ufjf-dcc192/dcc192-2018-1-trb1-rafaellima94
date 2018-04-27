package dcc.ufjf;

import java.io.IOException;
import java.time.LocalDateTime;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/listar-mesas", "/editar-pedido", "/listar-pedidos"})
public class RestauranteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String sp = request.getServletPath();

        if (null != sp) switch (sp) {
            case "/listar-mesas":
                listarMesas(request, response);
                break;
            case "/editar-pedido":
                editarPedido(request, response);
                break;
            case "/listar-pedidos":
                listarPedidos(request, response);
                break;
            default:
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("abrir".equals(action)) {
            Integer mesaNum = Integer.parseInt(request.getParameter("mesaNum"));
            Mesas mesa = ListaDeMesas.getInstance().get(mesaNum - 1);
            mesa.setAberta(true);
            mesa.addPedido(new Pedidos(mesa.getNumero(), LocalDateTime.now()));
            response.sendRedirect("editar-pedido?mesa=" + mesa.getNumero().toString());
        } else if ("fechar".equals(action)) {
            Integer mesaNum = Integer.parseInt(request.getParameter("mesaNum"));
            Mesas mesa = ListaDeMesas.getInstance().get(mesaNum - 1);
            
            if(mesa.isAberta()) {
                mesa.setAberta(false);
                mesa.getPedidoAtual().setHoraFechamento(LocalDateTime.now());
                request.setAttribute("mesa", mesa);
                RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/fechar-pedido.jsp");
                rd.forward(request, response);
            } else {
                response.sendRedirect("listar-mesas");
            }
        } else if ("adicionarItem".equals(action)) {
            Integer mesaNum = Integer.parseInt(request.getParameter("mesaNum"));
            Mesas mesa = ListaDeMesas.getInstance().get(mesaNum - 1);
            
            if(mesa.isAberta()) {
                Itens item = ListaDeItens.getInstance().get(Integer.parseInt(request.getParameter("item")) - 1);
                mesa.getPedidoAtual().addItens(item, Integer.parseInt(request.getParameter("quantidade")));
                response.sendRedirect("editar-pedido?mesa=" + mesa.getNumero().toString());
            } else {
                response.sendRedirect("listar-mesas");
            }
        } else if ("removerItem".equals(action)) {
            Integer mesaNum = Integer.parseInt(request.getParameter("mesaNum"));
            Mesas mesa = ListaDeMesas.getInstance().get(mesaNum - 1);
            
            if(mesa.isAberta()) {
                Itens item = ListaDeItens.getInstance().get(Integer.parseInt(request.getParameter("item")) - 1);
                mesa.getPedidoAtual().addItens(item, Integer.parseInt(request.getParameter("quantidade")));
                response.sendRedirect("editar-pedido?mesa=" + mesa.getNumero().toString());
            } else {
                response.sendRedirect("listar-mesas");
            }
        }
    }

    private void listarMesas(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        List<Mesas> mesas = ListaDeMesas.getInstance();
        request.setAttribute("mesas", mesas);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/listar-mesas.jsp");
        rd.forward(request, response);
    }

    private void editarPedido(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Integer mesaNum = Integer.parseInt(request.getParameter("mesa"));
        Mesas mesa = ListaDeMesas.getInstance().get(mesaNum - 1);
        
        if(mesa.isAberta()) {
            request.setAttribute("mesa", mesa);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/editar-pedido.jsp");
            rd.forward(request, response);
        } else {
//            response.sendError(HttpServletResponse.SC_FORBIDDEN, "mesa fechada");
            response.sendRedirect("listar-mesas");
        }
    }
    
    private void listarPedidos(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        Integer mesaNum = Integer.parseInt(request.getParameter("mesa"));
        Mesas mesa = ListaDeMesas.getInstance().get(mesaNum - 1);
        
        if(!mesa.isAberta()) {
            request.setAttribute("mesa", mesa);
            RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/listar-pedidos.jsp");
            rd.forward(request, response);
        } else {
//            response.sendError(HttpServletResponse.SC_FORBIDDEN, "mesa fechada");
            response.sendRedirect("listar-mesas");
        }
    }
}
