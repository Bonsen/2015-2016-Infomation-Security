package ocia.login;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by bonsen on 15/7/20.
 */
public class DataResponseL extends HttpServlet {
    private DataService service;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Map<String, Object> map = null;
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = response.getWriter();
        request.getSession().setAttribute("ocia", "phone");
        String username = request.getParameter("username");
        String msg = request.getParameter("msg");
        List<Object> params = new ArrayList<Object>();
        System.out.println("-username->>" + username);
        params.add(username);
            map = service.login(params);
            String serverPriKey=map.get("serverPriKey").toString();
            String userPubKey=map.get("userPubKey").toString();

            String root16th = request.getParameter("root16th");
            try{
                JSONObject root16 = new JSONObject(root16th);
                System.out.println(root16th);
                out.print(DataHandle.handleSignResponseData(root16.getString("value"), serverPriKey, userPubKey));
                request.getSession().setAttribute("username",username);
            }catch(Exception e){
                e.printStackTrace();
            }
        }



    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }

    public void init() throws ServletException {
        // Put your code here
        service = new DataDao();
    }
}
