package authen.crypt;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.Signature;
import java.security.SignatureException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;

public class RSASign {

	private static final String ALGORITHM = "MD5withRSA";

	public static byte[] sign(byte[] data, RSAPrivateKey privateKey) {
		try {
			Signature signature = Signature.getInstance(ALGORITHM);// 生成实现指定摘要算法的Signature对象
			signature.initSign(privateKey);// 初始化此用于签名的对象
			signature.update(data);// 使用指定的字节数组更新要签名或验证的数据
			return signature.sign();// 返回所有已更新数据的签名字节
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvalidKeyException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SignatureException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static boolean verify(byte[] data, RSAPublicKey publicKey,
			byte[] sign) {
		try {
			Signature signature = Signature.getInstance(ALGORITHM);// 生成实现指定摘要算法的Signature对象
			signature.initVerify(publicKey);// 初始化此用于签名的对象
			signature.update(data);// 返回所有已更新数据的签名字节
			return signature.verify(sign);// 验证传入的签名
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