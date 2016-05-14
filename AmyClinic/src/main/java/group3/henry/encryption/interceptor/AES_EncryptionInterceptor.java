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
	private static final String KEY = "thisismygroupthr";
								      

	private String encrypt(String message) {
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
		
		HttpServletRequest request = ServletActionContext.getRequest();
		String pw = null;
		String pw2 = null;
		
		if (request.getAttribute("encpw")!=null)
			pw = (String)request.getAttribute("encpw");
		else 
			pw = request.getParameter("memberVO.pwd");			
		if (request.getAttribute("encpw2")!=null)
			pw2 = (String)request.getAttribute("encpw2");
		else
			pw2 = request.getParameter("tempPW");	
		
		request.setAttribute("encpw", encrypt(pw));
		System.out.println(encrypt(pw));
		if (null!=pw2){
			request.setAttribute("encpw2", encrypt(pw2));
			System.out.println(encrypt(pw2));
		}
		
		return invocation.invoke(); // passes control to the next intercepter
	}
//	test method
	public static void main(String[] args){
		AES_EncryptionInterceptor x = new AES_EncryptionInterceptor();
		String testmsg = "Hello World";
		System.out.println(x.encrypt(testmsg)); //MS1O+SSkUT7apEu6Mik/yA==
	}
}

