/**
 * 
 */
package com.webside.util.crypto;

import static java.lang.Math.min;

import java.nio.ByteBuffer;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.security.SignatureException;
import java.util.Arrays;
import java.util.Base64;
import java.util.concurrent.ThreadLocalRandom;

import javax.crypto.Mac;
import javax.crypto.ShortBufferException;
import javax.crypto.spec.SecretKeySpec;

/**
 * @ClassName SHA1HMAC
 * @Description SHA1HMAC加解密
 *
 * @author wjggwm
 * @data 2016年11月10日 上午11:08:15
 */
public class SHA1HMAC {

	public static final String KEY_ALGORITHM = "HmacSHA1";
	/**
	 * The number of bytes required to represent a primitive {@code int} value
	 */
	public static final int BYTES = Integer.SIZE / Byte.SIZE;
	/**
	 * micros price unit 微分
	 */
	private static final int MICROS_PER_CURRENCY_UNIT = 1_000_000;
	/**
	 * Initialization vector size
	 */
	public static final int INITV_SIZE = 16;
	/**
	 * Initialization vector offset in the crypto package
	 */
	public static final int INITV_BASE = 0;
	/**
	 * Payload offset in the crypto package
	 */
	public static final int PAYLOAD_BASE = INITV_BASE + INITV_SIZE;
	/**
	 * Initialization payload size
	 */
	private static final int PAYLOAD_SIZE = 8;
	/**
	 * Integrity signature size
	 */
	public static final int SIGNATURE_SIZE = 4;
	/**
	 * Overhead (non-Payload data) total size
	 */
	public static final int OVERHEAD_SIZE = INITV_SIZE + SIGNATURE_SIZE;

	/**
	 * Timestamp subfield offset in the initialization vector.
	 */
	public static final int INITV_TIMESTAMP_OFFSET = 0;
	/**
	 * ServerId subfield offset in the initialization vector.
	 */
	public static final int INITV_SERVERID_OFFSET = 8;
	/**
	 * 
	 */
	private static final int COUNTER_PAGESIZE = 20;

	private static final int COUNTER_SECTIONS = 3 * 256 + 1;

	private static final ThreadLocalRandom fastRandom = ThreadLocalRandom.current();
	
	private static SecureRandom random = new SecureRandom();
	
	/**
	 * 
	 * @Description base64编码
	 * @param encryptPrice	待编码内容
	 * @param isUrlSafe	是否使用urlsafe的编码方式
	 * @return	编码后内容
	 *
	 * @author wjggwm
	 * @data 2016年11月29日 下午1:09:46
	 */
	public static String encodePrice(byte[] encryptPrice, boolean isUrlSafe) {
		if(isUrlSafe)
		{
			return Base64.getUrlEncoder().withoutPadding().encodeToString(encryptPrice);
		}else
		{
			return Base64.getEncoder().encodeToString(encryptPrice);
		}
	}


	/**
	 * 
	 * @Description base64解码
	 * @param priceCipher	待解码内容
	 * @param isUrlSafe	是否使用urlsafe的编码方式
	 * @return	解码后内容
	 *
	 * @author wjggwm
	 * @data 2016年11月29日 下午1:10:39
	 */
	public static byte[] decodePrice(String priceCipher, boolean isUrlSafe) {
		if(isUrlSafe)
		{
			return Base64.getUrlDecoder().decode(priceCipher);
		}else
		{
			return Base64.getDecoder().decode(priceCipher);
		}
		
	}
	
	/**
	 * 
	 * @Description google openrtb-doubleclick winnotice price decrypt
	 * @param priceCipher	待解密的价格
	 * @param ikey	ikey	完整性校验key
	 * @param ekey	ikey	价格加密key
	 * @return
	 *
	 * @author wjggwm
	 * @data 2016年11月29日 下午1:09:05
	 */
	public static byte[] encryptPrice(double price, String ikey, String ekey) {
		byte[] encryptPrice = encrypt(
				(long) (price * MICROS_PER_CURRENCY_UNIT), ikey, ekey);
		return encryptPrice;
	}

	/**
	 * 
	 * @Description google openrtb-doubleclick winnotice price decrypt
	 * @param priceCipher	待解密的价格
	 * @param ikey	ikey	完整性校验key
	 * @param ekey	ikey	价格加密key
	 * @param isUrlSafe		价格是否使用base64UrlSafe进行编码
	 * @return
	 *
	 * @author wjggwm
	 * @data 2016年11月29日 下午1:04:59
	 */
	public static long decryptPrice(String priceCipher, String ikey, String ekey, boolean isUrlSafe) {
		long price = -1l;
		try {
			byte[] unbase64Price = decodePrice(priceCipher, isUrlSafe);
			if (unbase64Price.length != (OVERHEAD_SIZE + PAYLOAD_SIZE)) {
				throw new IllegalArgumentException(String.format(
						"Price is %s bytes, should be %s",
						unbase64Price.length, (OVERHEAD_SIZE + PAYLOAD_SIZE)));
			}
			byte[] plainData = decrypt(unbase64Price, ikey, ekey);
			price = ByteBuffer.wrap(plainData).getLong(PAYLOAD_BASE);
		} catch (SignatureException e) {
			e.printStackTrace();
		}
		return price;

	}

	/**
	 * 
	 * @Description 加密
	 * @param priceValue
	 * @param ikey
	 * @param ekey
	 * @return
	 *
	 * @author wjggwm
	 * @data 2016年11月29日 下午1:11:47
	 */
	private static byte[] encrypt(long priceValue, String ikey, String ekey) {

		byte[] plainData = initPlainData(PAYLOAD_SIZE, generateIV());
		ByteBuffer.wrap(plainData).putLong(PAYLOAD_BASE, priceValue);

		if (plainData.length < OVERHEAD_SIZE) {
			throw new IllegalArgumentException(String.format(
					"Invalid plainData, %s bytes", plainData.length));
		}

		// workBytes := initVector || payload || zeros:4
		byte[] workBytes = plainData.clone();
		ByteBuffer workBuffer = ByteBuffer.wrap(workBytes);
		// workBytes := initVector || payload || I(signature)
		int signature = hmacSignature(workBytes, ikey);
		workBuffer.putInt(workBytes.length - SIGNATURE_SIZE, signature);
		// workBytes := initVector || E(payload) || I(signature)
		xorPayloadToHmacPad(workBytes, ekey);
		return workBytes;
	}

	/**
	 * 
	 * @Description 解密
	 * @param cipherData
	 * @param ikey
	 * @param ekey
	 * @return
	 * @throws SignatureException
	 *
	 * @author wjggwm
	 * @data 2016年11月29日 下午1:11:58
	 */
	private static byte[] decrypt(byte[] cipherData, String ikey, String ekey)
			throws SignatureException {
		if (cipherData.length < OVERHEAD_SIZE) {
			throw new IllegalArgumentException(String.format(
					"Invalid cipherData, %s bytes", cipherData.length));
		}
		// workBytes := initVector || E(payload) || I(signature)
		byte[] workBytes = cipherData.clone();
		ByteBuffer workBuffer = ByteBuffer.wrap(workBytes);
		// workBytes := initVector || payload || I(signature)
		xorPayloadToHmacPad(workBytes, ekey);
		// workBytes := initVector || payload || I'(signature)
		int confirmationSignature = hmacSignature(workBytes, ikey);
		int integritySignature = workBuffer.getInt(workBytes.length
				- SIGNATURE_SIZE);
		workBuffer.putInt(workBytes.length - SIGNATURE_SIZE,
				confirmationSignature);

		if (confirmationSignature != integritySignature) {
			throw new SignatureException("Signature mismatch: "
					+ Integer.toHexString(confirmationSignature) + " vs "
					+ Integer.toHexString(integritySignature));
		}
		return workBytes;
	}

	/**
	 * {@code payload = payload ^ hmac(encryptionKey, initVector || counterBytes)}
	 * per max-20-byte blocks.
	 */
	private static void xorPayloadToHmacPad(byte[] workBytes, String ekey) {
		int payloadSize = workBytes.length - OVERHEAD_SIZE;
		int sections = (payloadSize + COUNTER_PAGESIZE - 1) / COUNTER_PAGESIZE;
		if (sections > COUNTER_SECTIONS) {
			throw new IllegalArgumentException(String.format(
					"Payload is %s bytes, exceeds limit of %s", payloadSize,
					COUNTER_PAGESIZE * COUNTER_SECTIONS));
		}

		Mac encryptionHmac = createMac();

		byte[] pad = new byte[COUNTER_PAGESIZE + 3];
		int counterSize = 0;

		for (int section = 0; section < sections; ++section) {
			int sectionBase = section * COUNTER_PAGESIZE;
			int sectionSize = min(payloadSize - sectionBase, COUNTER_PAGESIZE);

			try {
				encryptionHmac.reset();
				encryptionHmac.init(new SecretKeySpec(ekey.getBytes(),
						KEY_ALGORITHM));
				encryptionHmac.update(workBytes, INITV_BASE, INITV_SIZE);
				if (counterSize != 0) {
					encryptionHmac.update(pad, COUNTER_PAGESIZE, counterSize);
				}
				encryptionHmac.doFinal(pad, 0);
			} catch (ShortBufferException | InvalidKeyException e) {
				throw new IllegalStateException(e);
			}

			for (int i = 0; i < sectionSize; ++i) {
				workBytes[PAYLOAD_BASE + sectionBase + i] ^= pad[i];
			}

			Arrays.fill(pad, 0, COUNTER_PAGESIZE, (byte) 0);

			if (counterSize == 0
					|| ++pad[COUNTER_PAGESIZE + counterSize - 1] == 0) {
				++counterSize;
			}
		}
	}

	/**
	 * Packages plaintext payload for encryption; returns
	 * {@code initVector || payload || zeros:4}.
	 */
	public static byte[] initPlainData(int payloadSize, byte[] initVector) {
		byte[] plainData = new byte[OVERHEAD_SIZE + payloadSize];

		if (initVector == null) {
			ByteBuffer byteBuffer = ByteBuffer.wrap(plainData);
			byteBuffer.putLong(INITV_TIMESTAMP_OFFSET, System.nanoTime());
			byteBuffer.putLong(INITV_SERVERID_OFFSET, fastRandom.nextLong());
		} else {
			System.arraycopy(initVector, 0, plainData, INITV_BASE,
					min(INITV_SIZE, initVector.length));
		}

		return plainData;
	}

	private static Mac createMac() {
		try {
			return Mac.getInstance(KEY_ALGORITHM);
		} catch (NoSuchAlgorithmException e) {
			throw new IllegalStateException(e);
		}
	}

	/**
	 * {@code signature = hmac(integrityKey, payload || initVector)}
	 */
	private static int hmacSignature(byte[] workBytes, String ikey) {
		try {
			Mac integrityHmac = createMac();
			integrityHmac
					.init(new SecretKeySpec(ikey.getBytes(), KEY_ALGORITHM));
			integrityHmac.update(workBytes, PAYLOAD_BASE, workBytes.length
					- OVERHEAD_SIZE);
			integrityHmac.update(workBytes, INITV_BASE, INITV_SIZE);
			return fromByteArray(integrityHmac.doFinal());
		} catch (InvalidKeyException e) {
			throw new IllegalStateException(e);
		}
	}

	private static int fromByteArray(byte[] bytes) {
		if (bytes.length < BYTES) {
			throw new IllegalArgumentException(String.format(
					"array too small: %s < %s", bytes.length, BYTES));
		}
		return fromBytes(bytes[0], bytes[1], bytes[2], bytes[3]);
	}

	private static int fromBytes(byte b1, byte b2, byte b3, byte b4) {
		return b1 << 24 | (b2 & 0xFF) << 16 | (b3 & 0xFF) << 8 | (b4 & 0xFF);
	}
	
	/**
	 * 生成随机向量,默认大小为cipher.getBlockSize(), 16字节.
	 */
	public static byte[] generateIV() {
		byte[] bytes = new byte[INITV_SIZE];
		random.nextBytes(bytes);
		return bytes;
	}

}
