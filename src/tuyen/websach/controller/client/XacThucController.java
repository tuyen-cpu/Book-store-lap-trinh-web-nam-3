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
 * Servlet implementation class XacThucController
 */
@WebServlet("/XacThuc")
public class XacThucController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XacThucController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		KhachHangDAOImpl khachHangDAO = new KhachHangDAOImpl();
		AccountDAO accountDAO = new AccountDAOImpl();
		String maxacthuc= request.getParameter("maxacthuc");
		
	if(maxacthuc.equals(session.getAttribute("maxacthuc"))) {
		accountDAO.insert((Account)session.getAttribute("taikhoan"));
		khachHangDAO.insert((KhachHang)session.getAttribute("khachhang"));
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/xac-thuc-thanh-cong.jsp");
		dispatcher.forward(request, response);
	}else {
		request.setAttribute("xacthucthatbai", "Mã xác nhận không hợp lệ");
		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/xac-thuc.jsp");
		dispatcher.forward(request, response);
	}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
