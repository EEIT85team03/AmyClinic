package group3.henry.global.utility;

import java.math.BigInteger;
import java.security.SecureRandom;

public class TokenGenerator {

	// Generates a 50 character secure token string, 250 bit
	public String secureToken(){
		SecureRandom random = new SecureRandom();
		return new BigInteger(250, random).toString(32);
	}
	
	// Generates a secure token string, user specified bit
	public String secureToken(Integer bits){
		SecureRandom random = new SecureRandom();
		if (bits > 0 && bits % 5 == 0) // if entered value is non-negative and a multiple of 5
			return new BigInteger(bits, random).toString(32);
		return null;
	}

}
