package group3.henry.global.utility;

import java.math.BigInteger;
import java.security.SecureRandom;

public class TokenGenerator {

	public String secureToken(){
		SecureRandom random = new SecureRandom();
		return new BigInteger(250, random).toString(32);
	}
	
	public String secureToken(Integer bits){
		SecureRandom random = new SecureRandom();
		if (bits > 0 )
			return new BigInteger(bits, random).toString(32);
		return null;
	}

}
