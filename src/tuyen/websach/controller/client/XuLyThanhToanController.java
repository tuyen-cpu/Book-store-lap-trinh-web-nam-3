package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tuyen.websach.dao.ChiTietDonHangDAO;
import tuyen.websach.dao.impl.ChiTietDonHangDAOImpl;
import tuyen.websach.dao.impl.DonHangDAOImpl;
import tuyen.websach.model.ChiTietDonHang;
import tuyen.websach.model.DonHang;
import tuyen.websach.model.GioHang;
import tuyen.websach.model.Item;
import tuyen.websach.model.KhachHang;

/**
 * Servlet implementation class XuLyThanhToanController
 */
@WebServlet("/XuLyThanhToan")
public class XuLyThanhToanController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyThanhToanController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("Vao Thanh Toán");
		HttpSession session = request.getSession();
		KhachHang kh = (KhachHang) session.getAttribute("kh");
		System.out.println("Mã kh thanh toan: "+kh.getMaKH());
		GioHang gio = (GioHang) session.getAttribute("gioHang");
		DonHang dh = new DonHang();
		DonHangDAOImpl donhangImpl = new DonHangDAOImpl();
		dh.setMaKH(kh.getMaKH());
		donhangImpl.insert(dh);
		dh.setMaDonHang(donhangImpl.getMaDonHang());
		ChiTietDonHangDAOImpl ctdhImpl = new ChiTietDonHangDAOImpl();
		for (Item item : gio.getGioHang()) {
			ChiTietDonHang ctdh = new ChiTietDonHang();
			ctdh.setMaDonHang(dh.getMaDonHang());
			ctdh.setMaSach(item.getSach().getMaSach());
			ctdh.setSoLuong(item.getSoLuong());
			ctdh.setDonGia(item.getTongGia());
			ctdhImpl.insert(ctdh);
		}
		session.removeAttribute("gioHang");
		request.setAttribute("camon", "Đặt hàng thành công");
		RequestDispatcher dispatcher = request.getRequestDispatcher("view/client/thank.jsp");
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
