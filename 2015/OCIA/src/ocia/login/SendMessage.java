package ocia.login;


import java.io.UnsupportedEncodingException;

import org.apache.commons.httpclient.Header;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;



public class SendMessage {

    public static void StartSend(String phone)throws Exception
    {

        Date dt=new Date();//如果不需要格式,可直接用dt,dt就是当前系统时间
        DateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");//设置显示格式
        String nowTime="";
        nowTime= df.format(dt);//用DateFormat的format()方法在dt中获取并以yyyy/MM/dd HH:mm:ss格式显示

        HttpClient client = new HttpClient();
        PostMethod post = new PostMethod("http://utf8.sms.webchinese.cn");
        post.addRequestHeader("Content-Type","application/x-www-form-urlencoded;charset=utf-8");//在头文件中设置转码
        NameValuePair[] data ={ new NameValuePair("Uid", "okmk741851"),new NameValuePair("Key", "1ff93cfd54174878ea23"),new NameValuePair("smsMob",phone),new NameValuePair("smsText","您的账号于"+nowTime+"登录网站，如非本人操作，请及时修改密码!")};
        post.setRequestBody(data);

        client.executeMethod(post);
        Header[] headers = post.getResponseHeaders();
        int statusCode = post.getStatusCode();
        System.out.println("statusCode:"+statusCode);
        for(Header h : headers)
        {
            System.out.println(h.toString());
        }
        String result = new String(post.getResponseBodyAsString().getBytes("gbk"));
        System.out.println(result); //打印返回消息状态


        post.releaseConnection();

    }

}