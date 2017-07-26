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
<link rel="shortcut icon" href="https://www.shareicon.net/data/128x128/2016/01/18/704925_letter_512x512.png" type="image/x-icon" />
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

          <a class="navbar-brand" href="http://34.211.197.80/index.html">Andy Wynyard: Full Stack Java Developer</a>
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
  <h1>Details</h1><h4>Detailed view of the bucket list item.</h4>
  </div>
 </div> <!-- end of container-flex -->
 <div class="container">
 
    <div class="row">
   <!--  <div class="col-sm-1 "></div> -->
    <div class="col-sm-6">
    <div class="well">
    
 
      
    <form action="delete.do" method="POST">
    
      
 

   
    	
        <h3>Object/Person</h3>
     <p>${bucket.objectPerson}</p>
  <h3>When</h3>
  <p>${bucket.timeFrame}</p>
  <h3>Location</h3>
  <p>${location.countryName}</p>
	

<input type="submit" value="Delete" name="delete" /> 

  </form>
  </div>
  </div>
   <div class="col-sm-6">
    <div class="well">
  
  <!--   <script>
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
     -->
     
     <iframe
  width="100%"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk
    &q=${location.countryName}" allowfullscreen>
</iframe>
    
    </div> <!-- end of well div for the map -->
    </div><!-- end of map col div -->
    <!-- <div class="col-sm-1"></div> -->
    
 
 
 
 <%-- <iframe
  width="600"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk
    &q=${location.countryName}" allowfullscreen>
</iframe> --%>
 
 </div>
 </div>
 
 
  </body>
      <footer class="footer">
      <div class="container">
        <span class="text-muted">Copyright &copy 2017 Wynyard Development Inc.</span>
      </div>
    </footer>
</html>