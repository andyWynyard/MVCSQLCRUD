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
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
    <style>
    textarea {
    min-width: 100%;
    } 
 
    </style>

  </head>
  <body>
  
  
  
  
    <div class="navbar-wrapper">
    <!-- start of navbar -->
    <nav class="navbar-static-top navbar-inverse">
      <div class="container">
        <div class="navbar-header">

          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>

          <a class="navbar-brand" href="index.html">Andy Wynyard: Full Stack Java Developer</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav navbar-right">

            <li class="pull-right">
              <a href="http://34.211.197.80/contact.html">Contact</a>
            </li>

            <li class="pull-right">
              <a href="http://34.211.197.80/labs.html">Labs</a>
            </li>
            <li class="pull-right">
              <a href="http://34.211.197.80/resume.html">Resume</a>
            </li>
            <li class="pull-right">
              <a href="http://34.211.197.80/projects.html">Projects</a>
            </li>
          </ul>
        </div>
      </div>
      <!--/.nav-collapse -->
       </nav>
  </div>
 

  <!-- end of navbar -->
  
  
  
 <!--  beginning of the bootstrapping -->
 <div class="container">
  <div class="jumbotron">
  <h1>Bucket List</h1>
  </div>
 </div> <!-- end of container-flex -->
 <div class="container">
 
    <div class="row">
   <!--  <div class="col-sm-1 "></div> -->
    <div class="col-sm-6">
    <div class="well">
    
    
    
    
       <h3>Input list item here: </h3>
    <form action="name.do" method="POST">
     
       <h5>Object/Person</h5>
       <input type="text" name="what"/>
       <h5>Location</h5>
       <input type="text" name="where"/>
       <h5>When</h5>
    		<input type="text" name="when"/>
    		<br>
    		<br>
      <input type="submit" value="Submit" name="submit" />
      </form><br>
      
    <form action="delete.do" method="POST">
    
      
   <c:if test="${bucketList != null}">
   <table class="table table-bordered">
    <tr>
    	
        <th>Object/Person</th>
        <th>Location</th>
        <th>When</th>
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
 </div>
 </div>
 <div class="col-sm-6">
 <div class="well">
 <p>Click the location in the table to the left.</p>
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
 <div id="map" style="min-width: 100%; min-height: 400px;"></div> 
    <input id="searchAddress" type="textbox">
    <input id="search" type="button" value=Go! >
    </div> <!-- end of well div for the map -->
    </div><!-- end of map col div -->
    <!-- <div class="col-sm-1"></div> -->
    
  </div> 
 </div>
  </body>
      <footer class="footer">
      <div class="container">
        <span class="text-muted">Copyright &copy 2017 Wynyard Development Inc.</span>
      </div>
    </footer>
</html>