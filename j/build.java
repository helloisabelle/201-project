package mongo;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.NoSuchElementException;
import java.util.StringTokenizer;

public class build {
	void read_file(){
		Map< String,String> map = new HashMap< String,String>(); 
		try {
			BufferedReader br = new BufferedReader(new FileReader("WebContent/buildings.txt"));
			while (true) {
				String info = br.readLine();
				//ArrayList<String> tokens = new ArrayList<String>();
				StringTokenizer tokenizer = new StringTokenizer(info);
				tokenizer.nextToken();
				String key = tokenizer.nextToken();
				String value = "";
				while(tokenizer.hasMoreTokens()) {
					value += tokenizer.nextToken() + " ";
				}
				value.trim();
				map.put(key, value);
				System.out.println(key + " " + value);
			}
			
		}catch(NullPointerException ne){
			//System.out.println("hereee");
		} 
		
		catch(NoSuchElementException nse){
			//System.out.println("heree");
		}
		catch (IOException e) {
			// TODO Auto-generated catch block
			//e.printStackTrace();
			//System.out.println("here");
		}
	}
	
	public static void main(String[] args) {
		build build = new build();
		build.read_file();
	}
}
