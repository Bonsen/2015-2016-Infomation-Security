package authen.crypt;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * MD5摘要算法
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
			messageDigest = MessageDigest.getInstance(ALGORITHM);// 获得实现指定摘要算法的MessageDigest对象。
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return messageDigest.digest(info); // 使用指定的 byte 数组对摘要进行最后更新，然后完成摘要计算
	}
}
