package com.webside.util.crypto;

import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.lang3.StringUtils;

/**
 * 
 * @ClassName AES
 * @Description AES加解密
 * 
 * - "AES"
 * - No KeyGenerator
 * - No IV 
 * - "ECB" instead of "CBC"
 *
 * @author wjggwm
 * @data 2016年9月18日 下午7:50:09
 */
public class AES {

	/*
	 * 加解密类型
	 */
    private static final String ALGORITHM = "AES";
    
    /*
     * token是32个字符的Hex编码。其实这个是一个UUID的16字节的byte数组的Hex表示形式
     */
    private static final String TOKEN = "629fd0d1a9504202862f27e970afcd2f";
    
    /*
     * 十六进制字符
     */
    public static final char[] HEXCHARS = { '0', '1', '2', '3', '4', '5', '6',
        '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f' };

    /**
     * 
     * @Description 加密
     * @param s	需要加密的字符串
     * @param token	加密token，16进制的hex格式，必须是32长度的字符串。如果token不合法，返回null
     * @return 加密后的字符串
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:20:31
     */
    public static String encryptBase64(String s, String token) throws Exception {
    	
        byte[] key = toBytes(StringUtils.isNotBlank(token) ? token : TOKEN);
        return encryptBase64URLSafe(s, key);
    }

    /**
     * 
     * @Description 解密
     * @param encrypted	已加密的字符串
     * @param token	加密token，16进制的hex格式，必须是32长度的字符串。如果token不合法，返回空串
     * @return	解密后的字符串
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:21:15
     */
    public static String decryptBase64(String encrypted, String token) throws Exception{
        byte[] key = toBytes(StringUtils.isNotBlank(token) ? token : TOKEN);
        return decryptBase64URLSafe(encrypted, key);
    }

    
    /**
     * 
     * @Description 加密
     * @param s	需要加密的字符串
     * @param token	加密token，16进制的hex格式，必须是32长度的字符串。如果token不合法，返回null
     * @return 加密后的字符串
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:20:31
     */
    public static String encrypt(String s, String token) throws Exception {
        byte[] key = toBytes(StringUtils.isNotBlank(token) ? token : TOKEN);
        byte[] encryptedBytes = encryptBytes(s, key);
        return asHex(encryptedBytes);
    }
    
    
    /**
     * 
     * @Description 解密
     * @param encrypted	已加密的字符串
     * @param token	加密token，16进制的hex格式，必须是32长度的字符串。如果token不合法，返回空串
     * @return	解密后的字符串
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:21:15
     */
    public static String decrypt(String encrypted, String token) throws Exception{
        byte[] key = toBytes(StringUtils.isNotBlank(token) ? token : TOKEN);
        byte[] encryptedBytes = toBytes(encrypted);
        String decrypted = decryptBytes(encryptedBytes,key);
        return decrypted;
    }
    
    
    /**
     * 
     * @Description TODO
     * @param s
     * @param key
     * @return
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:19:29
     */
    private static byte[] encryptBytes(String s, byte[] key) throws Exception{
        if (key == null) {
            return null;
        }
        // 判断Key是否为16位
        if (key.length != 16) {
            return null;
        }
        SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, skeySpec);
        byte[] encrypted = cipher.doFinal(s.getBytes("utf-8"));
        return encrypted;
    }

    
    /**
     * 
     * @Description TODO
     * @param encrypted
     * @param key
     * @return
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:19:23
     */
    private static String decryptBytes(byte[] encrypted, byte[] key) throws Exception{
      
        // 判断Key是否正确
        if (key == null) {
            return null;
        }
        // 判断Key是否为16位
        if (key.length != 16) {
            return null;
        }
        SecretKeySpec skeySpec = new SecretKeySpec(key, "AES");
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, skeySpec);
        
        byte[] original = cipher.doFinal(encrypted);
        String originalString = new String(original, "utf-8");
        return originalString;

    }

    /**
     * 
     * @Description TODO
     * @param s
     * @param key
     * @return
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:19:05
     */
    private static String encryptBase64URLSafe(String s, byte[] key) throws Exception{
        byte[] encryptedBytes = encryptBytes(s, key);
        return Base64.getUrlEncoder().withoutPadding().encodeToString(encryptedBytes);
    }

    /**
     * 
     * @Description TODO
     * @param encrypted
     * @param key
     * @return
     * @throws Exception
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:18:59
     */
    private static String decryptBase64URLSafe(String encrypted, byte[] key) throws Exception {
        byte[] encryptedBytes = Base64.getUrlDecoder().decode(encrypted);
        String decrypted = decryptBytes(encryptedBytes,key);
        return decrypted;
    }
    
    /**
     * 
     * @Description String转换为byte数组
     * @param s
     * @return
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:18:01
     */
    public static byte[] toBytes(String s) {
        int len = s.length();
        byte[] data = new byte[len / 2];
        for (int i = 0; i < len; i += 2) {
            data[i / 2] = (byte) ((Character.digit(s.charAt(i), 16) << 4)
                    + Character.digit(s.charAt(i + 1), 16));
        }
        return data;
    }
    
    /**
     * 
     * @Description TODO
     * @param bytes
     * @return
     *
     * @author wjggwm
     * @data 2016年11月9日 上午10:18:26
     */
    public static String asHex(byte[] bytes) {
        char chars[] = new char[bytes.length * 2];
        for (int i = 0; i < chars.length; i = i + 2) {
            byte b = bytes[i / 2];
            chars[i] = HEXCHARS[(b >>> 0x4) & 0xf];
            chars[i + 1] = HEXCHARS[b & 0xf];
        }
        return new String(chars);
    }
    
    
}
