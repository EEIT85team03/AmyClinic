package group3.henry.encryption.interceptor;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
//import java.util.HashMap;
//import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

//import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class MD5_EncryptionInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;
	
	private String encode(String message) {
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();
			
			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = (b & 0x7F) + (b < 0 ? 128 : 0);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
	public String intercept(ActionInvocation invocation) throws Exception {
		
		System.out.println("MD5 Encryption interceptor!");
		
//		ActionContext ctx = invocation.getInvocationContext();
//	    Map<String,Object> parameters = (Map<String,Object>)ctx.get(ActionContext.PARAMETERS);
	    
//	    System.out.println("Map<str,obj> param pwd = " + (parameters.get("memberVO.pwd"))); 

//	    Map<String, Object> paramCopy = new HashMap<String, Object>();
//	    paramCopy.putAll(parameters);
//	    paramCopy.put("memberVO.pwd", encoded);
//
//	    ctx.put(ActionContext.PARAMETERS, paramCopy);

		HttpServletRequest request = ServletActionContext.getRequest();
		String pw = null;
		
		if (request.getAttribute("encpw")!=null)
			pw = (String)request.getAttribute("encpw");
		else 
			pw = request.getParameter("memberVO.pwd");			
		request.setAttribute("encpw", encode(pw));
				
		return invocation.invoke(); // passes control to the next intercepter
	}
	
	
//	test method
	public static void main(String[] args){
		MD5_EncryptionInterceptor x = new MD5_EncryptionInterceptor();
		String testmsg = "Hello World";
		System.out.println(x.encode(testmsg)); //b10a8db164e0754105b7a99be72e3fe5
	}
}

	
