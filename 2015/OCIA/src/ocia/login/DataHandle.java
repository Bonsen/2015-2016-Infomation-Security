package ocia.login;
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
 * Created by bonsen on 15/7/17.
 */
public class DataHandle {
    /**
     * 服务器处理
     *
     * @param msg
     * @return
     * @throws JSONException
     */
    public static JSONObject handleSignResponseData(String msg,String SERVERSK,String USERPK)
            throws JSONException {
        JSONObject result = new JSONObject();
		/* 使用服务器自己的私钥解密数据，注意此时的私钥只是演示需要，实际上是自己保存 */
        JSONObject serverPriKeyObject = new JSONObject(new String(
                Base64Unit.DecryptEx(SERVERSK)));
        RSAPrivateKey serverPriKey = RSA.getPrivateKey(serverPriKeyObject);

        JSONObject SignResponseData = new JSONObject(new String(RSA.decrypt(
                Base64Unit.DecryptEx(msg), serverPriKey)));

        System.out.println(SignResponseData.toString());

		/* 解析JSON数据 */
        String signature = SignResponseData.getString("signature");
        JSONObject DataToServerS = SignResponseData
                .getJSONObject("DataToServerS");

        String cnext = DataToServerS.getString("CNext");
        String C2 = DataToServerS.getString("C2");

		/* 使用用户公钥验证签名，注意此时的公钥只是演示需要，实际上是自己保存 */
        JSONObject userPubKeyObject = new JSONObject(new String(
                Base64Unit.DecryptEx(USERPK)));
        RSAPublicKey userPubKey = RSA.getPublicKey(userPubKeyObject);
        String origin = DataRequest.getorigin();
        String challenge = DataRequest.getchallenge();
        boolean v = RSASign.verify(
                (origin + challenge + cnext + C2).getBytes(), userPubKey,
                Base64Unit.DecryptEx(signature));

        if (v == true) {
			/* 计算 H(CNext) */
            String hCNext = Base64Unit.EncryptEx(MD5.getDigest(Base64Unit
                    .DecryptEx(cnext)));
            if (hCNext.equals(hCNext)) {
				/* 更新数据库 */

				/* 更新数据库 */
                String C3 = Base64Unit.EncryptEx(MD5.getDigest(Base64Unit
                        .DecryptEx(C2)));
                result.put("type", 17);
                result.put("value", C3);
            } else {
                result.put("type", 18);
                result.put("value", "error information");
            }
        }
        System.out.println(result);
        return result;
    }
}
