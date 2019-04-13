package mongo;

import java.util.ArrayList;

import org.bson.Document;

import com.google.gson.Gson;
import com.mongodb.MongoClient;
import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;

public class reading_event {
	ArrayList<Event> readdatabase(){
		ArrayList<Event> events = new ArrayList<>();
		MongoClient client = new MongoClient("localhost", 27017);
		MongoDatabase database = client.getDatabase("data");
		MongoCollection<Document> collection = database.getCollection("coll");
		
		FindIterable<Document> docs = collection.find(); 
        for (Document doc : docs) {
    		String inputLine = doc.toJson();
    		Gson gson = new Gson(); 
        	Event obj = gson.fromJson(inputLine, Event.class);	
        	events.add(obj);
        }
		client.close();
		
		return events;
	}
}
