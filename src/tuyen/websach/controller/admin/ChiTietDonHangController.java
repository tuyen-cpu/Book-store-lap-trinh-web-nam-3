package tuyen.websach.controller.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.ChiTietDonHangDAO;
import tuyen.websach.dao.impl.ChiTietDonHangDAOImpl;
import tuyen.websach.model.ChiTietDonHang;

/**
 * Servlet implementation class ChiTietDonHangController
 */
@WebServlet("/admin/chitietdonhang")
public class ChiTietDonHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChiTietDonHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("vao ctdh");
		ChiTietDonHangDAO ctdhDAO = new ChiTietDonHangDAOImpl();
		List<ChiTietDonHang> listCTDH = ctdhDAO.getAll();
		request.setAttribute("listCTDH", listCTDH);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/chi-tiet-don-hang.jsp");
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
