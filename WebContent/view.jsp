<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <title>View</title>
  </head>
  <body>
  
  
    <br>
    <h3>Input name here: </h3>
    <form action="name.do" method="GET">
      <input type="text" name="name" /><br />
      <input type="submit" value="Submit" /><br />
    </form>
  
  
  <c:if test="${newName != null}">

    <p>Your title is: ${newName}</p>
	</c:if>
  </body>
</html>