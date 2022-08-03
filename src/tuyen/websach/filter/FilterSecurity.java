package tuyen.websach.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import tuyen.websach.model.Account;

@WebFilter("/admin/*")
public class FilterSecurity implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		HttpSession session = request.getSession();
//		String servletPath = request.getServletPath();
		Account acc = (Account) session.getAttribute("user");
//		if (servletPath.equals("/login")) {
//			chain.doFilter(request, response);
//			return;
//		}

		if (acc == null) {
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/client/dang-nhap.jsp");
			dispatcher.forward(request, response);
			return;
		}
		if (acc.getQuyen() == 1) {
			chain.doFilter(request, response);
			return;
		} else {
			RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/view/client/404.jsp");

			dispatcher.forward(request, response);
		}

	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub

	}

}
