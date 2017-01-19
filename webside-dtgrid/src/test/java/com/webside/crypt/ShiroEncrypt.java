/**
 * 
 */
package com.webside.crypt;

import org.apache.shiro.codec.Base64;
import org.apache.shiro.codec.Hex;
import org.junit.Test;

import com.webside.util.crypto.AES;

/**
 * @ClassName ShiroEncrypt
 * @Description TODO
 *
 * @author wjggwm
 * @data 2016年12月12日 下午2:25:42
 */
public class ShiroEncrypt {
	
	@Test
	public void aes()
	{
		byte[] aes;
		try {
			String token = "629fd0d1a9504202862f27e970afcd2f";
			aes = AES.encryptBytes("webside", token);
			String base = Base64.encodeToString(aes);
			System.out.println(Hex.encodeToString(aes));
			System.out.println(aes);
			System.out.println(base);
			System.out.println(AES.decryptBase64("GsHaWo4m1eNbE0kNSMULhg==", token));
		} catch (Exception e) {
			System.out.print(e.getMessage());
		}
		
	}

}
