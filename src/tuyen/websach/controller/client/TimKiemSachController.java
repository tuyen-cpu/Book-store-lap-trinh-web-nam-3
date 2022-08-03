package tuyen.websach.controller.client;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tuyen.websach.dao.SachDAO;
import tuyen.websach.dao.impl.SachDAOImpl;
import tuyen.websach.model.Sach;

/**
 * Servlet implementation class TimKiemSachController
 */
@WebServlet("/TimKiem")
public class TimKiemSachController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TimKiemSachController() {
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
		try {
			System.out.println("vào controller search");
			String txtSearch = request.getParameter("txtSearch");
			String indexSearch = request.getParameter("index");
			String danhMucSearch = request.getParameter("danhMucSearch");
//			if((txtSearch==null||txtSearch.equals(""))&request.getAttribute("txtSearch").equals(null)) {
//				txtSearch="khsadigvebwudaeufaudfgsauds";
//			}
			int index;
			System.out.println("txtSearch "+txtSearch);
			System.out.println("indexSearch "+indexSearch);
			System.out.println("danhMucSearh "+danhMucSearch);
			if(indexSearch==null) {
				index=1;
						}else {
			 index = Integer.parseInt(indexSearch);}
			int count;
			SachDAO sachDAO = new SachDAOImpl();
			if (danhMucSearch.equals("0")) {
				System.out.println("vao search all");
				count = sachDAO.getTrangKhongDanhMuc(txtSearch);
			}else {
				System.out.println("vao search theo danh muc");
				count = sachDAO.getTrangCoDanhMuc(danhMucSearch, txtSearch);
			}

			System.out.println("count"+count);
			int sizeTrang = 6;
			int trangCuoi = count / sizeTrang;
			if (count % sizeTrang != 0) {
				trangCuoi++;
			}
			List<Sach> listSachSearch;
			if (danhMucSearch.equals("0")) {
				listSachSearch = sachDAO.getSearch(txtSearch, index, sizeTrang);
			}else {
				
				 listSachSearch = sachDAO.getSearch(txtSearch,danhMucSearch,index, sizeTrang);
			}
			
			System.out.println("Size listSachSearch: " + listSachSearch.size());
			request.setAttribute("trangCuoi", trangCuoi);
			request.setAttribute("index", index);
			System.out.println("số trang" + trangCuoi);
			request.setAttribute("txtSearch", txtSearch);
			request.setAttribute("danhMucSearch", danhMucSearch);
			request.setAttribute("listSachSearch", listSachSearch);
			System.out.println("---------------------");
			request.getRequestDispatcher("/view/client/tim-kiem.jsp").forward(request, response);
		}catch(

	Exception e)
	{

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
