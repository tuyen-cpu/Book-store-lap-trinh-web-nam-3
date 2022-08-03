package tuyen.websach.controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.DanhMucDAO;
import tuyen.websach.dao.impl.DanhMucDAOImpl;
import tuyen.websach.model.DanhMuc;

/**
 * Servlet implementation class ThemDanhMucAdmin
 */
@WebServlet("/admin/danhmuc/add")
public class ThemDanhMucAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ThemDanhMucAdmin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/them-danh-muc.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String madanhmuc = request.getParameter("ma-danh-muc");
		String tendanhmuc = request.getParameter("ten-danh-muc");
		DanhMucDAO danhMucDAO = new DanhMucDAOImpl();
		if (danhMucDAO.checkDanhMuc(madanhmuc)) {
			request.setAttribute("danhmucdatontai", "Danh mục đã tồn tại!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/them-danh-muc.jsp");
			dispatcher.forward(request, response);
		} else {
			DanhMuc dm = new DanhMuc(madanhmuc, tendanhmuc);
			danhMucDAO.insert(dm);
			request.setAttribute("danhmucdatontai", "Danh mục đã tồn tại!");
			response.sendRedirect(request.getContextPath() + "/admin/danhmuc");
		}
	}

}
