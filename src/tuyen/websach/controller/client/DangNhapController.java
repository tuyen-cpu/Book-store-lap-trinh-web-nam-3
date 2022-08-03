package tuyen.websach.controller.client;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tuyen.websach.dao.AccountDAO;
import tuyen.websach.dao.impl.AccountDAOImpl;
import tuyen.websach.dao.impl.KhachHangDAOImpl;
import tuyen.websach.model.Account;
import tuyen.websach.model.KhachHang;

/**
 * Servlet implementation class DangNhapController
 */
@WebServlet("/DangNhap")
public class DangNhapController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DangNhapController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/dang-nhap.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		System.out.println("Vao Dang Nhap");
		Account acc = (Account) session.getAttribute("user");
		if (acc != null) {
			request.setAttribute("dadangnhap", "Bạn đã đăng nhập.Vui lòng đăng xuất để tiếp tục đăng nhập!");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/dang-nhap.jsp");
			dispatcher.forward(request, response);
		} else {
			AccountDAO accountDAO = new AccountDAOImpl();
			String userName = request.getParameter("username");
			String passwd = request.getParameter("pass");
			System.out.println(userName);
			System.out.println(passwd);
			if (accountDAO.kiemTraUserName(userName)) {
				System.out.println("Vao kt tk");
				if (accountDAO.kiemTraMatKhau(userName, passwd)) {
					System.out.println("vao kt mk");
					Account ac = accountDAO.getAccount(userName);
					System.out.println(ac.getUserName());
					session.setAttribute("user", ac);
					if (ac.getQuyen() == 1) {
						System.out.println("Zô quyền 1");
						response.sendRedirect(request.getContextPath() + "/admin/home");
						return;
					}
					response.sendRedirect(request.getContextPath() + "/TrangChu");
					return;
				} else {
					System.out.println("sai mk");
					request.setAttribute("dangnhap", "Sai mật khẩu!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/dang-nhap.jsp");
					dispatcher.forward(request, response);
				}
			} else {
				System.out.println("sai tk");
				request.setAttribute("dangnhap", "Sai tên tài khoản!");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/dang-nhap.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}
