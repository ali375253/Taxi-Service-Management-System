<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
</head>
<html>
<%
String userid=request.getParameter("userid");
%>
<body>
<form method="get" action="FindTaxi.jsp">
Start point :
<input name="s" type="text" id="inp1" style="width:400px">&nbsp;&nbsp;&nbsp;&nbsp;
End point : <input name="e" type="text" id="inp2" style="width:400px">
	<input name="k" type="text" id="km" hidden>
	<input name="d" type="text" id="duration" hidden>
	<input name="id" type="text" value="<%=userid %>" hidden>
<input type="submit" value="Find Taxi">
</form>
<Button id="myBtn" onclick="myFun()" align="right">Ride now</Button>
 <span id="kilo"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 <span id="dur"></span>
<div id="googleMap" style="width:100%;height:450px;"></div>

<script>

function myFun() {
    calculateAndDisplayRoute(directionsService, directionsDisplay);
  };
function myMap() {
	var directionsService = new google.maps.DirectionsService;
	var directionsDisplay = new google.maps.DirectionsRenderer;
	
	var m= {
    center:new google.maps.LatLng(23.2156,72.6369),
    zoom:13,
	};
		
	var map=new google.maps.Map(document.getElementById("googleMap"),m);
	 
	directionsDisplay.setMap(map);
	 var input1 = document.getElementById('inp1');
	 var input2 = document.getElementById('inp2');
     var searchBox1 = new google.maps.places.SearchBox(input1);
     var searchBox2 = new google.maps.places.SearchBox(input2);
     
     document.getElementById("myBtn").addEventListener("click", function(){calculateAndDisplayRoute(directionsService, directionsDisplay);});    
};
	function calculateAndDisplayRoute(directionsService, directionsDisplay) {
		var request={
				 origin: document.getElementById('inp1').value,
		          destination: document.getElementById('inp2').value,
		          travelMode: 'DRIVING'
		};
		
		directionsService.route(request, function(response, status) {
	           if (status == google.maps.DirectionsStatus.OK) 
	          {
	             directionsDisplay.setDirections(response);
	          
	             calculateDistance(document.getElementById('inp1').value,document.getElementById('inp2').value);
	           }
	           else
	        	{
	        	   alert("Invalid places");
	        	}
	         });	
  };
  function calculateDistance(origin,destination)
  {
	  var origin1 = document.getElementById('inp1').value;
      var origin2 = 'Junagadh, Gujarat, India';
      var destinationA = document.getElementById('inp2').value;
      var destinationB = 'Ahmedabad, Gujarat, India';
      
      
	  var service = new google.maps.DistanceMatrixService;
      service.getDistanceMatrix({
        origins: [origin1, origin2],
        destinations: [destinationA, destinationB],
        travelMode: 'DRIVING',
        unitSystem: google.maps.UnitSystem.METRIC,
        avoidHighways: false,
        avoidTolls: false
      }, function(response, status) {
        if (status !== 'OK') {
          alert('Error was: ' + status);
        } else {
      	  var results = response.rows[0].elements;
      	  var km=results[0].distance.text;
      	  var dur=results[0].duration.text;
        	document.getElementById("km").value=km;
        	document.getElementById("duration").value=dur;
        	document.getElementById("dur").innerHTML="Duration : "+dur;
        	document.getElementById("kilo").innerHTML="Kilometer : "+km;
          }
      });

  };
  
 
</script>


<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAI-Gk_tzQx8pSV5ZLNC81SQRGkEX4M2zM&libraries=places&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

</body>
</html>
