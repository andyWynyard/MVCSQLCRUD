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
  <h1>Bucket List</h1><h4>These are the places I want to visit before I kick the bucket - to be fair, it could be any day, I do ride a bike to school, in Denver.</h4>
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
       <input type="text" name="objectPerson"/>
       <h5>Location</h5>
       <input type="text" name="location"/>
       <h5>When</h5>
    		<input type="text" name="timeFrame"/>
    		<br>
    		<br>
      <input type="submit" value="Submit" name="submit" />
      </form><br>
      
   
  <c:if test="${removed != null}">
  <p><strong>The Bucket List item: </strong>"${removed}"<strong> was removed.</strong></p>
 </c:if>
 </div>
 </div>
 <div class="col-sm-6">
 <div class="well">

 <form action="details.do" method="GET">

   <c:if test="${bucketList != null}">
   <table class="table table-bordered">
    <tr>
    	
        <th>Object/Person</th>
       <!--  <th>Location</th> -->
        <th>When</th>
      <!--   <th>Delete</th> -->
    </tr>
	<c:forEach items="${bucketList}" var="item">
	<tr>
		
		<td><a href="details.do?bucketId=${item.id}">${item.objectPerson}</a></td> 
		<td>${item.timeFrame}</td>
		
	        </tr>
    </c:forEach>
    
</table>

<!-- <input type="submit" value="Delete" name="delete" /> -->
	</c:if>
  </form>
 
 <%-- <iframe
  width="600"
  height="450"
  frameborder="0" style="border:0"
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyASJj0SjYy3dfJWAm53SUPlIlqOXclJEWk
    &q=${item.where}" allowfullscreen>
</iframe> --%>


</div>
</div>
</div>
</div>
 
  </body>
      <footer class="footer">
      <div class="container">
        <span class="text-muted">Copyright &copy 2017 Wynyard Development Inc.</span>
      </div>
    </footer>
</html>