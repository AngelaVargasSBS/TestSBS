package com.sbs.prueba.util;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.Base64;

public class EncryptFactory {

    private static String ENCRYPT_KEY = "clave-compartida-no-reveloar-nunca";

    private static String encript(String text) throws Exception {

        String base64;
        Key aesKey = new SecretKeySpec(ENCRYPT_KEY.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.ENCRYPT_MODE, aesKey);
        byte[] encrypted = cipher.doFinal(text.getBytes());
        base64 = Base64.getEncoder().encodeToString(encrypted);
        return base64;
    }

    private static String decrypt(String encrypted) throws Exception {

        byte[] encryptedBytes = Base64.getDecoder().decode(encrypted.replace("\n", ""));
        Key aesKey = new SecretKeySpec(ENCRYPT_KEY.getBytes(), "AES");
        Cipher cipher = Cipher.getInstance("AES");
        cipher.init(Cipher.DECRYPT_MODE, aesKey);
        String decrypted = new String(cipher.doFinal(encryptedBytes));
        return decrypted;
    }

    public String encriptFactory(String text, String encryptKey) throws Exception {
        String base64;
        ENCRYPT_KEY = encryptKey;
        base64 = encript(text);
        return base64;
    }

    public String decryptFactory(String text, String encryptKey) throws Exception {

        String decryptedString;
        ENCRYPT_KEY = encryptKey;
        decryptedString = decrypt(text);
        return decryptedString;


    }
}
