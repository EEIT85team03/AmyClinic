package group3.henry.encryption.interceptor;

import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Map;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.DatatypeConverter;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AES_EncryptionInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	private static final String KEY = "thisismygroupthreefinalprojectke";

	private String encryptString(String message) {
		String encryptedString = "";
		
		try {
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding"); 
			SecretKeySpec secretKey = new SecretKeySpec(KEY.getBytes(), "AES");
			cipher.init(Cipher.ENCRYPT_MODE, secretKey);
			encryptedString = DatatypeConverter.printBase64Binary(cipher.doFinal(message.getBytes()));
		} catch (InvalidKeyException e) {
			e.printStackTrace();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (NoSuchPaddingException e) {
			e.printStackTrace();
		} catch (IllegalBlockSizeException e) {
			e.printStackTrace();
		} catch (BadPaddingException e) {
			e.printStackTrace();
		}
		return encryptedString;
	}
	
	public String intercept(ActionInvocation invocation) throws Exception {
		
		System.out.println("AES Encryption interceptor!");
		
		ActionContext ctx = invocation.getInvocationContext();
		HttpServletRequest request = ServletActionContext.getRequest();
				
		return invocation.invoke(); // passes control to the next intercepter
	}
}

