package ocia.register;

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
	public static String serverPriKeyStr;
	public static String origin;
	public static String challenge;
	public DataRequest() {
		// TODO Auto-generated constructor stub

	}
	public static void main(String[] args) throws JSONException {
		System.out.println(genRegisterRequestData());
	}
	/**
	 * 服务器端生成注册阶段挑战消息
	 *
	 * @return
	 * @throws JSONException
	 */

	public static String getServerPkey() throws JSONException {

		return serverPriKeyStr;
	}
	public static String getorigin() throws JSONException {

		return origin;
	}
	public static String getchallenge() throws JSONException {

		return challenge;
	}

	public static JSONObject genRegisterRequestData() throws JSONException {
		/* 生成服务器公私钥对 */
		HashMap<String, Object> KeyPair = RSA.genKeyPair();
		JSONObject serverPubKeyObject = RSA.getKeyObject(KeyPair, RSA.PUBKEY);
		JSONObject serverPriKeyObject = RSA.getKeyObject(KeyPair, RSA.PRIKEY);

		/* 公钥转换为base64编码格式字符串 */
		String serverPubKeyStr = Base64Unit.EncryptEx(serverPubKeyObject
				.toString().getBytes());
		serverPriKeyStr = Base64Unit.EncryptEx(serverPriKeyObject
				.toString().getBytes());

		 System.out.println("serverPubKey (" + serverPubKeyStr.length()
		 + ") ---> " + serverPubKeyStr);
		 System.out.println("serverPriKey (" + serverPriKeyStr.length()
		 + ")---> " + serverPriKeyStr);

		/* 取得私钥 */
		RSAPrivateKey serverPriKey = RSA.getPrivateKey(serverPriKeyObject);

		/* 生成随机字节 */
		challenge = Base64Unit.EncryptEx(MD5.getDigest(GenChallenge
				.getChallenge(24)));// 之后会在其他函数用到

		/* 服务器地址 */
		origin = Base64Unit.EncryptEx(MD5.getDigest(ORIGIN.getBytes()));// 之后会在其他函数用到

		/* 使用服务器私钥serverPriKey签名 */
		String signature = Base64Unit.EncryptEx(RSASign.sign((origin
						+ challenge + serverPubKeyStr).getBytes(),
				serverPriKey));

		/* 组织挑战数据 */
		JSONObject DataToPhoneR = new JSONObject();
		DataToPhoneR.put("origin", origin);
		System.out.println(origin);
		DataToPhoneR.put("challenge", challenge);
		System.out.println(challenge);
		DataToPhoneR.put("serverPubKey", serverPubKeyStr);

		JSONObject RegisterRequestData = new JSONObject();
		RegisterRequestData.put("version", VERSION);
		RegisterRequestData.put("signature", signature);
		RegisterRequestData.put("DataToPhoneR", DataToPhoneR);
		JSONObject root = new JSONObject();
		root.put("type", 11);
		root.put("value", RegisterRequestData);

		System.out.println(root);

		return root;
	}

}
