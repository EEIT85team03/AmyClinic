package group3.henry.encryption.interceptor;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class AES_EncryptionInterceptor extends AbstractInterceptor {
	private static final long serialVersionUID = 1L;

	public String intercept(ActionInvocation invocation) throws Exception {

		ActionContext ctx = invocation.getInvocationContext();
		Map<String, Object> session = ctx.getSession();
		String account = (String) session.get("account"); 
		
		System.out.println("login interceptor!");
		if (account == null) { 
			HttpServletRequest request = ServletActionContext.getRequest();
			String location = request.getRequestURI();
			session.put("location", location);
			ctx.put("message", "You are not logged in!"); 
			return "login";
		} else {
			return invocation.invoke(); // passes control to the next intercepter
		}
	}
}
