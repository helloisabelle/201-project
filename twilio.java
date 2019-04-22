package add;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class twilio {
	public static final String ACCOUNT_SID = "ACc0dcc0bfa4ed5f251b703ddfa8353cdf";
	  public static final String AUTH_TOKEN = "261d099d0cd1d7b86bdcca4b58034cc1";

	  public static void main(String[] args) {
	    Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

	    Message message = Message.creator(new PhoneNumber("+19252040962"),
	        new PhoneNumber("+16506626548"), 
	        "TEST").create();

	    System.out.println(message.getSid());
	  }
}


