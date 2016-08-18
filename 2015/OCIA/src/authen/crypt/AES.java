package authen.crypt;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;


/**
 * AES�����㷨
 * 
 * @author Ethan Wei
 * @version 1.0
 * @date 2015/1/13
 */
public class AES {

	private static final String ALGORITHM = "AES";
	private static final String AESKEY = "AESKey";
	/**
	 * ����ģʽ��EN_MODE---���ܣ�DE_MODE---����
	 */
	public static final int EN_MODE = Cipher.ENCRYPT_MODE;
	public static final int DE_MODE = Cipher.DECRYPT_MODE;

	/**
	 * ������Կ
	 * 
	 * @return
	 */
	public static SecretKey genKey() {
		SecretKey AESKey = null;
		try {
			KeyGenerator kgen = KeyGenerator.getInstance(ALGORITHM);// ��ȡ����ָ���㷨��������Կ��KeyGenerator����

			kgen.init(128, new SecureRandom(GenChallenge.getChallenge(24)));// ��ָ�����������û��ṩ�����Դ��ʼ������Կ������

			AESKey = kgen.generateKey(); // ����һ����Կ

		} catch (NoSuchAlgorithmException e) {
			AESKey = null;
		}
		return AESKey;
	}

	/**
	 * ��AESKeyת��ΪJSONObject����
	 * 
	 * @param AESKey
	 * @return
	 */
	public static JSONObject getKeyObject(SecretKey AESKey) {
		JSONObject result = new JSONObject();
		try {
			result.put(AESKEY, AESKey);
		} catch (JSONException e) {
			result = null;
		}
		return result;
	}

	/**
	 * ��JSONObject���AESKey
	 * 
	 * @param keyObject
	 * @return
	 */
	public static SecretKey getKey(JSONObject keyObject) {
		SecretKey AESKey;
		try {
			AESKey = (SecretKey) keyObject.get(AESKEY);
		} catch (JSONException e) {
			AESKey = null;
		}
		return AESKey;
	}

	/**
	 * ���ܺͽ���Ϊһ����������������ģʽ������
	 * 
	 * @param mode
	 *            �㷨ģʽ��ֻ��EN_MODE��DE_MODE���֣��ֱ�Ϊ���ܺͽ���
	 * @param content
	 *            ��Ҫ���ܻ���ܵ����ݣ�����Ϊ�ֽ�����
	 * @param secretKey
	 *            ��Կ������SecretKey
	 * @return ���ܻ���ܺ�����ݣ�����Ϊ�ֽ�����
	 */
	public static byte[] encrypt(int mode, byte[] content, SecretKey secretKey) {
		try {
			byte[] enCodeFormat = secretKey.getEncoded();// ���ػ��������ʽ����Կ

			SecretKeySpec key = new SecretKeySpec(enCodeFormat, 0, 16,
					ALGORITHM);// ���ݸ������ֽ����鹹��һ����Կ

			Cipher cipher = Cipher.getInstance(ALGORITHM);// ����һ��ʵ��ָ��ת��Cipher����

			cipher.init(mode, key);// ����Կ��ʼ���� cipher

			byte[] result = cipher.doFinal(content);// ����

			return result;// ���ؽ��Ϊ�ֽ�����
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		}
		return null;
	}
}
