package com.crypto;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.security.InvalidKeyException;
import java.security.Key;
import java.security.NoSuchAlgorithmException;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.io.FileUtils;

/**
 * A utility class that encrypts or decrypts a file.
 * 
 * @author www.codejava.net
 *
 */
public class CryptoUtils {
	private static final String ALGORITHM = "AES";
	private static final String TRANSFORMATION = "AES";
	private static final String KEY = "Mary has one cat";

	public static void encrypt(String key, File inputFile, File outputFile) throws CryptoException {
		doCrypto(Cipher.ENCRYPT_MODE, key, inputFile, outputFile);
	}
	
	public static void encrypt(byte[] inputBytes, String fileName, String outDir) throws CryptoException {
		
		try {
			byte[] outputBytes = encrypt(inputBytes);
			File encryptedFile = new File(outDir+File.separator+fileName+".encrypted");
			FileUtils.writeByteArrayToFile(encryptedFile, outputBytes);

		} catch ( IOException ex) {
			throw new CryptoException("Error encrypting/decrypting file", ex);
		}
		
	}
	
	public static byte[] encrypt(byte[] inputBytes) throws CryptoException {
		
		try {
			final Cipher cipher = initialize(Cipher.ENCRYPT_MODE, KEY);
			
			byte[] outputBytes = cipher.doFinal(inputBytes);
			
			return outputBytes;

		} catch ( BadPaddingException
				| IllegalBlockSizeException ex) {
			throw new CryptoException("Error encrypting/decrypting file", ex);
		}
		
	}
	
	public static byte[] decrypt(final String filePath) throws CryptoException {
		
		try {
			
			byte[] inputBytes = FileUtils.readFileToByteArray(new File(filePath));
			
			return decrypt(inputBytes);

		} catch ( IOException ex) {
			throw new CryptoException("Error encrypting/decrypting file", ex);
		}	
	}
	
	public static byte[] decrypt(byte[] inputBytes) throws CryptoException {
		
		try {
			final Cipher cipher = initialize(Cipher.DECRYPT_MODE, KEY);
			
			byte[] outputBytes = cipher.doFinal(inputBytes);
			
			return outputBytes;

		} catch ( BadPaddingException
				| IllegalBlockSizeException ex) {
			throw new CryptoException("Error encrypting/decrypting file", ex);
		}	
	}

	public static void decrypt(String key, File inputFile, File outputFile) throws CryptoException {
		doCrypto(Cipher.DECRYPT_MODE, key, inputFile, outputFile);
	}
	
	private static Cipher initialize(final int cipherMode, final String key) throws CryptoException {
		try {
			Key secretKey = new SecretKeySpec(key.getBytes(), ALGORITHM);
			Cipher cipher = Cipher.getInstance(TRANSFORMATION);
			cipher.init(cipherMode, secretKey);

			return cipher;
		} catch (NoSuchPaddingException | NoSuchAlgorithmException | InvalidKeyException ex) {
			throw new CryptoException("Error encrypting/decrypting file", ex);
		}
	}

	private static void doCrypto(int cipherMode, String key, File inputFile, File outputFile) throws CryptoException {
		
		try(FileInputStream inputStream = new FileInputStream(inputFile);
				FileOutputStream outputStream = new FileOutputStream(outputFile)) {
			final Cipher cipher = initialize(cipherMode, key);
			
			byte[] inputBytes = new byte[(int) inputFile.length()];
			inputStream.read(inputBytes);

			byte[] outputBytes = cipher.doFinal(inputBytes);
			
			outputStream.write(outputBytes);

		} catch ( BadPaddingException
				| IllegalBlockSizeException | IOException ex) {
			throw new CryptoException("Error encrypting/decrypting file", ex);
		}
	}

	public static void encryptFile(String filePath, String fileName, String outDir) {
		File inputFile = new File(filePath+File.separator+fileName);
		File encryptedFile = new File(outDir+File.separator+fileName+".encrypted");

		try {
			CryptoUtils.encrypt(KEY, inputFile, encryptedFile);
//			CryptoUtils.decrypt(KEY, encryptedFile, decryptedFile);
		} catch (CryptoException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}

	public static void decryptFile(String filePath, String fileName, String outDir) {
		File encryptedFile = new File(outDir+File.separator+fileName+".encrypted");
		File decryptedFile = new File(outDir+File.separator+fileName+".decrypted");

		try {
//			CryptoUtils.encrypt(KEY, inputFile, encryptedFile);
			CryptoUtils.decrypt(KEY, encryptedFile, decryptedFile);
		} catch (CryptoException ex) {
			System.out.println(ex.getMessage());
			ex.printStackTrace();
		}
	}
}