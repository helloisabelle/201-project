<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="Events.Event" %>
     <%@ page import="group.tweet" %>
       <%@ page import="group.twitter" %>
       <%@ page import="group.check" %>
       <%@ page import="Events.reading_event" %>
       <%@ page import="java.util.ArrayList" %>
       <%@ page import="java.util.Date" %>
       <%@ page import="java.util.Locale" %>
       <%@ page import="java.text.SimpleDateFormat" %>
       <%@ page import="java.text.ParseException" %>

    
<!DOCTYPE html>

<html>
	<head>
		<link rel="stylesheet" type="text/css" href="details.css">
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
		<meta charset="UTF-8">
		<title>Home</title>
		<%
		
		

	
		
		%>
	</head>
	<body>
	

	
		<div id="background"></div>
		<div id="gray"></div>


  
  
  <div class="header">
  <a href="index_bs3.jsp" class="logo"><div style = "display: inline-block; color: #d6b2ff;">sc</div>hoolfood</a>
  <div class="header-right">
    <a href="fav2.jsp">Favorites</a>
    <a href="index_bs.jsp">Log Out</a>
  </div>
</div>
  
  
  
  <%

Event e = (Event) request.getSession().getAttribute("event");

ArrayList<Event> events = (ArrayList<Event>)request.getSession().getAttribute("events");

String eventTitle = (String)request.getParameter("eventTitle");
System.out.println("Event title is: " + eventTitle);

int id = 0;
if (eventTitle != (null)) {
	System.out.println("should be here");
	for (int i = 0; i < events.size(); i++){
		if (eventTitle.equals(events.get(i).getTitle())){
			id = i;
			break;
		}
	}
}
else {
	for (int i = 0; i < events.size(); i++){
		if (events.get(i).getTitle().equals(e.getTitle())){
			id = i;
			break;
		}
	}	
}
	//Event e = events.get(0);
	String name = events.get(id).getTitle();
	String location = events.get(id).getLocation();
	String time = events.get(id).getTime();
	String details = events.get(id).getDescription();
	int likes = events.get(id).getLike();
	
	ArrayList<tweet> my_tweets = new ArrayList<>();
	twitter x = new twitter();
	String namee = name;
	if (namee.endsWith("...")){
		namee=namee.substring(0, namee.length() - 3);
	}
	my_tweets = x.search(name);
%>
  
  	
	<div class="limiter">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								<%=name%>   
							</div>
						</div>

						<div class="row">
							<div class="cell" data-title="Full Name">
								<%= details %>
							</div>
						</div>
						
						<div class="row">
							<div class="cell" data-title="Full Name">
								<%= time %>
							</div>
						</div>
						
						<div class="row">
							<div class="cell" data-title="Full Name">
								<%= location %>
							</div>
						</div>
						
						<div class="row">
							<div class="cell" data-title="Full Name">
								<i class="fa fa-heart"></i>  <%= likes %> 
							</div>
						</div>
						
						
						<div class="row">
							<div class="cell" data-title="Full Name" id = "1">
									<!-- <button onclick ='addToFav()'>Favorite</button> -->
									<button class="btn" onclick ='addToFav()'><i class="fa fa-star"></i> Add to Favorites</button>
							</div>
						</div>
						
					

						

					</div>
			</div>
		</div>
	</div>
  
 <script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
 <script>
 
 
	function addToFav(){
		$(document).ready(function () {
			$.ajax({
				url: 'add',
				type: 'GET',
				data: {
					'eventtoadd' : <%=id%>,
				},
				success: function(result){
					//document.getElementById(i).innerHTML = "added";
				}
			})
			});
		document.getElementById(1).innerHTML = "Added to favorites!";
	}
  
</script>	
  
<%--   
			<table class="table">
			   	 <tr>
				 	<th style = "text-align: center;"><%=name%></th>
				 </tr>
				  <tr>
				    <td style = "font-size: 20px;"><%= details %></td>
				  </tr>
				  <tr>
				    <td style = "font-size: 20px;"><%= time %></td>
				  </tr>
				  <tr>
				    <td style = "font-size: 20px;"><%= location %></td>
				  </tr>
			</table>
			 --%>
			
				
			
					
				
	<div class="limiter" style = "padding-bottom: 200px;">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">

						<div class="row header">
							<div class="cell">
								<i class="fa fa-twitter"></i> Tweet
							</div>
							<div class="cell">
								Username
							</div>
							<div class="cell">
								Date
							</div>
						</div>
						
						<% 
						int max = 5;
						if (my_tweets.size() < 5) max = my_tweets.size();
						int flag = 0;
						if (my_tweets.size() == 0) flag = 1;
						for(int i = 0; i < max; i++){
					    String t = my_tweets.get(i).tweet;
					 	String user = my_tweets.get(i).user;
					 	Date date = my_tweets.get(i).date;
					    SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z");  
					    String strDate = formatter.format(date);  
					 	
					 	
					 	%>
					 	
					 	
					 	<div class="row">
							<div class="cell" data-title="Full Name">
								<%= t %>
							</div>
							<div class="cell" data-title="Age">
								<%= user %>
							</div>
							<div class="cell" data-title="Job Title">
								<%= strDate %>
							</div>
						</div>
					 	
					 
				  <%} 
				  
				  if (flag == 1){%>
				  
				  <div class="row">
				  
							<div class="cell" data-title="Full Name">
								No Results Found!
							</div>
							<div class="cell" data-title="Age">
								
							</div>
							<div class="cell" data-title="Job Title">
								
							</div>
						</div>
					  
				 <% }
				  
				  %>


					</div>
			</div>
		</div>
	</div>
	


			
			
			
			<%-- <table class="table2" style = "width: 75%;">
			   	 <tr>
			   	 <th>Tweet</th>
				 	<th>Username</th>
				 	<th>Timestamp</th>
				 </tr>
				 
				  <% for(int i = 0; i < my_tweets.size(); i++){
					    String t = my_tweets.get(i).tweet;
					 	String user = my_tweets.get(i).user;
					 	Date date = my_tweets.get(i).date;
					    SimpleDateFormat formatter = new SimpleDateFormat("E, dd MMM yyyy HH:mm:ss z");  
					    String strDate = formatter.format(date);  
					 	
					 	
					 	%>
					 	
					 	<tr>
					    <td style = "font-size: 20px;"><%= t %></td>
					    
					    <td style = "font-size: 20px;"><%= user %></td>
					    
					    
					    <td style = "font-size: 20px;"><%= strDate %></td>
					    </tr>
					 
				  <%} %>
			</table> --%>
			

			
			
		
		
	</body>

</html>