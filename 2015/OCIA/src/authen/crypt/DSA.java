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
 * DSAǩ���㷨
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
	 * ���ɹ�Կ��˽Կ
	 * 
	 * @return ��Կ��
	 */
	public static HashMap<String, Object> genKeyPair() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		KeyPairGenerator keyPairGen = null;
		try {
			keyPairGen = KeyPairGenerator.getInstance(ALGORITHM);// ����ʵ��ָ���㷨��KeyPairGenerator����
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		keyPairGen.initialize(KEY_LEN);// ��ʼ��ȷ����Կ��С����Կ��������
		KeyPair keyPair = keyPairGen.generateKeyPair();// ����һ����Կ��
		DSAPublicKey publicKey = (DSAPublicKey) keyPair.getPublic();// ���ضԴ���Կ�ԵĹ�Կ���������
		DSAPrivateKey privateKey = (DSAPrivateKey) keyPair.getPrivate();// ���ضԴ���Կ�Ե�˽Կ���������

		map.put(PUBLIC_KEY, publicKey);
		map.put(PRIVATE_KEY, privateKey);
		return map;
	}

	/**
	 * ����Կת��ΪJSONObject����type�ж�˽Կ��Կ
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
	 * ��JSONObject�����л��DSA��Կ
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
	 * ��JSONObject������DSA˽Կ
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
	 * ˽Կǩ��
	 * 
	 * @param data
	 * @param privateKey
	 * @return
	 */
	public static byte[] sign(byte[] data, DSAPrivateKey privateKey) {
		try {
			Signature signature = Signature.getInstance(ALGORITHM);// ����ʵ��ָ��ժҪ�㷨��Signature����

			signature.initSign(privateKey);// ��ʼ��������ǩ���Ķ���

			signature.update(data);// ʹ��ָ�����ֽ��������Ҫǩ������֤������

			return signature.sign();// ���������Ѹ������ݵ�ǩ���ֽ�
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
			Signature signature = Signature.getInstance(ALGORITHM);// ����ʵ��ָ��ժҪ�㷨��Signature����

			signature.initVerify(publicKey);// ��ʼ��������ǩ���Ķ���

			signature.update(data);// ���������Ѹ������ݵ�ǩ���ֽ�

			return signature.verify(sign);// ��֤�����ǩ��
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
