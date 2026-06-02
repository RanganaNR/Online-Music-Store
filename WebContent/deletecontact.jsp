<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <%
         String contactid = request.getParameter("contactid");
         String name = request.getParameter("name");
         String email = request.getParameter("email");
         String message = request.getParameter("message");
      
     %>
<form action ="delete" method = "post">
         
         Contact ID  <input  type="text" name="contactid" value="<%= contactid %>" readonly><br>
         Name  <input  type="text" name="name" value="<%= name %>"readonly><br>
         Email  <input  type="text" name="email" value="<%= email %>"readonly><br>
         Message  <textarea  id="text" name="message" rows="5"readonly> <%= message %></textarea><br>
         
         <input type="submit" name="submit" value="delete" ><br>
    
    </form>





</body>
</html>