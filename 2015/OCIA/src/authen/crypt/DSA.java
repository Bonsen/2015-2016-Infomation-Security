package authen.crypt;

import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.Signature;
import java.security.SignatureException;
import java.security.interfaces.DSAPrivateKey;
import java.security.interfaces.DSAPublicKey;
import java.security.spec.DSAPrivateKeySpec;
import java.security.spec.DSAPublicKeySpec;
import java.security.spec.InvalidKeySpecException;
import java.util.HashMap;

import net.sf.json.JSONObject;

import net.sf.json.JSONException;

/**
 * DSA签名算法
 * 
 * @author Ethan Wei
 * @version 1.0
 * @date 2015/1/15
 */
public class DSA {

	private static final String ALGORITHM = "DSA";
	public static final String PUBLIC_KEY = "DSAPublicKey";
	public static final String PRIVATE_KEY = "DSAPrivateKey";
	private static final int KEY_LEN = 640;
	private static final String KEY_XY = "xy";
	private static final String KEY_P = "p";
	private static final String KEY_Q = "q";
	private static final String KEY_G = "g";
	public static final int PUBKEY = 0;
	public static final int PRIKEY = 1;

	/**
	 * 生成公钥和私钥
	 * 
	 * @return 密钥对
	 */
	public static HashMap<String, Object> genKeyPair() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		KeyPairGenerator keyPairGen = null;
		try {
			keyPairGen = KeyPairGenerator.getInstance(ALGORITHM);// 生成实现指定算法的KeyPairGenerator对象
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		keyPairGen.initialize(KEY_LEN);// 初始化确定密钥大小的密钥对生成器
		KeyPair keyPair = keyPairGen.generateKeyPair();// 生成一个密钥对
		DSAPublicKey publicKey = (DSAPublicKey) keyPair.getPublic();// 返回对此密钥对的公钥组件的引用
		DSAPrivateKey privateKey = (DSAPrivateKey) keyPair.getPrivate();// 返回对此密钥对的私钥组件的引用

		map.put(PUBLIC_KEY, publicKey);
		map.put(PRIVATE_KEY, privateKey);
		return map;
	}

	/**
	 * 将密钥转换为JSONObject对象，type判断私钥或公钥
	 * 
	 * @param keyPair
	 * @param type
	 * @return
	 */
	public static JSONObject getKeyObject(HashMap<String, Object> keyPair,
			int type) {
		JSONObject result = new JSONObject();

		String P = null;
		String Q = null;
		String G = null;
		String XY = null;
		switch (type) {
		case PUBKEY:
			DSAPublicKey publicKey = (DSAPublicKey) keyPair.get(PUBLIC_KEY);
			P = publicKey.getParams().getP().toString();
			Q = publicKey.getParams().getQ().toString();
			G = publicKey.getParams().getG().toString();
			XY = publicKey.getY().toString();
			break;
		case PRIKEY:
			DSAPrivateKey privateKey = (DSAPrivateKey) keyPair.get(PRIVATE_KEY);
			P = privateKey.getParams().getP().toString();
			Q = privateKey.getParams().getQ().toString();
			G = privateKey.getParams().getG().toString();
			XY = privateKey.getX().toString();
		default:
			break;
		}
		if (P == null || Q == null || G == null || XY == null) {
			result = null;
		} else {
			try {
				result.put(KEY_XY, XY);
				result.put(KEY_P, P);
				result.put(KEY_Q, Q);
				result.put(KEY_G, G);
			} catch (JSONException e) {
				result = null;
			}
		}
		return result;
	}

	/**
	 * 从JSONObject对象中获得DSA公钥
	 * 
	 * @param keyObject
	 * @return
	 */
	public static DSAPublicKey getPublicKey(JSONObject keyObject) {
		try {
			String y = keyObject.getString(KEY_XY);
			String p = keyObject.getString(KEY_P);
			String q = keyObject.getString(KEY_Q);
			String g = keyObject.getString(KEY_G);
			BigInteger b1 = new BigInteger(y);
			BigInteger b2 = new BigInteger(p);
			BigInteger b3 = new BigInteger(q);
			BigInteger b4 = new BigInteger(g);
			KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
			DSAPublicKeySpec keySpec = new DSAPublicKeySpec(b1, b2, b3, b4);
			return (DSAPublicKey) keyFactory.generatePublic(keySpec);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 从JSONObject对象中DSA私钥
	 * 
	 * @param keyObject
	 * @return
	 */
	public static DSAPrivateKey getPrivateKey(JSONObject keyObject) {
		try {
			String x = keyObject.getString(KEY_XY);
			String p = keyObject.getString(KEY_P);
			String q = keyObject.getString(KEY_Q);
			String g = keyObject.getString(KEY_G);
			BigInteger b1 = new BigInteger(x);
			BigInteger b2 = new BigInteger(p);
			BigInteger b3 = new BigInteger(q);
			BigInteger b4 = new BigInteger(g);
			KeyFactory keyFactory = KeyFactory.getInstance(ALGORITHM);
			DSAPrivateKeySpec keySpec = new DSAPrivateKeySpec(b1, b2, b3, b4);
			return (DSAPrivateKey) keyFactory.generatePrivate(keySpec);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 私钥签名
	 * 
	 * @param data
	 * @param privateKey
	 * @return
	 */
	public static byte[] sign(byte[] data, DSAPrivateKey privateKey) {
		try {
			Signature signature = Signature.getInstance(ALGORITHM);// 生成实现指定摘要算法的Signature对象

			signature.initSign(privateKey);// 初始化此用于签名的对象

			signature.update(data);// 使用指定的字节数组更新要签名或验证的数据

			return signature.sign();// 返回所有已更新数据的签名字节
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (SignatureException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static boolean verify(byte[] data, DSAPublicKey publicKey,
			byte[] sign) {
		try {
			Signature signature = Signature.getInstance(ALGORITHM);// 生成实现指定摘要算法的Signature对象

			signature.initVerify(publicKey);// 初始化此用于签名的对象

			signature.update(data);// 返回所有已更新数据的签名字节

			return signature.verify(sign);// 验证传入的签名
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (SignatureException e) {
			e.printStackTrace();
		}
		return false;

	}

}
