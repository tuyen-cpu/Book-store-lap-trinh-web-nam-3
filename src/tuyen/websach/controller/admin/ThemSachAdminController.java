package tuyen.websach.controller.admin;

import java.io.File;
import java.io.IOException;
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
import tuyen.websach.model.DanhMuc;
import tuyen.websach.model.Sach;

/**
 * Servlet implementation class ThemSachAdminController
 */
@WebServlet("/admin/sach/add")
public class ThemSachAdminController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	DanhMucDAO danhMucDAO;
	SachDAO sachDAO;
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemSachAdminController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		danhMucDAO = new DanhMucDAOImpl();
		List<DanhMuc> dsChuDe = danhMucDAO.getDanhMuc();
		request.setAttribute("dsChuDe", dsChuDe);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/them-sach.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
