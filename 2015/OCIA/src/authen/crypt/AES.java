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
 * AES加密算法
 * 
 * @author Ethan Wei
 * @version 1.0
 * @date 2015/1/13
 */
public class AES {

	private static final String ALGORITHM = "AES";
	private static final String AESKEY = "AESKey";
	/**
	 * 两种模式：EN_MODE---加密，DE_MODE---解密
	 */
	public static final int EN_MODE = Cipher.ENCRYPT_MODE;
	public static final int DE_MODE = Cipher.DECRYPT_MODE;

	/**
	 * 生成秘钥
	 * 
	 * @return
	 */
	public static SecretKey genKey() {
		SecretKey AESKey = null;
		try {
			KeyGenerator kgen = KeyGenerator.getInstance(ALGORITHM);// 获取生成指定算法的秘密密钥的KeyGenerator对象

			kgen.init(128, new SecureRandom(GenChallenge.getChallenge(24)));// 用指定参数集和用户提供的随机源初始化此密钥生成器

			AESKey = kgen.generateKey(); // 生成一个密钥

		} catch (NoSuchAlgorithmException e) {
			AESKey = null;
		}
		return AESKey;
	}

	/**
	 * 將AESKey转换为JSONObject对象
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
	 * 从JSONObject获得AESKey
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
	 * 加密和解密为一个方法，区别在于模式的设置
	 * 
	 * @param mode
	 *            算法模式，只有EN_MODE和DE_MODE两种，分别为加密和解密
	 * @param content
	 *            需要加密或解密的内容，类型为字节数组
	 * @param secretKey
	 *            密钥，类型SecretKey
	 * @return 加密或解密后的内容，类型为字节数组
	 */
	public static byte[] encrypt(int mode, byte[] content, SecretKey secretKey) {
		try {
			byte[] enCodeFormat = secretKey.getEncoded();// 返回基本编码格式的密钥

			SecretKeySpec key = new SecretKeySpec(enCodeFormat, 0, 16,
					ALGORITHM);// 根据给定的字节数组构造一个密钥

			Cipher cipher = Cipher.getInstance(ALGORITHM);// 生成一个实现指定转换Cipher对象

			cipher.init(mode, key);// 用密钥初始化此 cipher

			byte[] result = cipher.doFinal(content);// 解密

			return result;// 返回结果为字节数组
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
