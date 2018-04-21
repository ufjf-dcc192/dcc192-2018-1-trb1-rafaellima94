package dcc.ufjf;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/pedidos"})
public class PedidosServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    private void listarPedidos(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        List<Pedidos> pedidos = mesa.get;
        request.setAttribute("pedidos", pedidos);
        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/tarefas-listar.jsp");
        rd.forward(request, response);
    }
}
