package ocia.register;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

public class DataResponse extends HttpServlet {
	private DataService service;
	/**
	 * Constructor of the object.
	 */
	public DataResponse() {
		super();
	}

	/**
	 * The doGet method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 * 
	 * This method is called when a form has its tag value method equals to
	 * post.
	 * 
	 * @param request
	 *            the request send by the client to the server
	 * @param response
	 *            the response send by the server to the client
	 * @throws ServletException
	 *             if an error occurred
	 * @throws IOException
	 *             if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		try {
			String keyHandle,btAddr,userPubKeyStr;
			Map<String, Object> map = null;
			List<Object> params =new ArrayList<Object>();
			String username = request.getParameter("username");
			System.out.println("-username->>" + username);
			params.add(username);
			map = service.DataUser(1,params);
			System.out.println(map.get("serverPriKey").toString());

			String root12th = request.getParameter("root12th");
			JSONObject root12 = new JSONObject(root12th);
			System.out.println(root12th);

			System.out.println("root12:"+root12.getString("value"));
			out.print(DataHandle.handleRegisterResponseData(root12.getString("value"), map.get("serverPriKey").toString()));
			keyHandle=DataHandle.getkeyHandle();
			btAddr=DataHandle.getbtAddr();
			userPubKeyStr=DataHandle.getuserPubKeyStr();
			List<Object> params1 =new ArrayList<Object>();
			params1.add(userPubKeyStr);
			params1.add(keyHandle);
			params1.add(btAddr);
			params1.add(username);
			service.DataUser(2,params1);
			//boolean flag= service.DataUser(params);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		out.flush();
		out.close();
	}
	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		service = new DataDao();
	}
}
