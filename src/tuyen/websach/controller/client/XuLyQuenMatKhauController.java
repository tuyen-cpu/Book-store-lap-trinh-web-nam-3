package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.AccountDAO;
import tuyen.websach.dao.impl.AccountDAOImpl;
import tuyen.websach.dao.impl.KhachHangDAOImpl;
import tuyen.websach.model.Account;
import tuyen.websach.model.KhachHang;
import tuyen.websach.sendmail.SendMail;

/**
 * Servlet implementation class XuLyQuenMatKhauController
 */
@WebServlet("/XuLyQuenMatKhau")
public class XuLyQuenMatKhauController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyQuenMatKhauController() {
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

		String email = request.getParameter("email");
		KhachHangDAOImpl khDAO = new KhachHangDAOImpl();
		AccountDAO accDAO = new AccountDAOImpl();
		if (!khDAO.kiemTraEmail(email)) {
			request.setAttribute("trangthaiquenmatkhau", "Email chưa được đăng ký");
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/client/forgot-password.jsp");
			dispatcher.forward(request, response);
		} else {
			KhachHang kh = khDAO.getKhachHang(email);
			SendMail send = new SendMail();
			String matKhauMoi = send.getRandom();
			send.sendMail(email, "Mật khẩu mới", "Mật khẩu mới của bạn là: " + matKhauMoi);
			accDAO.doiMatKhau(kh.getUserName(), matKhauMoi);
			request.setAttribute("trangthaiquenmatkhau", "Mật khẩu của bạn đã được gửi về Email"+ email);
			RequestDispatcher dispatcher = request.getRequestDispatcher("view/client/forgot-password.jsp");
			dispatcher.forward(request, response);
		}
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
