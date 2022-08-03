package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tuyen.websach.dao.impl.SachDAOImpl;
import tuyen.websach.model.GioHang;
import tuyen.websach.model.Item;
import tuyen.websach.model.Sach;

/**
 * Servlet implementation class ThemGioHang
 */
@WebServlet("/ThemGioHang")
public class ThemGioHangController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThemGioHangController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String maSach = request.getParameter("Add");
		Sach sach = new SachDAOImpl().getSach(Integer.parseInt(maSach));

			HttpSession session =request.getSession();
			GioHang gio = (GioHang) session.getAttribute("gioHang");
			if(gio==null) {
				gio= new GioHang();
	
		}
			gio.themSanPham(maSach, sach);
			session.setAttribute("gioHang", gio);
			System.out.println(gio.getGioHang().size());
			RequestDispatcher dispatcher = request.getRequestDispatcher("/DanhSachSach");
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
