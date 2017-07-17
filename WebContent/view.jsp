<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>View</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
    table, th, td {
    border: 1px solid black;
    /*min-width: 100px;  */
}
  #map {
        height: 600px;
        width: 400px
      }
      
    </style>
 
    
  </head>
  <body>
  
    <h1>Bucket List</h1>
    
       <h3>Input list item here: </h3>
    <form action="name.do" method="POST">
      <table>
    <tr>
        <th>Object to interact with</th>
        <th>Location</th>
        <th>Time frame</th>
    </tr>
	<tr>
		<td><input type="text" name="what"/></td> 
		<td><input type="text" name="where"/></td> 
		<td><input type="text" name="when"/></td>

	</tr>
</table>
  
      <input type="submit" value="Submit" name="submit" />
      </form><br>
      
    <form action="delete.do" method="POST">
    
      
   <c:if test="${bucketList != null}">
   <table style="border:1px solid">
    <tr>
    	
        <th>Object to interact with</th>
        <th>Location</th>
        <th>Time frame</th>
        <th>Delete</th>
    </tr>
	<c:forEach items="${bucketList}" var="item">
	<tr>
		
		<td>${item.what}</td> 
		<td><a class="submit" id="${item.where}" href="#">${item.where}</a></td> 
		<td>${item.when}</td>
		<td><input type="checkbox" name="checkDelete" value="${item.what}" />
		
	        </tr>
    </c:forEach>
    
</table>
<input type="submit" value="Delete" name="delete" />
	</c:if>
  </form>
  <c:if test="${removed != null}">
  <p><strong>The Bucket List item: </strong>"${removed}"<strong> was removed.</strong></p>
 </c:if>
 
 
<!--    <div id="map"></div> -->
    <script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 5,
          center: {lat: -38.6897432, lng: 175.9049279}
        });
        var geocoder = new google.maps.Geocoder();
        var classname = document.getElementsByClassName('submit');
        for (var i = 0; i < classname.length; i++) {
            classname[i].addEventListener('click', function(e) {
            	
            
      	console.log($(e.target).text());
                geocodeAddress(geocoder, map, $(e.target).text());
            }, false);
        }
        
        
        document.getElementById('search').addEventListener('click', function() {
        	
            
        	  var searchAddress = document.getElementById('searchAddress').value;
        	  console.log(searchAddress);
                    geocodeAddress(geocoder, map, searchAddress);
                }, false);
      
        
      }
		
      function geocodeAddress(geocoder, resultsMap, newAddress) {
    	  console.log(newAddress);
        geocoder.geocode({'address': newAddress}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk&callback=initMap">
    </script>
 <div id="map" style="width: 320px; height: 480px;"></div>
  <div>
    <input id="searchAddress" type="textbox">
    <input id="search" type="button" value="Encode" >
  </div>
 
  </body>
</html>