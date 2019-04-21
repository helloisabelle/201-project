<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import = "Events.AddressComponent, Events.build, Events.Event_loc, Events.Event, Events.Example, 
				   Events.geocode, Events.Geometry, Events.Location, Events.Location, Events.Northeast, Events.PlusCode,java.lang.Integer,
				   Events.reading_event, Events.Result, Events.Southwest, Events.Viewport, java.util.ArrayList, java.util.Map,
				   java.util.HashMap, java.io.File,group.check" %>

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
		    	  speed: 2
		  		});
			}
		</script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    	<meta charset="utf-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" 
    	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    	<link rel = "stylesheet" type = "text/css" href = "CSS_Files/index_grid.css">
    	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

	</head>
	<body>
	
	
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<!-- 	<div class = "container">
		
			<div id = "navbar"class= "row">
				<div  class = "col-xl-12">
					Grey with black text
					<nav class="navbar navbar-expand-sm bg-light navbar-light fixed-top">
							
						 <a class="navbar-brand" href="#">
   						 	Free Food @  <img src="images/sc.png" alt="Logo" style="width:40px;"> 
 						 </a>
 						 
 						 <nav class="navbar navbar-expand-lg navbar-light bg-light">
           					<div class="container-fluid">
               					<button type="button" id="sidebarCollapse" class="btn btn-info">
                    				<i class="fas fa-align-left"></i>
                    				<span>Toggle Sidebar</span>
               					</button>
          			 		</div>
       					</nav>
						<ul class="navbar-nav">
							<li class="nav-item active">
						    	<a class="nav-link" href="#"> Login </a>
						    </li>
						    <li class="nav-item">
						    	<a class="nav-link" href="#">Register</a>
						    </li>
						    <li class="nav-item">
						    	<a class="nav-link" href="#">Link</a>
						    </li>
						</ul>
					</nav>
				</div>
			</div> -->

 <% 
    
 ArrayList<Event> event_array = (ArrayList<Event>)session.getAttribute("events");
        %>
<!--         
 <script type="text/javascript">
    var ws = new WebSocket("ws://localhost:8080/group/server"); 
        
    ws.onmessage = function(event) {
      var mySpan = document.getElementById("messageGoesHere");
      mySpan.innerHTML=event.data; 
      mySpan.innerHTML="o"; 
    };
     
    ws.onerror = function(event){
        console.log("Error ", event)
    }  
</script> -->
        	    
  <div class="header">
    <a href="index_bs3.jsp" class="logo"><div style = "display: inline-block; color: #d6b2ff;">sc</div>hoolfood</a>
  <div class="header-right">
  <a href="CalendarView.jsp">Calendar</a>
  <a href="fav2.jsp">Favorites</a>
    <a href="index_bsg.jsp">Log Out</a>
  </div>
</div>


<%-- <div class="limiter" style = "width : 70%;">
		<div class="container-table100">
			<div class="wrap-table100">
					<div class="table">
						<div class="roww header">
							<div class="cell">
								Events  
							</div>
						</div>
						
						<% 
						 
						
						for (int i = 0; i < event_array.size();i++){
							String t = event_array.get(i).getTitle();
							int x = event_array.get(i).getLike();
							int like_id = i;
							//System.out.println("hereee");
						 %>
						 
						 <div class="roww" style = "display: block; background: #f8f8ff; padding-top: 10px;padding-bottom: 10px; padding-left: 10px; padding-right: 10px;">
							<div class="cell" style = "display: flex; justify-content: space-between;">
							
							<form name = "myform<%= like_id %>" action = "index_bs2.jsp" onsubmit="return validate('<%=i %>');" method = "GET">
							<input name="like_id" value = <%= like_id %> style = "display: none;">
			                <input  id="formerror<%= like_id %>" class = "btn"   type="submit" value= "♥ <%= x %>">
							</form>
				 			<button style = "inline-block;" id = <%=like_id%> onclick = "like('<%=t %>')"> Like <%= x %> </button>
				 			<a style = "display: inline-block;" id = <%=i %> onclick = "func('<%=i %>')" href="details2.jsp" ><%= t %></a>  
				 			<button onclick = "add('<%=i %>')" style = "float: right;" class="btn" id = <%= i%>><i class="fa fa-star"></i> Add to Favorites</button>
							</div>
							
						</div>
						
						<%} %>
					</div>
			</div>
		</div>
	</div> --%>
	<script src="http://code.jquery.com/jquery-1.11.0.min.js"> </script>
	<%-- <script> 
		function sort(x){
			window.alert(<% event_array.size();%>)
			if(document.getElementById("selectID").value == "1"){
				$("#eventTable").empty();
				<%if(event_array.size() > 0){
				eventSorter es =  new eventSorter(event_array, 0);
				event_array = es.sortArray();
				for(int i = 0; i < event_array.size(); i++ ){
					String t = event_array.get(i).getTitle();
					String Description = event_array.get(i).getDescription();
					String date = event_array.get(i).getDate();
					String location = event_array.get(i).getLocation();
					String time = event_array.get(i).getTime();
					
					int x = event_array.get(i).getLike();
					int like_id = i;
				
				%>
					$('#eventTable').append(
						$('<li>').attr({'class' : 'list-group-item', 'id' : 'eventRow'}).append(
								$('<div>').attr({'class':'row','style':'display:inline-block; background: #f8f8ff; border: 0px solid black; border-radius: 10px ;padding-top: 10px;padding-bottom: 10px; padding-left: 10px; padding-right: 10px;'}).append(
										$('<div>').attr({'class':'cell', 'style':'display: flex-vertical; justify-content: space-between;'}).append(
												$('<div>').attr('style', 'display: flex; flex-direction: row; justify-content: space-between; width: 270px;').append(
														$('a').attr({'style': 'padding-left: 10px;display: inline-block; font-family: avenir ;color: black;font-size: 15px; text-decoration: none','id': <%=i%>,'onclick': 'func(' + <%=i%>+')' ,'href': 'details2.jsp', }).text(<%=t%>).append(
																$('form').attr({'name': 'myform' + <%=like_id%>, 'action': 'index_bs3.jsp', 'onsubmit': 'return validate(' + <%=i%> + ')', 'method': 'GET'}).append(
																		$('input').attr({'name':'like_id', 'value': <%=like_id%>,  'style': 'display:none;'}).append(
																				$('input').attr({'style': 'background', 'id': 'formerror' + <%=like_id%>, 'class': 'btn', 'type':'submit', 'value':'♥' + <%=x%>})
					)))))))));
				<% }}%>
			}
		}
	
	</script> --%>
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
		// document.getElementById("formerror").innerHTML = "<font><em>Successful login!</em></font>";
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
	
	/* function color(i){
		var j = i + i;
		$('#' + j).css("background-color", "dodgerblue");
		$('#' + j).delay(400).css("background-color", "#f8f8ff");
	}
 */
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
                <!-- End of the col class-->
                <div id = "events_column" class = "col-sm-3" style = "position:absolute; left:3%; top: 11%;">
                	<!-- <div id ="event_flexbox" class="d-inline-flex p-3 bg-light text-body" style = "border-radius: 5px padding-top: 0px">-->
       					<div class="card" id="result_panel" style = "max-height: 650px;overflow-y: auto;">
       				
    						<div class = "card-header" style = "color: white; font-size: 23px; font-family: andika  ;background-color:#3a3a3a ;">
    							Free Food Events This Week
    							
    							<div id="custom-select">
    								<span style = "float: right">
										<select id = "selectID" style = "background-color: dodgerblue ;color: white; font-size:15px"  onchange = "sort(this.value);">
											<option value="0" style = "color: white" >Most Likes </option>
											<option value="1" style = "color: white" >Closest Event (Distance)</option>
											<option value="2" style = "color: white" >Earliest Event</option>
											<option value="3" style = "color: white" >Alphabetical A-Z</option>
										</select>
									</span>
								</div>
								
    						</div>
	   						<div class="card-body" id = "content"style = "border-radius: 5px ;">
								
	        					<ul class="list-group list-group-flush" id = "eventTable"style = "overflow:scroll;-webkit-overflow-scrolling: touch;">
	           						
			           				<% 
									 
									
									for (int i = 0; i < event_array.size();i++){
										String t = event_array.get(i).getTitle();
										String Description = event_array.get(i).getDescription();
										String date = event_array.get(i).getDate();
										String location = event_array.get(i).getLocation();
										String time = event_array.get(i).getTime();
										
										int x = event_array.get(i).getLike();
										int like_id = i;
										//System.out.println("hereee");
									 %>
									 <li class = "list-group-item" id = "eventRow">
										 <div class="row" id = "<%=i + i%>"style = "display: inline-block; background: #f8f8ff; border: 0px solid black; border-radius: 10px ;padding-top: 10px;padding-bottom: 10px; padding-left: 10px; padding-right: 10px;">
											<div class="cell" style = "display: flex-vertical; justify-content: space-between;">
												<div  style = "display: flex; flex-direction: row; justify-content: space-between; width: 270px;">
												
												<a style = "padding-left: 10px;display: inline-block; font-family: avenir ;color: black;font-size: 15px; text-decoration: none" id = <%=i %> onclick = "func('<%=i %>')" href="details2.jsp" ><%= t %></a>
												<form name = "myform<%= like_id %>" action = "index_bs3.jsp" onsubmit="return validate('<%=i %>');" method = "GET">
													<%-- <input name="like_id" value = <%= like_id %> style = "display: none;">--%>
													   <input style = " background" id="formerror<%= like_id %>" class = "btn"  type="submit" value= "♥ <%= x %>" >
													<%-- <input  id="formerror<%= like_id %>" class = "btn"  style = "padding: 3px 3px; text-shadow: 0px  -1px 0px rgba(0,0,0,.5);-webkit-box-shadow: 0px 6px 0px #2b638f; -moz-box-shadow: 0px 6px 0px #2b638f; box-shadow: 0px 6px 0px #2b638f; " type="submit" value= "♥ <%= x %>"></span> </p> --%>
													</form>
													</div>
											</div>
													
<%-- 													<p style = "color: #76797c;padding-left:10px;">  <%=Description %></p>--%>
													
													<%-- <p style = "color: black"><i class="far fa-calendar-alt" style = "padding-left: 5px; color: black; "></i>Date:   <%=date %></p> --%>
												  	<%-- <p style = "color: black"><i class="fas fa-map-marker-alt" style = "padding-left: 5px;color: black"></i> Building: <%=location %></p> --%>
													<p style = "color: black; font-family: avenir" ><i class="far fa-clock" style = "padding-left: 5px; color: black; "></i> :   <%=time %></p>
													
										 			<%-- <button style = "inline-block;" id = <%=like_id%> onclick = "like('<%=t %>')"> Like <%= x %> </button> --%>
										 			  
										 			<%-- <button onclick = "add('<%=i %>')" style = "float: right;" class="btn" id = <%= i%>><i class="fa fa-star"></i> Add to Favorites</button> --%>
										</div>
									</li>
									<%} %>
	           						</ul>
	           					</div>
					</div>
                </div>
			</div>
			<!-- End of the row First row class -->
			
			<div id = "outterMap" class = "row">
				<div class= "col-xl-12">
					<div id = "map" class = "jumbotron" style = "position:absolute; color: black; margin-top: 3%; margin-left: 30%; z-index: 100; height: 650px; width: 1000px; margin-bottom: 500px;" ></div>
				</div>
			</div>
			
		<script>
	      var map, windowInfo;
	     
	      function initMap() {
	      	
	    	  
	    	  var location = new google.maps.InfoWindow;
		        if (navigator.geolocation) {
		            navigator.geolocation.getCurrentPosition(function(position) {
		              var pos = {
		                lat: position.coords.latitude,
		                lng: position.coords.longitude
		              };
		              location.setPosition(pos);
		              location.setContent('Current Location.');
		              location.open(map);
		              
		            }, function() {
		              handleLocationError(true, windowInfo, map.getCenter());
		            });
		          } else {
		            // Browser doesn't support Geolocation
		            handleLocationError(false, windowInfo, map.getCenter());
		          }
	    	 var markerArray = [];
	    	 var windowArray = [];
	    	 map = new google.maps.Map(document.getElementById('map'), {
		          center: {lat: 34.0224, lng: -118.2851 },
		          zoom: 16
		          });
	    	  <%
	    	//  reading_event re = new reading_event();
	    	  //File path = new File("buildings.txt");
			  //String filename = path.getAbsolutePath();
			//  System.out.println("HELLLOOO" + filename);	
	    	//  ArrayList<Event> event_array = re.readdatabase();
	    	  build b = new build();
	  		Map<String,String> map = new HashMap<>();
	  			map = b.read_file();
	  		
	    	  geocode g = new geocode();
	    	  ArrayList<Event_loc> locs = new ArrayList<>();
	    	  int i = 0;
	    	  for(Event e: event_array){
	    		if(!e.getLocation().equals("")){
	    			String t = e.getTitle();
					String Description = e.getDescription();
					String date = e.getDate();
					String location = e.getLocation();
					String time = e.getTime();
					
					int x = e.getLike();
					int like_id = i;
					
			  %>
		      var contentString = '<div id="content">'+
		      '<h2 id="firstHeading" class="firstHeading" style = "color:black"> <b>' +
		      "<%=t%>"+
		      '</b></h1>'+
		      '<div id="bodyContent">'+
		      '<p style = "color:black;" ><br>' +"<%=Description%>" + 
		      '</p><br>'+
		      '<p style = "color:black"> Time: ' + 
		      '<%=time%>' + 
		      '</p><br>'+
		      '<p style = "color:black"> Date: ' + 
		      '<%=date%>' + 
		      '</p><br>'+
		      '<p style = "color:black">Building: ' + 
		      '<%=location%>' + 
		      ' <form name = "myform<%= like_id %>" action = "index_bs3.jsp" onsubmit="return validate('+
		      '<%=i %>'+
		      ');" method = "GET">'+
				'<input name="like_id" value = <%= like_id %> style = "display: none;">'+
				   '<input  id="formerror<%= like_id %>" class = "btn"  type="submit" value= "♥ <%= x %>" >'+
				'</form></p>'+
		      '</div>'+
		      '</div>';
	    			
	    		<%	
	    	 		String address = map.get(e.getLocation()).trim();
	    	 		System.out.println(map.size());
	    	 		Example ex = g.convert2(address);
	    	 		double lat = ex.getResults().get(0).getGeometry().getLocation().getLat();
	    	 		double lon = ex.getResults().get(0).getGeometry().getLocation().getLng();
	    	 		Event_loc loc = new Event_loc(e.getTitle() ,lat, lon);
	    	 		locs.add(loc);
	    	 		String name = e.getTitle();
	    	 		%>
	    	 		var infowindow = new google.maps.InfoWindow({
	    	            content: contentString,
	    	            maxWidth: 300
	    	            });
	    	 		windowArray.push(infowindow);
	    	 		var x = <%=loc.lat%>;
	  	    	    var y = <%=loc.lon%>;
	    	 		var Latlng1 = {lat: x, lng: y };
	    	 		var marker1 = new google.maps.Marker({
	    	      	    position: Latlng1,
	    	      	    animation: google.maps.Animation.DROP,
	    	      	    map: map,
	    	      	    title: '<%=name%>'
	    	      	  }); 
	    	 		markerArray.push(marker1);
	    	 		markerArray[<%=i%>].addListener('mouseover', function(){Display(markerArray[<%=i%>],windowArray[<%=i%>], map)});
	    	 		<%i = i+1;%>
	    		<%}
	    		} 
	    	  
	    	  %>

	    }// End of init map function 
        
	    function Display(marker1, infowindow, map, i) {
        	if (marker1.getAnimation() !== null) {
        	    marker1.setAnimation(null);
        	  } else {
        		
        	    marker1.setAnimation(google.maps.Animation.BOUNCE);
        	  } 
        	  infowindow.open(map, marker1);
        	  /* color(i); */
        }
	    
   		</script>
		<!-- End of the container class -->
		<!--  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
	 	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script> -->
	 	
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	 	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
 		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
	 
  		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCncX_zr3M6YHGrWldEsod9AYuy3pIv3kw&callback=initMap"
    	async defer></script>
    	
    	 
		
		
		<canvas class="background"></canvas>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/particlesjs/2.2.3/particles.min.js"></script>
    	<footer class="page-footer font-small blue pt-4 fixed-bottom" style = "position: relative; height: auto; background-color: #3a3a3a; box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19) ">

			    <!-- Footer Links -->
				<div class="container-fluid text-center text-md-left">
			
			      <!-- Grid row -->
			    	<div class="row">
			
			        <!-- Grid column -->
			        	<div class="col-md-6 mt-md-0 mt-3">
			
			          <!-- Content -->
				        	<h5 class="text-uppercase">Footer Content</h5>
				        	<p>Here you can use rows and columns here to organize your footer content.</p>
				
			        	</div>
			        <!-- Grid column -->
			
			        	<hr class="clearfix w-100 d-md-none pb-3">
			
			        	<!-- Grid column -->
			        	<div class="col-md-3 mb-md-0 mb-3">
			
				            <!-- Links -->
				            <h5 class="text-uppercase">Links</h5>
				
				            <ul class="list-unstyled">
				            	<li>
				                	<a href="#!">Link 1</a>
				              	</li>
				              	<li>
				                	<a href="#!">Link 2</a>
				             	</li>
				              	<li>
				                	<a href="#!">Link 3</a>
				              	</li>
				              	<li>
				                	<a href="#!">Link 4</a>
				              	</li>
				            </ul>
			          	</div>
			          <!-- Grid column -->
			
			          <!-- Grid column -->
			          <div class="col-md-3 mb-md-0 mb-3">
			
			            <!-- Links -->
			            <h5 class="text-uppercase">Links</h5>
			
			            <ul class="list-unstyled">
			              <li>
			                <a href="#!">Link 1</a>
			              </li>
			              <li>
			                <a href="#!">Link 2</a>
			              </li>
			              <li>
			                <a href="#!">Link 3</a>
			              </li>
			              <li>
			                <a href="#!">Link 4</a>
			              </li>
			            </ul>
			
			          </div>
			          <!-- Grid column -->
			
			      </div>
			      <!-- Grid row -->
			
			    </div>
			    <!-- Footer Links -->
			
			    <!-- Copyright -->
			    <div class="footer-copyright text-center py-3">© 2018 Copyright:
			      <a href="https://mdbootstrap.com/education/bootstrap/"> MDBootstrap.com</a>
			    </div>
			    <!-- Copyright -->
			
			  </footer>
    	
	</body>
</html>