package tuyen.websach.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.SachDAO;
import tuyen.websach.dao.impl.DanhMucDAOImpl;
import tuyen.websach.dao.impl.SachDAOImpl;
import tuyen.websach.model.DanhMuc;
import tuyen.websach.model.Sach;

/**
 * Servlet implementation class DanhSachSanPhamController
 */
@WebServlet("/DanhSachSach")
public class DanhSachSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DanhSachSachController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		request.setCharacterEncoding("UTF-8");
//		response.setCharacterEncoding("UTF-8");
//		String danhmuc = request.getParameter("danhmuc");
//		SachDAOImpl sachDAO = new SachDAOImpl();
//		List<Sach> listSachTheoChuDe=sachDAO.getSachDanhMuc(danhmuc);
//		getServletContext().setAttribute("listSachTheoChuDe", listSachTheoChuDe);
//		RequestDispatcher dispatcher = request.getRequestDispatcher("/view/client/shop.jsp");
//		dispatcher.forward(request, response);
//		

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		try {
			System.out.println("vào controller ds sach");

			String indexS = request.getParameter("index");
			String danhMuc = request.getParameter("danhmuc");
//			if((txtSearch==null||txtSearch.equals(""))&request.getAttribute("txtSearch").equals(null)) {
//				txtSearch="khsadigvebwudaeufaudfgsauds";
//			}
			int index;

			System.out.println("index " + indexS);
			System.out.println("danhMucSearh " + danhMuc);
			if (indexS == null) {
				index = 1;
			} else {
				index = Integer.parseInt(indexS);
			}
			if (danhMuc == null) {
				List<DanhMuc> listDanhMuc = (List<DanhMuc>) getServletContext().getAttribute("dsDanhMuc");
				danhMuc = listDanhMuc.get(0).getMaChuDe();
			}
			int count;
			SachDAO sachDAO = new SachDAOImpl();

			System.out.println("vao search theo danh muc");
			count = sachDAO.countSachDanhMuc(danhMuc);

			System.out.println("count" + count);
			int sizeTrang = 6;
			int trangCuoi = count / sizeTrang;
			if (count % sizeTrang != 0) {
				trangCuoi++;
			}
			List<Sach> listSachTheoChuDe = sachDAO.getSachChuDe(danhMuc, index, sizeTrang);

			System.out.println("Size listSach: " + listSachTheoChuDe.size());
			request.setAttribute("trangCuoi", trangCuoi);
			request.setAttribute("index", index);
			System.out.println("số trang" + trangCuoi);

			request.setAttribute("danhMuc", danhMuc);
			request.setAttribute("listSachTheoChuDe", listSachTheoChuDe);
			System.out.println("---------------------");
			request.getRequestDispatcher("/view/client/shop.jsp").forward(request, response);
		} catch (

		Exception e) {

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
