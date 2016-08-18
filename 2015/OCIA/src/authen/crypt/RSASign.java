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
			Signature signature = Signature.getInstance(ALGORITHM);// ����ʵ��ָ��ժҪ�㷨��Signature����
			signature.initSign(privateKey);// ��ʼ��������ǩ���Ķ���
			signature.update(data);// ʹ��ָ�����ֽ��������Ҫǩ������֤������
			return signature.sign();// ���������Ѹ������ݵ�ǩ���ֽ�
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
			Signature signature = Signature.getInstance(ALGORITHM);// ����ʵ��ָ��ժҪ�㷨��Signature����
			signature.initVerify(publicKey);// ��ʼ��������ǩ���Ķ���
			signature.update(data);// ���������Ѹ������ݵ�ǩ���ֽ�
			return signature.verify(sign);// ��֤�����ǩ��
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