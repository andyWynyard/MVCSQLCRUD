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
}
    </style>
    
    
  </head>
  <body>
  
    <h1>Bucket List</h1>
    
       <h3>Input list item here: </h3>
    <form action="name.do" method="GET">
      <table>
    <tr>
        <th>What</th>
        <th>Where</th>
        <th>When</th>
    </tr>
	<tr>
		<td><input type="text" name="what"/></td> 
		<td><input type="text" name="where"/></td> 
		<td><input type="text" name="when"/></td>
		

	</tr>
</table>
      
      
      
      <br /><input type="submit" value="Submit" name="submit" /><br />
    </form>
    
      
   <c:if test="${bucketList != null}">
   <table style="border:1px solid">
    <tr>
    <th></th>
        <th>What</th>
        <th>Where</th>
        <th>When</th>
    </tr>
	<c:forEach items="${bucketList}" var="item">
	<tr>
		<td><input type="checkbox" name="check" /><td>${item.what}</td> <td>${item.where}</td> <td>${item.when}</td><br>

	        </tr>
    </c:forEach>
    
</table>
<br /><input type="submit" value="Delete" name="delete" /><br />
	</c:if>
  
    <br>
  
    <br>
 
  </body>
</html>