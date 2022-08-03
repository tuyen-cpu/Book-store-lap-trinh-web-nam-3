package tuyen.websach.controller.admin;

import java.io.File;
import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import tuyen.websach.dao.DanhMucDAO;
import tuyen.websach.dao.SachDAO;
import tuyen.websach.dao.impl.SachDAOImpl;
import tuyen.websach.model.Sach;

/**
 * Servlet implementation class XuLyThemSachController
 */
@WebServlet("/admin/sach/actionAdd")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
		maxFileSize = 1024 * 1024 * 10, // 10MB
		maxRequestSize = 1024 * 1024 * 50)

public class XuLyThemSachController extends HttpServlet {
	DanhMucDAO danhMucDAO;
	SachDAO sachDAO;
	private static final long serialVersionUID = 1L;
	private static final String SAVE_DIR = "E:\\WorkSpaceJavaWeb\\WEB_BAN_SACH\\WebContent\\view\\client\\img\\products";

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public XuLyThemSachController() {
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
		
		String tenSach = request.getParameter("ten-sach");
		String chuDe = request.getParameter("chu-de");
		String giaBan = request.getParameter("gia-ban");
		String soLuong = request.getParameter("so-luong");
		String trangThai = request.getParameter("trang-thai");
		String giamGia = request.getParameter("giam-gia");
		String moTa = request.getParameter("mo-ta");
		String anh = null;
		System.out.println(tenSach);
		System.out.println(chuDe);
		System.out.println(giaBan);
		// creates the save directory if it does not exists
		/*
		 * String appPath =
		 * request.getServletContext().getRealPath("/view/client/img/products"); //
		 * constructs path of the directory to save uploaded file String savePath =
		 * appPath ;
		 */
		File fileSaveDir = new File(SAVE_DIR);
		System.out.println(fileSaveDir.getAbsolutePath());
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdir();
		}
		for (Part part : request.getParts()) {
			String fileName = extractFileName(part);

			if (!fileName.equals("")) {
				System.out.println(fileName);
				anh = fileName;
				part.write(SAVE_DIR + File.separator + fileName);
			}
		}
		
		Sach sach = new Sach();
		sach.setTenSach(tenSach);
		sach.setMaChuDe(chuDe);
		
		sach.setGiaBan(Float.parseFloat(giaBan));
		sach.setGiamGia(Float.parseFloat(giamGia));
		sach.setSoLuong(Integer.parseInt(soLuong));
		sach.setTrangThai(Boolean.parseBoolean(trangThai));
	
		sach.setMota(moTa);
		sach.setAnh(anh);
		SachDAO sachDao = new SachDAOImpl();
		if (sachDao.insert(sach)) {
			System.out.println("Them thanh cong");
		}else {
			request.setAttribute("loiAdd", "Khong them duoc sach");
		}
		response.sendRedirect(request.getContextPath() + "/admin/sach");
	}

	private String extractFileName(Part part) {
		
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for (String s : items) {
			if (s.trim().startsWith("filename")) {
				System.out.println(s + "nè");
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Checks if the form has 'enctype=multipart/form-data' attribute in it.

		doGet(request, response);
	}

}
