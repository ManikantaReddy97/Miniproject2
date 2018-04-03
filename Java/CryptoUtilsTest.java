package com.crypto;
 
import java.io.File;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
 
/**
 * A tester for the CryptoUtils class.
 * @author www.codejava.net
 *
 */
public class CryptoUtilsTest {
    public static void main(String[] args) {
    	String key = "Mary has one cat";
        File inputFile = new File("C:\\Development\\document.txt");
        File encryptedFile = new File("C:\\Development\\document.encrypted");
        File decryptedFile = new File("C:\\Development\\document.decrypted");
        
        int maxKeyLen;
		try {
			maxKeyLen = Cipher.getMaxAllowedKeyLength("AES");
			System.out.println("MaxAllowedKeyLength=[" + maxKeyLen + "].");
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
         
        try {
            CryptoUtils.encrypt(key, inputFile, encryptedFile);
            CryptoUtils.decrypt(key, encryptedFile, decryptedFile);
        } catch (CryptoException ex) {
            System.out.println(ex.getMessage());
            ex.printStackTrace();
        }
    }
}