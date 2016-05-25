package group3.beef.mail.model;


import group3.beef.employee.model.EmployeeVO;
import group3.beef.encryption.AES_Encryption;

public class GenerateLinkUtils {
	 private static final String CHECK_CODE = "checkCode";  
	 
	 public static String generateResetPwdLink(EmployeeVO empVO) {  
	        return "http://localhost:8081/AmyClinic//Backstage/EmpLoginServlet.do?action=reset&mail="
	        		+empVO.getEmail()+"&"+ CHECK_CODE + "=" + generateCheckcode(empVO);  

}
	 
	 public static String generateCheckcode(EmployeeVO empVO){
		 String randomCode = null;
		 String mail = empVO.getEmail();
		 String pwd = empVO.getPwd();
		 AES_Encryption AES = new AES_Encryption();
		 try {
			 randomCode = AES.getencrypt(mail+pwd);
			System.out.println(randomCode);
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return randomCode;
	 	}
	 public static boolean verifyCheckcode(EmployeeVO empVO,String checkCode){
		 
		 generateCheckcode(empVO).equals(checkCode);
		 return true;
			 
	 }
	 }



