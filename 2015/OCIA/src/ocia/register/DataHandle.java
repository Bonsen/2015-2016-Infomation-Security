package ocia.register;
import org.json.JSONException;
import org.json.JSONObject;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

import authen.crypt.Base64Unit;
import authen.crypt.GenChallenge;
import authen.crypt.MD5;
import authen.crypt.RSA;
import authen.crypt.RSASign;
/**
 * Created by bonsen on 15/7/14.
 */
public class DataHandle {

    /**
     * 服务器处理注册阶段响应消息
     *
     * @param msg
     * @return
     * @throws JSONException
     */
    public  static String keyHandle,btAddr,userPubKeyStr;

    public static String getkeyHandle() throws JSONException {

        return keyHandle;
    }
    public static String getbtAddr() throws JSONException {

        return btAddr;
    }
    public static String getuserPubKeyStr() throws JSONException {

        return userPubKeyStr;
    }
    public  static JSONObject handleRegisterResponseData(String msg,String SERVERSK) {
        JSONObject result = new JSONObject();
        try {
            /* 使用服务器自己的私钥解密数据，注意此时的私钥只是演示需要，实际上是自己保存 */
            JSONObject serverPriKeyObject = new JSONObject(new String(
                    Base64Unit.DecryptEx(SERVERSK)));
            RSAPrivateKey serverPriKey = RSA.getPrivateKey(serverPriKeyObject);

System.out.println(new String(RSA.decrypt(Base64Unit.DecryptEx(msg), serverPriKey)));

            JSONObject RegisterResponseData = new JSONObject(new String(
                    RSA.decrypt(Base64Unit.DecryptEx(msg), serverPriKey)));

            System.out.println(RegisterResponseData.toString());

		/* 解析JSON数据 */
            String signature = RegisterResponseData.getString("signature");
            JSONObject DataToServerR = RegisterResponseData
                    .getJSONObject("DataToServerR");

            keyHandle = DataToServerR.getString("keyHandle");
            btAddr = DataToServerR.getString("btAddr");
            userPubKeyStr = DataToServerR.getString("userPubKey");

            String C2 = DataToServerR.getString("C2");
            JSONObject userPubKeyObject = new JSONObject(new String(
                    Base64Unit.DecryptEx(userPubKeyStr)));

		/* 使用用户公钥验证签名 */
            String origin = DataRequest.getorigin();// 临时的
            System.out.println(origin);
            String challenge = DataRequest.getchallenge();// 临时的
            System.out.println(challenge);
            RSAPublicKey userPubKey = RSA.getPublicKey(userPubKeyObject);
            boolean v = RSASign.verify(
                    (origin + challenge + userPubKeyStr + keyHandle
                            + btAddr + C2).getBytes(), userPubKey,
                    Base64Unit.DecryptEx(signature));

            if (v == true) {
			/* 验证通过，在数据库中保存用户数据 */
                //
                //
                //
			/* 验证通过，在数据库中保存用户数据 */
                result.put("type", 13);
            } else {
                result.put("type", 14);
                result.put("value", "error information");
            }
        }catch (Exception e) {
                // TODO: handle exception
                e.printStackTrace();
            } finally{
                //???????????
            }
        System.out.println(result);
        return result;
    }
}
