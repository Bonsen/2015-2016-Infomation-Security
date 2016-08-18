package authen.keygen;

import java.security.interfaces.DSAPrivateKey;
import java.security.interfaces.DSAPublicKey;

import javax.crypto.SecretKey;

import authen.crypt.*;

public class MyTest {

	public static void main(String[] args) {
		String content = "Ethan魏sadgdgsdfasdfsafdadf";
		byte[] byteContent = content.getBytes();

		/* AES 加密算法 */

		String filePath = "mk.dat";

		SecretKey secretKey1 = FileIO.outMK(filePath);

		byte[] result = AES.encrypt(AES.EN_MODE, byteContent, secretKey1);

		SecretKey secretKey2 = FileIO.inMK(filePath);

		byte[] result2 = AES.encrypt(AES.DE_MODE, result, secretKey2);

		System.out.println("加密前：" + content);

		System.out.println("解密后：" + new String(result2));
		System.out.println();

		/* DSA 签名算法 */

		String pkFilePath = "pk.dat";
		String skFilePath = "sk.dat";

		FileIO.outKeyPair(pkFilePath, skFilePath);

		DSAPublicKey publicKey = FileIO.inPK(pkFilePath);
		DSAPrivateKey privateKey = FileIO.inSK(skFilePath);

		System.out.println("DSA公钥：" + publicKey.getY());

		byte[] s = DSA.sign(byteContent, privateKey);

		boolean v = DSA.verify(byteContent, publicKey, s);

		System.out.println("验证结果：" + v);
		System.out.println();

		/* MD5摘要算法 */
		byte[] digest = MD5.getDigest(byteContent);
		System.out.println("摘要长度：" + digest.length + " bytes");
	}

}
