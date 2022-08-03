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
import tuyen.websach.sendmail.SendMail;

/**
 * Servlet implementation class DangKyController
 */
@WebServlet("/DangKy")
public class DangKyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangKyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/dang-ky.jsp");
		dispatcher.forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		KhachHangDAOImpl khachHangDAO = new KhachHangDAOImpl();
		AccountDAO accountDAO = new AccountDAOImpl();
		String email=request.getParameter("email");
		String hoTen=request.getParameter("hoten");
		String passwd = request.getParameter("passwd");
		String userName = request.getParameter("username");
		
		if(!accountDAO.kiemTraUserName(userName)) {
			Account ac = new Account();
			ac.setUserName(userName);
			ac.setMatKhau(passwd);
			ac.setQuyen(0);
			ac.setTrangThai(true);
			
			KhachHang kh = new KhachHang();
			kh.setEmail(email);
			kh.setHoTen(hoTen);
			kh.setUserName(userName);
			
			session.setAttribute("khachhang", kh);
			session.setAttribute("taikhoan", ac);
			
			SendMail send = new SendMail();
			String maxacthuc=send.getRandom();
			
			send.sendMail(email, "Xác thực tài khoản", "Mã xác thực của bạn là: "+maxacthuc);
			session.setAttribute("maxacthuc", maxacthuc);
			
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/xac-thuc.jsp");
			dispatcher.forward(request, response);
		}else {
			request.setAttribute("trangThai", "TaiKhoanDaTonTai");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/dang-ky.jsp");
			dispatcher.forward(request, response);
		}
	}

}
