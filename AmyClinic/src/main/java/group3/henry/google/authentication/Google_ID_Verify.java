package group3.henry.google.authentication;

import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Arrays;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;

public class Google_ID_Verify {
	  /** Global instance of the JSON factory. */
	  private static final JsonFactory JSON_FACTORY = JacksonFactory.getDefaultInstance();
	  
	  /** Global instance of the HTTP transport. */
	  private static HttpTransport httpTransport;
	  public static final String CLIENT_ID = "187388699466-pqf6of44on8fl4fvfdhe5rqu8or4r3ba.apps.googleusercontent.com";
	  
	public void verify(String idTokenString){
		 try {
			httpTransport = GoogleNetHttpTransport.newTrustedTransport();
		} catch (GeneralSecurityException | IOException e1) {
			e1.printStackTrace();
		}
		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(httpTransport, JSON_FACTORY)
	    .setAudience(Arrays.asList(CLIENT_ID))
	    // If you retrieved the token on Android using the Play Services 8.3 API or newer, set
	    // the issuer to "https://accounts.google.com". Otherwise, set the issuer to
	    // "accounts.google.com". If you need to verify tokens from multiple sources, build
	    // a GoogleIdTokenVerifier for each issuer and try them both.
	    .setIssuer("accounts.google.com")
	    .build();

		// (Receive idTokenString by HTTPS POST)
	
		GoogleIdToken idToken = null;
		try {
			idToken = verifier.verify(idTokenString);
		} catch (GeneralSecurityException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (idToken != null) {
		  Payload payload = idToken.getPayload();
	
		  // Print user identifier
		  String userId = payload.getSubject();
		  System.out.println("User ID: " + userId);
	
		  // Get profile information from payload
		  String email = payload.getEmail();
		  boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
		  String name = (String) payload.get("name");
		  String pictureUrl = (String) payload.get("picture");
		  String locale = (String) payload.get("locale");
		  String familyName = (String) payload.get("family_name");
		  String givenName = (String) payload.get("given_name");
	
		  // Use or store profile information
		  System.out.println(email);
		  System.out.println(emailVerified);
		  System.out.println(name);
		  System.out.println(pictureUrl);
		  System.out.println(locale);
		  System.out.println(familyName);
		  System.out.println(givenName);
		  
	
		} else {
		  System.out.println("Invalid ID token.");
		}
	}
	
	public static void main(String[] args){
		Google_ID_Verify verify = new Google_ID_Verify();
		//Tokens are good only for about an hour, would need to generate new token to test
		String token = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjM0NzdmYmQ5MDQ4ODBhZmNmODQ3OGYwOGE2ZDhhZWUwZGQ1YWY5ZTkifQ.eyJpc3MiOiJhY2NvdW50cy5nb29nbGUuY29tIiwiYXRfaGFzaCI6IjJKdFFuQTF4UzlWcThPRTBTelMyckEiLCJhdWQiOiIxODczODg2OTk0NjYtcHFmNm9mNDRvbjhmbDRmdmZkaGU1cnF1OG9yNHIzYmEuYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTYwMTAxNDU3OTU2NzIyMzA3MjIiLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiYXpwIjoiMTg3Mzg4Njk5NDY2LXBxZjZvZjQ0b244Zmw0ZnZmZGhlNXJxdThvcjRyM2JhLmFwcHMuZ29vZ2xldXNlcmNvbnRlbnQuY29tIiwiZW1haWwiOiJlZWl0ODVncm91cDNAZ21haWwuY29tIiwiaWF0IjoxNDY0NjA5NTI3LCJleHAiOjE0NjQ2MTMxMjcsIm5hbWUiOiJHcm91cCAzIEVFSVQiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tLy1nc1R6NGY3SzZQWS9BQUFBQUFBQUFBSS9BQUFBQUFBQUFBcy9HZy12R3h3UWt4NC9zOTYtYy9waG90by5qcGciLCJnaXZlbl9uYW1lIjoiR3JvdXAgMyIsImZhbWlseV9uYW1lIjoiRUVJVCIsImxvY2FsZSI6ImVuIn0.bLFu2umQFOfNm4s7_DtgMJTqxnUG7od80gYWRwaFizKaiJ3sbNr_X7beUxZ75-I8cinyt2pZnKutYYrEZjiDk4jXPYjhpipqYp1BjIHJ8SM9u_LhZhMHwFoyDY1jPMf6otMZ5Jg40vDmQvDas8iYTaYpyiUddWlT2_2doZOR3UdAhD1s5jSP8J0FaJ0A-KwLLtMUxonbqF6C4q6x76aO7966bytksnzd-4001w3QmBJsnmbVEso_6l4I4SuNMH5iSwoJORSYw3szsHcCp0D9Ai2DYhJXhgWNjaZGwQ8dvVKUwUT5qiIEp55HXkZyyJDg-PeGWJBUKY-AztCgo5QLEw";
		
		verify.verify(token);
	
	}
	// write Action for Google Login
	// Change SQL to only require name, email
	// Change user photo
	// Create logout function
}
