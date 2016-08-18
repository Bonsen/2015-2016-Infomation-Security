package authen.crypt;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyFactory;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.RSAPrivateKeySpec;
import java.security.spec.RSAPublicKeySpec;
import java.util.HashMap;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;

import org.json.JSONException;
import org.json.JSONObject;
/**
 * RSA�����㷨
 * 
 * @author Ethan Wei
 * @version 1.0
 * @date 2015/1/15
 */
public class RSA {

	private static final String ALGORITHM = "RSA";
	public static final String PUBLIC_KEY = "RSAPublicKey";
	public static final String PRIVATE_KEY = "RSAPrivateKey";
	public static final int PUBKEY = 0;
	public static final int PRIKEY = 1;
	public static final String MODULUS = "modulus";
	public static final String EXPONENT = "exponent";

	private static final int KEY_LEN = 1024;
	private static final int MAX_ENCRYPT_BLOCK = KEY_LEN / 8 - 11;
	private static final int MAX_DECRYPT_BLOCK = KEY_LEN / 8;

	/**
	 * ��ɹ�Կ��˽Կ
	 * 
	 * @return ��Կ��
	 */
	public static HashMap<String, Object> genKeyPair() {
		HashMap<String, Object> map = new HashMap<String, Object>();

		KeyPairGenerator keyPairGen = null;// ���ʵ��ָ���㷨�� KeyPairGenerator ����
		try {
			keyPairGen = KeyPairGenerator.getInstance("RSA");
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}

		keyPairGen.initialize(KEY_LEN);// ��ʼ��ȷ����Կ��С����Կ�������

		KeyPair keyPair = keyPairGen.generateKeyPair();// ���һ����Կ��

		RSAPublicKey publicKey = (RSAPublicKey) keyPair.getPublic();// ���ضԴ���Կ�ԵĹ�Կ���������

		RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.getPrivate();// ���ضԴ���Կ�Ե�˽Կ���������

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
		String modulus = null;
		String exponent = null;
		switch (type) {
		case PUBKEY:
			RSAPublicKey publicKey = (RSAPublicKey) keyPair.get(PUBLIC_KEY);
			modulus = publicKey.getModulus().toString();
			exponent = publicKey.getPublicExponent().toString();
			break;
		case PRIKEY:
			RSAPrivateKey privateKey = (RSAPrivateKey) keyPair.get(PRIVATE_KEY);
			modulus = privateKey.getModulus().toString();
			exponent = privateKey.getPrivateExponent().toString();
		default:
			break;
		}
		if (modulus == null || exponent == null) {
			result = null;
		} else {
			try {
				result.put(MODULUS, modulus);
				result.put(EXPONENT, exponent);
			} catch (JSONException e) {
				e.printStackTrace();
			}

		}
		return result;
	}

	/**
	 * ��JSONObject�����л��RSA��Կ
	 * 
	 * @param keyObject
	 * @return
	 */
	public static RSAPublicKey getPublicKey(JSONObject keyObject) {
		try {
			String modulus = keyObject.getString(MODULUS);
			String exponent = keyObject.getString(EXPONENT);
			BigInteger b1 = new BigInteger(modulus);
			BigInteger b2 = new BigInteger(exponent);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			RSAPublicKeySpec keySpec = new RSAPublicKeySpec(b1, b2);
			return (RSAPublicKey) keyFactory.generatePublic(keySpec);
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
	 * ��JSONObject������RSA˽Կ
	 * 
	 * @param keyObject
	 * @return
	 */
	public static RSAPrivateKey getPrivateKey(JSONObject keyObject) {
		try {
			String modulus = keyObject.getString(MODULUS);
			String exponent = keyObject.getString(EXPONENT);
			BigInteger b1 = new BigInteger(modulus);
			BigInteger b2 = new BigInteger(exponent);
			KeyFactory keyFactory = KeyFactory.getInstance("RSA");
			RSAPrivateKeySpec keySpec = new RSAPrivateKeySpec(b1, b2);
			return (RSAPrivateKey) keyFactory.generatePrivate(keySpec);
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (InvalidKeySpecException e) {
			e.printStackTrace();
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * ��Կ����
	 * 
	 * @param data
	 *            ��Ҫ���ܵ����ݣ�����Ϊ�ֽ�����
	 * @param publicKey
	 *            RSA��Կ
	 * @return ���ܺ������
	 */
	public static byte[] encrypt(byte[] data, RSAPublicKey publicKey) {
		try {
			Cipher cipher = Cipher.getInstance(ALGORITHM);
			cipher.init(Cipher.ENCRYPT_MODE, publicKey);
			int inputLen = data.length;
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			int offset = 0;
			byte[] cache;
			int i = 0;
			while (inputLen - offset > 0) {
				if (inputLen - offset > MAX_ENCRYPT_BLOCK) {
					cache = cipher.doFinal(data, offset, MAX_ENCRYPT_BLOCK);
				} else {
					cache = cipher.doFinal(data, offset, inputLen - offset);
				}
				out.write(cache, 0, cache.length);
				i++;
				offset = i * MAX_ENCRYPT_BLOCK;
			}
			byte[] encryptedData = out.toByteArray();
			out.close();
			return encryptedData;
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * ˽Կ����
	 * 
	 * @param encryptedData
	 *            ��Ҫ���ܵ����ݣ�����Ϊ�ֽ�����
	 * @param privateKey
	 *            RSA˽Կ
	 * @return ���ܺ������
	 */
	public static byte[] decrypt(byte[] encryptedData, RSAPrivateKey privateKey) {
		try {
			Cipher cipher = Cipher.getInstance(ALGORITHM);
			cipher.init(Cipher.DECRYPT_MODE, privateKey);
			int inputLen = encryptedData.length;
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			int offset = 0;
			byte[] cache;
			int i = 0;
			while (inputLen - offset > 0) {
				if (inputLen - offset > MAX_DECRYPT_BLOCK) {
					cache = cipher.doFinal(encryptedData, offset,
							MAX_DECRYPT_BLOCK);
				} else {
					cache = cipher.doFinal(encryptedData, offset, inputLen
							- offset);
				}
				out.write(cache, 0, cache.length);
				i++;
				offset = i * MAX_DECRYPT_BLOCK;
			}
			byte[] decryptedData = out.toByteArray();
			out.close();
			return decryptedData;
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
}
