package mongo;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Scanner;
import java.util.StringTokenizer;

import org.apache.tomcat.util.http.fileupload.IOUtils;

import com.google.gson.Gson;


public class geocode {
	
	static Example convert2(String address){
    	ArrayList<Event_loc> result = new ArrayList<Event_loc>();
    	try {
    		StringTokenizer st = new StringTokenizer(address);
    		String add = "";
    		add += st.nextToken();
    	     while (st.hasMoreTokens()) {
    	    	 add += "+" + st.nextToken();
    	     }
		    	String url = "https://maps.googleapis.com/maps/api/geocode/json?address=";
    	     url += add + "&key=" + "AIzaSyB2xD9qucyuV_cjxm1LWNKxFdglg54bOoA"; 
    	     System.out.println(url);
		       
    	     URL website = new URL(url);
    	        URLConnection connection = website.openConnection();
    	        BufferedReader in = new BufferedReader(
    	                                new InputStreamReader(
    	                                    connection.getInputStream()));

    	        StringBuilder response = new StringBuilder();
    	        String inputLine;

    	        while ((inputLine = in.readLine()) != null) 
    	            response.append(inputLine);

    	        in.close();

    	        inputLine =  response.toString();
			    	Gson gson = new Gson(); // Or use new GsonBuilder().create();
			    	Example obj = gson.fromJson(inputLine, Example.class);	
			    	return obj;
			    //	System.out.println(obj.getResults().get(0).getGeometry().getLocation().getLat());
    	}
    	catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

    }
	
	public static void main(String[] args) {
		convert2("3470 TROUSDALE PARKWAY LOS ANGELES CA 90089");
	}
}
