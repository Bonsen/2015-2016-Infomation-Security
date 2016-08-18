package ocia.login;


import authen.crypt.Base64Unit;
import authen.crypt.GenChallenge;
import authen.crypt.MD5;
import java.security.interfaces.RSAPrivateKey;
import java.util.HashMap;

import org.json.JSONException;
import org.json.JSONObject;

import authen.crypt.Base64Unit;
import authen.crypt.GenChallenge;
import authen.crypt.MD5;
import authen.crypt.RSA;
import authen.crypt.RSASign;

public class DataRequest {
	public static String ORIGIN = "https://www.shiguangtravel.com:8443/OCIA/";
	public static String VERSION = "OCIA_V1";
	public static String challenge ;
	public static String origin ;
	public DataRequest() {
		// TODO Auto-generated constructor stub
	}

	public static String getorigin() throws JSONException {

		return origin;
	}
	public static String getchallenge() throws JSONException {

		return challenge;
	}
	/**
	 * 鏈嶅姟鍣ㄧ敓鎴愯璇侀樁娈垫寫鎴樻暟鎹�
	 *
	 * @return
	 * @throws JSONException
	 */
	public static JSONObject genSignRequestData(String SERVERSK,String keyHandle,String btAddr,int mytype) throws JSONException {
		/* 鐢熸垚闅忔満瀛楄妭 */
		challenge = Base64Unit.EncryptEx(MD5.getDigest(GenChallenge
				.getChallenge(24)));// 涔嬪悗浼氬湪鍏朵粬鍑芥暟鐢ㄥ埌

		/* 鏈嶅姟鍣ㄥ湴鍧�*/
		origin = Base64Unit.EncryptEx(MD5.getDigest(ORIGIN.getBytes()));// 涔嬪悗浼氬湪鍏朵粬鍑芥暟鐢ㄥ埌

		JSONObject serverPriKeyObject = new JSONObject(new String(
				Base64Unit.DecryptEx(SERVERSK)));

		/* 浣跨敤鏈嶅姟鍣ㄧ閽ョ鍚�*/
		RSAPrivateKey serverPriKey = RSA.getPrivateKey(serverPriKeyObject);
		String signature = Base64Unit.EncryptEx(RSASign.sign((origin
				+ challenge + keyHandle).getBytes(), serverPriKey));

		/* 缁勭粐鎸戞垬鏁版嵁 */
		JSONObject DataToPhoneS = new JSONObject();
		DataToPhoneS.put("origin", origin);
		DataToPhoneS.put("challenge", challenge);
		DataToPhoneS.put("keyHandle", keyHandle);

		JSONObject SignRequestData = new JSONObject();
		SignRequestData.put("version", VERSION);
		SignRequestData.put("signature", signature);
		SignRequestData.put("btAddr", btAddr);
		SignRequestData.put("DataToPhoneS", DataToPhoneS);

		JSONObject root = new JSONObject();
		root.put("type",mytype);
		root.put("value", SignRequestData);

		return root;
	}

}
