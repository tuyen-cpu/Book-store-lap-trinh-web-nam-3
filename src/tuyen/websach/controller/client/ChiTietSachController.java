package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.impl.SachDAOImpl;
import tuyen.websach.model.Sach;

/**
 * Servlet implementation class ChiTietSachController
 */
@WebServlet("/ChiTietSach")
public class ChiTietSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietSachController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String masach= request.getParameter("masach");
		SachDAOImpl sachDAO = new SachDAOImpl();
		Sach sach= sachDAO.getSach(Integer.parseInt(masach));
		getServletContext().setAttribute("sach", sach);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/chi-tiet-sach.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
