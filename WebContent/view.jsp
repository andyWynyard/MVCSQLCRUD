<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>View</title>
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
		<td>${item.where}</td> 
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
 
 
 
 
 
  </body>
</html>