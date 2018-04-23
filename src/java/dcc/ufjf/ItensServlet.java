package dcc.ufjf;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/editar-itens", "/listar-itens"})
public class ItensServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if ("/editar-itens.html".equals(request.getServletPath())) {
            editarItens(request, response);
        } else if ("/listar-itens.html".equals(request.getServletPath())) {
            listarItens(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
    
    private void editarItens(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestDispatcher despachante = request.getRequestDispatcher("/WEB-INF/editar-itens.jsp");
        despachante.forward(request, response);
    }

    private void listarItens(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {
        RequestDispatcher despachante = request.getRequestDispatcher("/WEB-INF/listar-itens.jsp");
        despachante.forward(request, response);
    }
}
