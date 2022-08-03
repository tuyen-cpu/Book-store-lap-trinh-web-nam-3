package tuyen.websach.controller.admin;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class DanhMucController
 */
@WebServlet("/admin/danhmuc")
public class DanhMucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DanhMucController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		DanhMucDAO danhMucDAO = new DanhMucDAOImpl();
		List<DanhMuc> listDanhMuc = danhMucDAO.getDanhMuc();
		request.setAttribute("listDanhMuc", listDanhMuc);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/admin/danh-muc.jsp");
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
