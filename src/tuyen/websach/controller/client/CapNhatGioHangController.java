package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tuyen.websach.model.GioHang;

/**
 * Servlet implementation class CapNhatGioHangController
 */
@WebServlet("/CapNhatGioHang")
public class CapNhatGioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CapNhatGioHangController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String soLuong[] = request.getParameterValues("soluonggiohang");

		HttpSession session = request.getSession();
		GioHang gh = (GioHang) session.getAttribute("gioHang");
		for (int i = 0; i < gh.getSize(); i++) {
			gh.getGioHang().get(i).setSoLuong(Integer.parseInt(soLuong[i]));
		}
		RequestDispatcher dispatcher = request.getRequestDispatcher("/GioHang");
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
