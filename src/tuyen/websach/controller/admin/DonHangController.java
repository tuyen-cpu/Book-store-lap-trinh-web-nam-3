package tuyen.websach.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.DonHangDAO;
import tuyen.websach.dao.impl.DonHangDAOImpl;
import tuyen.websach.model.DonHang;

/**
 * Servlet implementation class DonHangController
 */
@WebServlet("/admin/donhang")
public class DonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("Vào dơn hàng");
		DonHangDAO donHangDAO = new DonHangDAOImpl();
		List<DonHang> listDonHang =donHangDAO.getAll();
		request.setAttribute("listDH", listDonHang);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/don-hang.jsp");
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
