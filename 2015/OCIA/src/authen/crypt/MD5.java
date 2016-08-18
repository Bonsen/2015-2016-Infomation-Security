package authen.crypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5ժҪ�㷨
 * 
 * @author Ethan Wei
 * @version 1.0
 * @date 2015/1/16
 *
 */
public class MD5 {

	private static final String ALGORITHM = "MD5";

	public static byte[] getDigest(byte[] info) {
		MessageDigest messageDigest = null;
		try {
			messageDigest = MessageDigest.getInstance(ALGORITHM);// ���ʵ��ָ��ժҪ�㷨��MessageDigest����
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return messageDigest.digest(info); // ʹ��ָ���� byte �����ժҪ���������£�Ȼ�����ժҪ����
	}
}
