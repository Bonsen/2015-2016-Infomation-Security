package login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by bonsen on 15/7/29.
 */
public class UpdatePersonalInfo extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 response.setContentType("text/html;charset=utf-8");
         	String path =request.getContextPath();
        String memail = new String(request.getParameter("memail").getBytes(
                "iso-8859-1"), "utf8");
        String realname = new String(request.getParameter("realname").getBytes(
                "iso-8859-1"), "utf8");
        String gender = new String(request.getParameter("gender").getBytes(
                "iso-8859-1"), "utf8");
        String phonenumber = new String(request.getParameter("phonenumber").getBytes(
                "iso-8859-1"), "utf8");
        String ifopen = new String(request.getParameter("ifopen").getBytes(
                "iso-8859-1"), "utf8");
        String optionsRadios = new String(request.getParameter("optionsRadios").getBytes(
                "iso-8859-1"), "utf8");
        String username = new String(request.getParameter("username").getBytes(
                "iso-8859-1"), "utf8");
        System.out.println(username);
        try {
            UserDao userDAO = new UserDao();
            User user = new User();
            System.out.println("++++++");
            user.setRealname(realname);
            System.out.println(user.getRealname());
            
            user.setGender(gender);
            System.out.println(user.getGender());
            user.setPhone(phonenumber);
            System.out.println(user.getPhone());
            user.setOpenfea(ifopen);
            System.out.println(user.getOpenfea());
            user.setMopen(optionsRadios);
            System.out.println(user.getMopen());
            user.setEmail(memail);
            System.out.println(user.getEmail());
            user.setUsername(username);
            System.out.println(user.getUsername());
            userDAO.update(user);
            System.out.println("++++++");
            request.getSession().setAttribute("updatesuccess", "true");
            response.sendRedirect(path+"/main.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
