<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import = "Events.AddressComponent, Events.build, Events.Event_loc, Events.Event, Events.Example, 
				   Events.geocode, Events.Geometry, Events.Location, Events.Location, Events.Northeast, Events.PlusCode,java.lang.Integer, Events.reading_event, Events.Result, Events.Southwest, Events.Viewport, java.util.ArrayList, java.util.Map , java.util.HashMap, java.io.File,group.check" %>

  <%@ page import="java.io.*, java.net.*" %>
<!DOCTYPE html>
	<html>
	<head>
		
		<script type="text/javascript">
		
			window.onload = function() {
				  Particles.init({
				    selector: '.background',
				    	color: ['#7280ff', '#ff9999', '#df0fff'],
				    	  connectParticles: true,
				    	  sizeVariations: 4,
				    	  maxParticles: 70,
				    	  speed: 2  });
			}
		</script>
    	<meta charset="utf-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    	<link rel = "stylesheet" type = "text/css" href = "CSS_Files/index_grid.css">
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
		<link href='fullcalendar/core/main.css' rel='stylesheet' />
    	<link href='fullcalendar/daygrid/main.css' rel='stylesheet' />
	</head>
	
	<body style = "position: absolute; z-index: 50; height:100%; width: 100%; margin:0; padding:0; " >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
		
	    
		<div class="header">
			<a href="index.jsp" class="logo"><div style = "display: inline-block; color: #d6b2ff;">sc</div>hoolfood</a>
			<div class="header-right">
				<a href="fav2.jsp">Favorites</a>
				<a href="index_bsg.jsp">Log Out</a>
			</div>
	
		</div>

		<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
		<script>
	
			function validate(i) {
				add(i);
				 document.getElementById("formerror" + i).value = "hello";
				var xhttp = new XMLHttpRequest();
				xhttp.open("GET", "likes.jsp?like_id=" + i, false );
				xhttp.send();
				
				 if (xhttp.responseText.trim().length > 0) {
				 	document.getElementById("formerror" + i).value = xhttp.responseText.trim();
				 	return false;
				 }
				return true;
	 		}
	 
			function func(i){
				$.ajax({
					url: 'e',
					type: 'GET',
					data: {
						'event' : i,
					},
					success: function(result){
						//document.getElementById(i).innerHTML = "added";
					}
				})
				
			}
		
			function add(i){
				$.ajax({
					url: 'add',
					type: 'GET',
					data: {
						'eventtoadd' : i,
					},
					success: function(result){
						//document.getElementById(i).innerHTML = "added";
					}
				})
				document.getElementById(i).innerHTML = "Added to favorites!";
			}			
		</script>
     
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	 
  		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCncX_zr3M6YHGrWldEsod9AYuy3pIv3kw&callback=initMap" async defer></script>
    	
    	 <script src='fullcalendar/core/main.js'></script>
	    <script src='fullcalendar/daygrid/main.js'></script>

	
		<%-- <% 
			for (int i = 0; i < event_array.size();i++){
				String t = event_array.get(i).getTitle();
				/* String Description = event_array.get(i).getDescription(); */
				String date = event_array.get(i).getDate();
				/* String location = event_array.get(i).getLocation(); */
				String time = event_array.get(i).getTime();
			}
 		%> --%>
	    <script>
	    var eventUnrefined = new Array();
		var i = 0;
		<% ArrayList<Event> event_array = (ArrayList<Event>)session.getAttribute("events");%>
	    <% for (Event e: event_array) { %>
	    		<%String title = e.getTitle();%>
	    		eventUnrefined.push('<%=title%>');
	    		<%String date = e.getDate();%>;
	    		<%String[] splitted = date.split("\\s+");
	    		  String month = splitted[1];
	    		  if (month == "January") month = "01";
	    		  else if (month == "Febuary") month = "02";
	    		  else if (month == "March") month = "03";
	    		  else if (month == "April") month = "04";
	    		  else if (month == "May") month = "05";
	    		  else if (month == "June") month = "06";
	    		  else if (month == "July") month = "07";
	    		  else if (month == "August") month = "08";
	    		  else if (month == "September") month = "09";
	    		  else if (month == "October") month = "10";
	    		  else if (month == "November") month = "11";
	    		  else if (month == "December") month = "12";
	    		  else month = "04";
	    		  String day = splitted[2];
	    		  if (day.length() == 1) day = "0" + day;
	    		  String dateFinal = "2019-" + month + "-" + day;
	    		%>
	    		eventUnrefined.push('<%=dateFinal%>');
	    		<%-- <%String time = e.getTime();%> --%>
	    		<%-- eventUnrefined.push('<%=time%>'); --%>
	    <%}%>
	    var events = new Array();
        for (var i=0; i<eventUnrefined.length-1; i++) {
        	var date = new Date(eventUnrefined[i+1]+'T00:00:00');
			events.push( {
				title: eventUnrefined[i],
				url: 'http://localhost:8080/group/details2.jsp?'+'eventTitle='+eventUnrefined[i],
				start: date,
				allDay: true
				} );
        }
        //console.log('size of array: '+events.length);
		var today = new Date();
		var dd = String(today.getDate()).padStart(2, '0');
		var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
		var yyyy = today.getFullYear();
		
		//today = yyyy + '-' + mm + '-' + dd;

	      document.addEventListener('DOMContentLoaded', function() {
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, { 
	        	plugins: [ 'dayGrid' ], 
	        	eventClick: function(info) {
	        		var eventObj = info.event;
	        		alert("Clicked: " + eventObj.title);
	        		window.open(eventObj.url);
	        		info.jsEvent.preventDefault();
	        	}, 
	        	defaultDate: yyyy + '-' + mm + '-' + dd,
	        	events
	        } );
	       
			
				calendar.render();
			});
	      
	
	    </script> 
    	
		 <canvas class="background" style = "position: absolute; z-index: -24; height:100%; width: 100% ">
		 </canvas>
		 <div class = "calendarColor" style = " z-index: -10;
		    background-color: #3a3a3a ;
		    position: absolute;
		    height: 89%;
		    width: 61%;
		    margin-left: 9%;
		    margin-top: 1%;
		    border-radius: 5px;">
		 </div>
		 <div id='calendar' style = "z-index: 100; margin-left: 11%; margin-top: 3%; height: 1050px; width: 1100px; color: white"></div>
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/particlesjs/2.2.3/particles.min.js"></script>
		 
    
	</body>
</html>