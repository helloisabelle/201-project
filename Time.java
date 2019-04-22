package add;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import com.twilio.Twilio;
import com.twilio.rest.api.v2010.account.Message;
import com.twilio.type.PhoneNumber;

public class Time extends TimerTask
{
	
	public static final String ACCOUNT_SID = "ACc0dcc0bfa4ed5f251b703ddfa8353cdf";
	  public static final String AUTH_TOKEN = "261d099d0cd1d7b86bdcca4b58034cc1";

    public void run()
    {
    	Twilio.init(ACCOUNT_SID, AUTH_TOKEN);

	    Message message = Message.creator(new PhoneNumber("+19252040962"),
	        new PhoneNumber("+16506626548"), 
	        "You favorited Fake Event!  Reminder it is happening in one hour at HOH.").create();

	    System.out.println("sent text");
    }
    
    public Time() {

        DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date date = null;
    	try {
    		date = dateFormatter .parse("2019-04-17 18:25:00");
    	} catch (ParseException e) {
    		// TODO Auto-generated catch block
    		e.printStackTrace();
    	}
        Timer timer = new Timer();

        timer.schedule(new Time(), date);
    }


//    public static void main(String[] args) {
//
//	    DateFormat dateFormatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	    Date date = null;
//		try {
//			date = dateFormatter .parse("2019-04-17 18:25:00");
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	    Timer timer = new Timer();
//	
//	    timer.schedule(new Time(), date);
//	}
}