package login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import login.LoginDao;
import login.LoginService;
import ocia.login.DataRequest;
import ocia.login.SendMessage;


@SuppressWarnings("serial")
public class LoginAction extends HttpServlet {

	@SuppressWarnings("unused")
	private LoginService service;

	/**
	 * Constructor of the object.
	 */
	public LoginAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
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
//		String s1="",s2="",s3="",s4="",s5="",s6="",s7="",s8="",s9="",s10="",s11="";
		String path = request.getContextPath();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
//		String username = request.getParameter("username");
//		String pswd = request.getParameter("pswd");
//		username = new String(username.getBytes("ISO-8859-1"),"UTF-8");  //锟斤拷锟斤拷锟斤拷锟斤拷锟斤拷锟�
//		pswd = new String(pswd.getBytes("ISO-8859-1"),"UTF-8");
//		List<Object> params = new ArrayList<Object>();
//		params.add(username);
//		params.add(pswd);
//		boolean flag = service.login(params);
//		if (flag) {
//			out.print("true");
//			request.getSession().setAttribute("username", "Welcome back,"+username+".Let's start now!</br>Right user,wait to be confirmed...");
// 			byte[] bytes = null;
//			/* login.ticket */
//			/* AES 锟斤拷锟斤拷锟姐法 */
//			request.getSession().setAttribute("s1","AES begin...");
//			String filePath = "mk.dat";
//
//			SecretKey secretKey1 = FileIO.outMK(filePath);
//
//			Certanth_id certanth_id=new Certanth_id(secretKey1);
//
//			Generate_ticket generate_ticket;
//			try {
//				generate_ticket = new Generate_ticket(username,pswd);
//				generate_ticket.gettime();
//				bytes = ChangeBytes.ObjectToByte(generate_ticket);
//			} catch (NoSuchAlgorithmException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//			byte[] result1 = AES.encrypt(AES.EN_MODE, bytes, secretKey1);
//			request.getSession().setAttribute("s2","AES success!");
//			/* assertion.request */
//			request.getSession().setAttribute("s3","Assertion request...");
//			AssertionRequest temp=new AssertionRequest();
//
//			byte[] byte_assertion_request=ChangeBytes.ObjectToByte(temp);
//
//			byte[] result2 = AES.encrypt(AES.EN_MODE, byte_assertion_request,certanth_id.origin_protect_k);
//
//			/*锟斤拷锟杰ｏ拷锟斤拷锟斤拷Browser*/
//			request.getSession().setAttribute("s4","Browser get this result from the server...");
//			SecretKey secretKey2 = FileIO.inMK(filePath);
//
//			byte[] result11 = AES.encrypt(AES.DE_MODE, result1, secretKey2);
//			SecretKey secretKey3 = FileIO.inMK(filePath);
//
//			byte[] result22 = AES.encrypt(AES.DE_MODE, result2, secretKey3);
//
//			generate_ticket=(Generate_ticket)ChangeBytes.ByteToObject(result11);
//			temp=(AssertionRequest)ChangeBytes.ByteToObject(result22);
//
//
//			/*锟斤拷锟斤拷TLS_channel_ID匹锟斤拷晒锟斤拷幕锟�/
//
//			if(generate_ticket.TLS_channel_ID.equals(temp.TLS_channel_ID)){
//				request.getSession().setAttribute("s5","Two TLS_channel_ID is the same.");
//				request.getSession().setAttribute("s6","DSA begin...");
//				bytes = ChangeBytes.ObjectToByte(generate_ticket);
//				String pkFilePath = "pk.dat";
//				String skFilePath = "sk.dat";
//
//				FileIO.outKeyPair(pkFilePath, skFilePath);
//
//				DSAPublicKey publicKey = FileIO.inPK(pkFilePath);
//				DSAPrivateKey privateKey = FileIO.inSK(skFilePath);
//
//				System.out.println("DSA锟斤拷钥锟斤拷" + publicKey.getY());
//				request.getSession().setAttribute("s6","Get the publicKey of DSA...");
//				byte[] s = DSA.sign(bytes, privateKey);
//
//				boolean v = DSA.verify(bytes, publicKey, s);
//				request.getSession().setAttribute("s7","DSA verify...");
//				if(v==true){
//					request.getSession().setAttribute("s8","DSA success!");
//					request.getSession().setAttribute("s9","Confirm success!");
//				}
//				request.getSession().setAttribute("s10","");
//				request.getSession().setAttribute("s11","");
//
//			}
//			else{
//				request.getSession().setAttribute("s5","");
//				request.getSession().setAttribute("s6","");
//				request.getSession().setAttribute("s7","");
//				request.getSession().setAttribute("s8","");
//				request.getSession().setAttribute("s9","");
//				request.getSession().setAttribute("s10","DSA fails.");
//				request.getSession().setAttribute("s11","Confirm failure.Refuse!");
//			}
//			response.sendRedirect(path + "/main.jsp");
//        }
//        else{
//			request.getSession().setAttribute("s1","");
//			request.getSession().setAttribute("s2","");
//			request.getSession().setAttribute("s3","");
//			request.getSession().setAttribute("s4","");
//			request.getSession().setAttribute("s5","");
//			request.getSession().setAttribute("s6","");
//			request.getSession().setAttribute("s7","");
//			request.getSession().setAttribute("s8","");
//			request.getSession().setAttribute("s9","");
//			request.getSession().setAttribute("s10","");
//			request.getSession().setAttribute("s11","");
//			request.getSession().setAttribute("username","");
//        }

		boolean flag;
		Map<String, Object> map = null;
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String pswd = request.getParameter("pswd");

		List<Object> params = new ArrayList<Object>();
		List<Object> params1 = new ArrayList<Object>();
		System.out.println("-username->>" + username);
		System.out.println("-password->>" + pswd);
		params.add(username);
		params.add(pswd);
		map = service.login(1,params);
		if(!map.isEmpty()){
			request.getSession().setAttribute("login",username);
			
			if(map.get("openfea").equals("0")){
				request.getSession().setAttribute("noocia","yes");
				out.print("{\"type\":19}");
			}else{
				int type = 15;
				if(map.get("mopen").equals("2")){
					
					type = 21;
					try {
						SendMessage.StartSend(map.get("phone").toString());
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
				params1.add(username);
				map = service.login(2,params1);
				String serverPriKey=map.get("serverPriKey").toString();
				String userPubKey=map.get("userPubKey").toString();
				String keyHandle=map.get("keyHandle").toString();
				String btAddr=map.get("btAddr").toString();
				try{
					System.out.println("type--->"+type);
					out.print(DataRequest.genSignRequestData(serverPriKey,keyHandle,btAddr,type));
				}catch(Exception e){
					e.printStackTrace();
				}
			}
			
		}else{
			out.print("{\"type\": 20,\"value\": \"用户名或口令不正确!\"}");
		}

		//response.sendRedirect(path + "/index.jsp");

		//request.getRequestDispatcher(path+"/servlet/DataResponse").forward(request,response);
		out.flush();
		out.close();
	}

	/**
	 * Initialization of the servlet. <br>
	 * 
	 * @throws ServletException
	 *             if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		service = new LoginDao();
	}

}
