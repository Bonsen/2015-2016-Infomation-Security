package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//锟斤拷锟斤拷锟斤拷锟角碉拷锟斤拷xml锟斤拷锟斤拷
public class MyFilter implements Filter {

	public MyFilter() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// 锟斤拷锟斤拷锟矫伙拷锟斤拷锟斤拷锟叫讹拷锟角凤拷锟铰�
//		HttpServletRequest httpServletRequest = (HttpServletRequest) request;
//		String path = httpServletRequest.getContextPath();
//		httpServletRequest.setCharacterEncoding("utf-8");
//		HttpServletResponse httpServletResponse = (HttpServletResponse) response;
//		httpServletResponse.setCharacterEncoding("utf-8");
//		String username =(String)httpServletRequest.getSession().getAttribute("username");
//		if (username==""||username==null) {
//			httpServletResponse.sendRedirect(path + "/index.jsp");
//		}
//		chain.doFilter(httpServletRequest, httpServletResponse);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
