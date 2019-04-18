<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import = "Events.AddressComponent, Events.build, Events.Event_loc, Events.Event, Events.Example, 
				   Events.geocode, Events.Geometry, Events.Location, Events.Location, Events.Northeast, Events.PlusCode,java.lang.Integer, Events.reading_event, Events.Result, Events.Southwest, Events.Viewport, java.util.ArrayList, java.util.Map , java.util.HashMap, java.io.File,group.check" %>

  <%@ page import="java.io.*, java.net.*" %>
<!DOCTYPE html>
	<html>
	<head>
		
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
    <a href="index.jsp" class="logo"><div style = "display: inline-block; color: #d6b2ff;">sc</div>hoolfood</a>
  <div class="header-right">
  <a href="fav2.jsp">Favorites</a>
    <a href="index_bss.jsp">Log Out</a>
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
<%-- 	function like(i){
		$.ajax({
			url: 'like',
			type: 'GET',
			data: {
				'like' : i,
			},
			success: function(result){
				//document.getElementById(i).innerHTML = "added";
			}
		})
	 	<%for (int i = 0; i < event_array.size(); i++){
			int n = i + 100;
			int likes = event_array.get(i).getLike();
			%>
			document.getElementById(<%=n%>).innerHTML = "Likes: <%= likes%>";
		<%
		}
		
		%>  
		
		
	} --%>
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
			
			<div id = "content"class = "row" style = "width: 1000px; height: 300px; padding-top: 60px; padding-bottom: 600px; margin-left: 35px;" >
				<div class = "col-sm-9">
					
					<!-- Carousel class  -->
					
					<div id="demo" class="carousel slide" style = "display: none"data-ride="carousel" >

						  <!-- Indicators -->
						  <ul class="carousel-indicators">
						    <li data-target="#demo" data-slide-to="0" class="active"></li>
						    <li data-target="#demo" data-slide-to="1"></li>
						    <li data-target="#demo" data-slide-to="2"></li>
						  </ul>
						
						  <!-- The slideshow -->
						  <div class="carousel-inner" style = "border-radius: 7px;">
						    <div class="carousel-item active">
						      <img src="niwa07.png" alt="Los Angeles">
						      <div class="carousel-caption">
	   						  	<h3>Los Angeles</h3>
	   							<p>We had such a great time in LA!</p>
	  						  </div>
						    </div>
						    <div class="carousel-item">
						      <img src="images/burritochickencloseup.jpg" alt="Chicago">
						      <div class="carousel-caption">
	   						  	<h3>Chicago</h3>
	   							<p>We had such a great time in CH!</p>
	  						  </div>
						    </div>
						    <div class="carousel-item">
						      <img src="images/meal.jpg" alt="New York">
						      <div class="carousel-caption">
	   						  	<h3>New York</h3>
	   							<p>We had such a great time in NY!</p>
	  						  </div>
						    </div>
					  </div>
					  <!-- End of slideshow -->
					
					  <!-- Left and right controls -->
					  <a class="carousel-control-prev" href="#demo" data-slide="prev">
					    <span class="carousel-control-prev-icon"></span>
					  </a>
					  <a class="carousel-control-next" href="#demo" data-slide="next">
					    <span class="carousel-control-next-icon"></span>
					  </a>
					</div>
					<!-- End of carousel -->
				</div> 
                <!-- End of the col class-->
                <div id = "events_column" class = "col-sm-3" style = "position:absolute; left:0%; top: -4.5%; height: 600px;">
                	<div id ="event_flexbox" class="d-inline-flex p-3 bg-light text-body" style = "border-radius: 5px padding-top: 0px">
       					
							<div class="sidebar-header">
            					<h3>Free Food Events This Week</h3>
        					</div>
        					<ul class="list-unstyled components" style = "overflow:scroll;-webkit-overflow-scrolling: touch;">
           						
		           				<% 
								 
								
								for (int i = 0; i < event_array.size();i++){
									String t = event_array.get(i).getTitle();
									String Description = event_array.get(i).getDescription();
									String location = event_array.get(i).getLocation();
									String time = event_array.get(i).getTime();
									
									int x = event_array.get(i).getLike();
									int like_id = i;
									//System.out.println("hereee");
								 %>
								 
								 <div class="row" style = "display: inline-block; background: #f8f8ff; border: 3px solid #f4f4f4; border-radius: 5px ;padding-top: 10px;padding-bottom: 10px; padding-left: 10px; padding-right: 10px;">
									<div class="cell" style = "display: flex-vertical; justify-content: space-between;">
										<a style = "padding-left: 10px;display: inline-block; font-family: lora;color: black;font-size: 23px; text-decoration: none" id = <%=i %> onclick = "func('<%=i %>')" href="details2.jsp" ><%= t %></a>
										
									</div>
									
											<form name = "myform<%= like_id %>" action = "index_bs2.jsp" onsubmit="return validate('<%=i %>');" method = "GET">
											<input name="like_id" value = <%= like_id %> style = "display: none;">
							               
											</form>
											
											
											<p style = "color: #3e4144;padding-left:10px;">  <%=Description %></p>
											<p><i class="far fa-clock" style = "padding-left: 5px; "></i>  <%=time %></p>
											<p><i class="fas fa-map-marker-alt" style = "padding-left: 5px;"></i><%=location %><span style = "float: right; padding-right: 5px;"><input  id="formerror<%= like_id %>" class = "btn"  style = "padding: 3px 3px; text-shadow: 0px  -1px 0px rgba(0,0,0,.5);-webkit-box-shadow: 0px 6px 0px #2b638f; -moz-box-shadow: 0px 6px 0px #2b638f; box-shadow: 0px 6px 0px #2b638f; " type="submit" value= "♥ <%= x %>"></span> </p>
											
											
								 			<%-- <button style = "inline-block;" id = <%=like_id%> onclick = "like('<%=t %>')"> Like <%= x %> </button> --%>
								 			  
								 			<%-- <button onclick = "add('<%=i %>')" style = "float: right;" class="btn" id = <%= i%>><i class="fa fa-star"></i> Add to Favorites</button> --%>
								</div>
								
								<%} %>
           						</ul>
           						
           						<!-- <li class="active">
					                <a href="#homeSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Home</a>
					             	<ul class="collapse list-unstyled" id="homeSubmenu">
		                   				<li>
		                       				<a href="#">Home 1</a>
		                    			</li>
		                    			<li>
		                        			<a href="#">Home 2</a>
		                    			</li>
		                    			<li>
		                        			<a href="#">Home 3</a>
		                    			</li>
		                    			
	                				</ul>
            					</li>
            					<li>
                					<a href="#">About</a>
            					</li>
            					<li>
                					<a href="#pageSubmenu" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle">Pages</a>
                					<ul class="collapse list-unstyled" id="pageSubmenu">
                   						<li>
                       						<a href="#">Page 1</a>
                    					</li>
                   						<li>
                       	 					<a href="#">Page 2</a>
                    					</li>
                    					<li>
                        					<a href="#">Page 3</a>
                    					</li>
                					</ul>
            					</li> -->
            					<!-- <li>
                					<a href="#">Portfolio</a>
            					</li>
            					<li>
                					<a href="#">Contact</a>
            					</li> -->
        				
					</div>
                </div>
			</div>
			<!-- End of the row First row class -->
			
			<div id = "outterMap" class = "row">
				<div class= "col-xl-12">
					<div id = "map" class = "jumbotron" style = "position:absolute; margin-top: -47.25%; margin-left: 30%; z-index: 100; height: 575px" ></div>
				</div>
			</div>
		<script>
	      var map, windowInfo;
	      var Latlng1 = {lat: 34.0223, lng: -118.2852 };
	      var Latlng2 = {lat: 34.0222, lng: -118.2855 };
	      var Latlng3 = {lat: 34.0215, lng: -118.2880}; 
	      var contentString = '<div id="content">'+
	      '<div id="siteNotice">'+
	      '</div>'+
	      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
	      '<div id="bodyContent">'+
	      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
	      'sandstone rock formation in the southern part of the '+
	      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
	      'south west of the nearest large town, Alice Springs; 450&#160;km '+
	      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
	      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
	      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
	      'Aboriginal people of the area. It has many springs, waterholes, '+
	      'rock caves and ancient paintings. Uluru is listed as a World '+
	      'Heritage Site.</p>'+
	      '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
	      'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
	      '(last visited June 22, 2009).</p>'+
	      '</div>'+
	      '</div>';
	      
	      function initMap() {
	      		
	    	 var eventArray = [];
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
	    	  for(Event e: event_array){
	    		if(!e.getLocation().equals("")){
	    	 		String address = map.get(e.getLocation()).trim();
	    	 		
	    	 		Example ex = g.convert2(address);
	    	 		double lat = ex.getResults().get(0).getGeometry().getLocation().getLat();
	    	 		double lon = ex.getResults().get(0).getGeometry().getLocation().getLng();
	    	 		Event_loc loc = new Event_loc(e.getTitle() ,lat, lon);
	    	 		locs.add(loc);
	    	 		String name = e.getTitle();
	    	 		%>
	    	 		var x = <%=loc.lat%>;
	  	    	  var y = <%=loc.lon%>;
	    	 		var Latlng1 = {lat: x, lng: y };
	    	 		var marker1 = new google.maps.Marker({
	    	      	    position: Latlng1,
	    	      	    animation: google.maps.Animation.DROP,
	    	      	    map: map,
	    	      	    title: '<%=name%>'
	    	      	  }); 
	    	 		
	    		<%}
	    		} 
	    	  
	    	  %>
	    	  <%-- var x = <%=locs.get(0).lat%>;
	    	  var y = <%=locs.get(0).lon%>;
	    	  var Latlng1 = {lat: x, lng: y };
  	 			var marker1 = new google.maps.Marker({
  	      	    position: Latlng1,
  	      	    animation: google.maps.Animation.DROP,
  	      	    map: map,
  	      	    title: "hi"
  	      	  }); --%>
	      	
	      	var infowindow = new google.maps.InfoWindow({
	            content: contentString
	
	      	});
	      	
<%-- 	      	<%
	      	String x = "hello";
	      	%>
	   	   	
	      	var marker1 = new google.maps.Marker({
	      	    position: Latlng1,
	      	    animation: google.maps.Animation.DROP,
	      	    map: map,
	      	    title: <%=x%>
	      	  }); --%>
	      	
/* 	      	marker1.addListener('mouseover', function(){toggleBounceAndDisplay(marker1, infowindow, map)});
	      	
	      	var marker2 = new google.maps.Marker({
	      	    position: Latlng2,
	      	    animation: google.maps.Animation.DROP,
	      	    map: map,
	      	    title: "marker!!"
	      	  });
	      	marker2.addListener('mouseover', function(){toggleBounceAndDisplay(marker2, infowindow, map)});
	      	
	      	var marker3 = new google.maps.Marker({
	      	    position: Latlng3,
	      	    animation: google.maps.Animation.DROP,
	      	    map: map,
	      	    title: "marker BITCH!!"
	      	  });  
	      	
	      	marker3.addListener('mouseover', function(){toggleBounceAndDisplay(marker3, infowindow, map)});
	         */
	        
	        if (navigator.geolocation) {
	            navigator.geolocation.getCurrentPosition(function(position) {
	              var pos = {
	                lat: position.coords.latitude,
	                lng: position.coords.longitude
	              };
	
	              windowInfo.setPosition(pos);
	              windowInfo.setContent('Your Location.');
	              windowInfo.open(map);
	              
	            }, function() {
	              handleLocationError(true, windowInfo, map.getCenter());
	            });
	          } else {
	            // Browser doesn't support Geolocation
	            handleLocationError(false, windowInfo, map.getCenter());
	          }
	    }// End of init map function 
	        
	        
	        function handleLocationError(browserHasGeolocation, windowInfo, pos) {
	          infoWindow.setPosition(pos);
	          infoWindow.setContent(browserHasGeolocation ?
	                                'Error: The Geolocation service failed.' :
	                                'Error: Your browser doesn\'t support geolocation.');
	          infoWindow.open(map);
	        }
	        
	        function toggleBounceAndDisplay(marker, infowindow, map) {
	        	  if (marker.getAnimation() !== null) {
	        	    marker.setAnimation(null);
	        	  } else {
	        	    marker.setAnimation(google.maps.Animation.BOUNCE);
	        	  } 
	        	  infowindow.open(map, marker);
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
	</body>
</html>