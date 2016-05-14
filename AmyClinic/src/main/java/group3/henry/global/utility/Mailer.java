package group3.henry.global.utility;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mailer {
	private String nl = System.getProperty("line.separator");
	private final String SIGNATURE = "Sent by AmyClinic." + nl + "Visit us on our website!";
/*
 create account
 set status to 2 (awaiting verification)
 Generate message + token
 store token in memberVO.verify 
 Send to Email addy, with verification link
 Create email verification reminder page
 user clicks on link
 
 servlet receives token
 compare token to DB token
 if accurate, set account status to 1 (active)
 set memberVO.verify to null
 
 
 */	
//	private String secureToken(){		
//		SecureRandom random = new SecureRandom();
//		byte bytes[] = new byte[60];		
//		random.nextBytes(bytes);
//		for (int i = 0, max = bytes.length; i < max; i++){
//			while (bytes[i] < 48 || bytes[i] > 122 ){				
//				byte[] temp = new byte[1];
//				random.nextBytes(temp);
//				bytes[i] = temp[0];
//			}
//		}
//		try {
//			return new String(bytes, "UTF8");
//		} catch (UnsupportedEncodingException e) {
//			return null;
//		}		
//	}
	
	//					Person			Email		  Email Subject   Email Text
	public void send(String name, String destination, String subject, String text) {		  

		//sender
	    String from = "eeit85group3@gmail.com";
	    final String username = "eeit85group3@gmail.com";
	    final String password = "thisismygroupthreepassword";

	    //email host routing
	    String host = "smtp.gmail.com";
	    String port = "587";

	    Properties props = new Properties();
	    props.put("mail.smtp.auth", "true");
	    props.put("mail.smtp.starttls.enable", "true");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.port", port);
	    props.put("mail.smtp.ssl.trust", "smtp.gmail.com");

	    // Get the Session 
	    Session session = Session.getInstance(props, 
	    		new javax.mail.Authenticator() {
			        protected PasswordAuthentication getPasswordAuthentication() {
			        	return new PasswordAuthentication(username, password);
			        }
	      		});
	    try {         
	    	Message message = new  MimeMessage(session); // Create a default MimeMessage object.
	        message.setFrom(new InternetAddress(from)); // Set From: header field of the header.         
	        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(destination)); // Set To: header field of the header.         
	        message.setSubject(subject); // Set Subject: header field
	        message.setText("Hello, "+ name + "!" + nl + nl + text + nl + nl + SIGNATURE); // Set the actual message         
	        Transport.send(message); // Send message
	        
	        System.out.println("Sent message successfully....");

	    } catch (MessagingException e) {
	    	throw new RuntimeException(e);
	    }
	}
	
//	public static void main(String[] args){
//		String nl = System.getProperty("line.separator");
//		Mailer m = new Mailer();
//		String token = m.secureToken().toUpperCase();
//		String to = "eeit85group3@gmail.com";
//		m.send("Group3", to, "AmyClinic Registration Confirmation", 
//				"Thank you for registering on our site! Please click the link below to validate your email!" 
//				+ nl + nl + "http://www.AmyClinic.com?RegistrationAuth=" + token+"&email=" + to);
//	}
}
