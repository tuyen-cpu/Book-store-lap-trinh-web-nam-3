package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tuyen.websach.dao.KhachHangDAO;
import tuyen.websach.dao.impl.ChiTietDonHangDAOImpl;
import tuyen.websach.dao.impl.DonHangDAOImpl;
import tuyen.websach.dao.impl.KhachHangDAOImpl;
import tuyen.websach.model.Account;
import tuyen.websach.model.ChiTietDonHang;
import tuyen.websach.model.DonHang;
import tuyen.websach.model.GioHang;
import tuyen.websach.model.Item;
import tuyen.websach.model.KhachHang;

/**
 * Servlet implementation class ThanhToanController
 */
@WebServlet("/ThanhToan")
public class ThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       KhachHangDAO khDAO;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ThanhToanController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		Account acc = (Account) session.getAttribute("user");
		if(acc==null) {
			getServletContext().getRequestDispatcher("/view/client/dang-nhap.jsp").forward(request, response);
		}else {
			
			GioHang gh =(GioHang)session.getAttribute("gioHang");
			if(gh==null) {
				System.out.println("gio hàng k có nên ko vào thanh toan dc");
				response.sendRedirect(request.getContextPath() + "/TrangChu");
				return;
			}
			khDAO = new KhachHangDAOImpl();
			KhachHang kh = khDAO.search(acc.getUserName());
			System.out.println("Checkout:");
			System.out.println(kh.getHoTen());
			session.setAttribute("kh", kh);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/thanh-toan.jsp");
			dispatcher.forward(request, response);
		
	}}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
