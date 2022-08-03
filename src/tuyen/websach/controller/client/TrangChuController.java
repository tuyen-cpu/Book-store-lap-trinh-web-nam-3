package tuyen.websach.controller.client;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.DanhMucDAO;
import tuyen.websach.dao.SachDAO;
import tuyen.websach.dao.impl.DanhMucDAOImpl;
import tuyen.websach.dao.impl.SachDAOImpl;
import tuyen.websach.model.*;

/**
 * Servlet implementation class DanhMucController
 */
@WebServlet("/TrangChu")
public class TrangChuController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		SachDAO sachDAO = new SachDAOImpl();
		List<Sach> sachBanChay = sachDAO.getBanChay();
		request.setAttribute("sachBanChay", sachBanChay);
		DanhMucDAO danhMuc = new DanhMucDAOImpl();
		List<DanhMuc> danhSachDanhMuc = danhMuc.getDanhMuc();
		getServletContext().setAttribute("dsDanhMuc", danhSachDanhMuc);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
