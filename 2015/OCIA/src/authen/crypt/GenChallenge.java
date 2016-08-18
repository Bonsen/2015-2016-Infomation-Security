package authen.crypt;

import java.util.Random;

/**
 * 
 * @author Ethan
 * @version 1.0
 * @date 2015/5/8
 */
public class GenChallenge {
	public static byte[] getChallenge(int len) {
		byte[] bytes = new byte[256];
		for (int i = 0; i < 256; i++) {
			bytes[i] = (byte) i;
		}
		Random random = new Random();
		int size = 256;
		byte[] randBytes = new byte[len];
		while (--len >= 0) {
			int index = random.nextInt(size);
			randBytes[len] = bytes[index];
		}
		return randBytes;
	}
}
