package authen.crypt;
import org.apache.commons.codec.binary.Base64;

/**
 * 
 * @author Ethan
 * @version 1.0
 * @date 2015/5/8
 */
public class Base64Unit {

	public static byte[] Encrypt(byte[] key) {
		return Base64.encodeBase64(key);
	}

	public static String EncryptEx(byte[] key) {
		return new String(Encrypt(key));
	}

	public static byte[] Decrypt(byte[] key) {
		return Base64.decodeBase64(key);
	}

	public static byte[] DecryptEx(String key) {
		return Decrypt(key.getBytes());
	}
}
