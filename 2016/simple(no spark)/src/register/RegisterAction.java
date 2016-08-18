package register;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//���Ʋ� servlet
public class RegisterAction extends HttpServlet {

	private RegisterService service;

	/**
	 * Constructor of the object.
	 */
	public RegisterAction() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		boolean flag;
		Map<String, Object> map = null;
		String path = request.getContextPath();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String username = request.getParameter("username");
		String pswd = request.getParameter("pswd");

		List<Object> params = new ArrayList<Object>();
			System.out.println("-username->>" + username);
			System.out.println("-password->>" + pswd);
			params.add(username);
			params.add(pswd);
			try {
				flag = service.registerUser(params);
				if(flag){
					request.getSession().setAttribute("login",username);
				}else{
					out.print("error");
					System.out.print("error");
				}
			} catch (Exception e) {
				// TODO: handle exception
			} finally {
			}

		//request.getRequestDispatcher(path+"/servlet/DataResponse").forward(request,response);
		out.flush();
		out.close();
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		service = new RegisterDao();
	}

}
