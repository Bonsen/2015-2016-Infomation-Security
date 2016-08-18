package authen.keygen;

import java.security.interfaces.DSAPrivateKey;
import java.security.interfaces.DSAPublicKey;

import javax.crypto.SecretKey;

import authen.crypt.*;

public class MyTest {

	public static void main(String[] args) {
		String content = "Ethanκsadgdgsdfasdfsafdadf";
		byte[] byteContent = content.getBytes();

		/* AES �����㷨 */

		String filePath = "mk.dat";

		SecretKey secretKey1 = FileIO.outMK(filePath);

		byte[] result = AES.encrypt(AES.EN_MODE, byteContent, secretKey1);

		SecretKey secretKey2 = FileIO.inMK(filePath);

		byte[] result2 = AES.encrypt(AES.DE_MODE, result, secretKey2);

		System.out.println("����ǰ��" + content);

		System.out.println("���ܺ�" + new String(result2));
		System.out.println();

		/* DSA ǩ���㷨 */

		String pkFilePath = "pk.dat";
		String skFilePath = "sk.dat";

		FileIO.outKeyPair(pkFilePath, skFilePath);

		DSAPublicKey publicKey = FileIO.inPK(pkFilePath);
		DSAPrivateKey privateKey = FileIO.inSK(skFilePath);

		System.out.println("DSA��Կ��" + publicKey.getY());

		byte[] s = DSA.sign(byteContent, privateKey);

		boolean v = DSA.verify(byteContent, publicKey, s);

		System.out.println("��֤�����" + v);
		System.out.println();

		/* MD5ժҪ�㷨 */
		byte[] digest = MD5.getDigest(byteContent);
		System.out.println("ժҪ���ȣ�" + digest.length + " bytes");
	}

}
