<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Profile Update</title>
    <style>
    /* General Styles */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }

    /* Navbar */
    .navbar {
        background-color: #333;
        padding: 15px 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .navbar .logo a {
        color: white;
        font-size: 1.5em;
        text-decoration: none;
        position: relative;
        top: 20px;
    }

    .navbar .nav-links {
        list-style-type: none;
        display: flex;
        gap: 20px;
    }

    .navbar .nav-links li {
        display: inline;
    }

    .navbar .nav-links li a {
        color: white;
        text-decoration: none;
        font-size: 1em;
    }

    .navbar .nav-links li a:hover {
        color: #ffa500;
    }

    /* Profile Update Form */
    .profile-container {
        background-color: white;
        position: relative;
        top: 40px;
        width: 400px;
        margin: 50px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    .profile-container h2 {
        color: #333;
        margin-bottom: 20px;
    }

    .profile-container label {
        display: block;
        text-align: left;
        margin-bottom: 5px;
        color: #333;
        font-weight: bold;
    }

    .profile-container input[type="text"],
    .profile-container input[type="email"],
    .profile-container input[type="password"],
    .profile-container input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    .profile-container .update-btn {
        background-color: #ffa500;
        color: white;
        padding: 12px;
        width: 100%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .profile-container .update-btn:hover {
        background-color: #333;
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .profile-container {
            width: 90%;
        }

        .navbar .nav-links {
            flex-direction: column;
        }
    }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <a href="index.jsp">My Profile</a>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="features.jsp">| Features</a></li>
            <li><a href="pricing.jsp">| Pricing</a></li>
            <li><a href="contactUs.jsp">| Contact</a></li>
        </ul>
    </div>
    
<%
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String phone = request.getParameter("phone");
    String email = request.getParameter("email");
    String role = request.getParameter("role");
    String password = request.getParameter("password");
%>

    <div class="profile-container">
        <h2>Update Profile</h2>
        <form action="updateU" method="post">
        
       		ID<input type="text" name="id" value="<%=id %>" readonly /><br>
       		
            <label for="name">Name</label>
            <input type="text" id="name" name="name" value="<%= name%>" required>

            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" value="<%= phone%>" required>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" value="<%= email%>" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" value="<%= password%>" required>
	            
			<label for="role">Role</label> <!-- Uppercase "R" for label -->
        	<input type="text" id="role" name="role" value="<%= role %>" readonly>
            
            <button type="submit" class="update-btn">Update Profile</button>
        </form>
    </div>
</body>
</html>
