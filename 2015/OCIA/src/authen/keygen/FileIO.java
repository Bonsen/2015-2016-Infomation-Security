package authen.keygen;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.security.SecureRandom;
import java.security.interfaces.DSAPrivateKey;
import java.security.interfaces.DSAPublicKey;
import java.util.HashMap;

import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;

import authen.crypt.DSA;

public class FileIO {

	public static SecretKey outMK(String filePath) {
		try {
			KeyGenerator kgen = KeyGenerator.getInstance("AES");
			kgen.init(128, new SecureRandom());
			SecretKey secretKey = kgen.generateKey();

			FileOutputStream fos = new FileOutputStream(filePath);
			ObjectOutputStream oos = new ObjectOutputStream(fos);
			oos.writeObject(secretKey);

			oos.close();
			return secretKey;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static SecretKey inMK(String filePath) {
		try {
			FileInputStream fin = new FileInputStream(filePath);
			ObjectInputStream ois = new ObjectInputStream(fin);
			SecretKey secretKey = (SecretKey) ois.readObject();
			ois.close();
			return secretKey;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void outKeyPair(String pkFilePath, String skFilePath) {
		HashMap<String, Object> map = DSA.genKeyPair();
		DSAPublicKey publicKey = (DSAPublicKey) map.get(DSA.PUBLIC_KEY);
		DSAPrivateKey privateKey = (DSAPrivateKey) map.get(DSA.PRIVATE_KEY);

		try {
			FileOutputStream fospk = new FileOutputStream(pkFilePath);
			FileOutputStream fossk = new FileOutputStream(skFilePath);
			ObjectOutputStream oospk = new ObjectOutputStream(fospk);
			ObjectOutputStream oossk = new ObjectOutputStream(fossk);
			oospk.writeObject(publicKey);
			oossk.writeObject(privateKey);

			oospk.close();
			oossk.close();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static DSAPublicKey inPK(String pkFilePath) {
		try {
			FileInputStream fis = new FileInputStream(pkFilePath);
			ObjectInputStream ois = new ObjectInputStream(fis);
			DSAPublicKey publicKey = (DSAPublicKey) ois.readObject();
			ois.close();
			return publicKey;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static DSAPrivateKey inSK(String skFilePath) {
		try {
			FileInputStream fis = new FileInputStream(skFilePath);
			ObjectInputStream ois = new ObjectInputStream(fis);
			DSAPrivateKey privateKey = (DSAPrivateKey) ois.readObject();
			ois.close();
			return privateKey;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
