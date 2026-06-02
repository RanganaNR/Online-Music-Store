<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5; /* Light gray background for a modern look */
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #ff5722; /* Vivid orange for headings */
        }

        /* Navigation Bar */
        .navbar {
            background-color: #ff9800; /* Orange */
            padding: 15px 20px;
            display: flex;
            justify-content: space-around;
            align-items: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Subtle shadow for depth */
            border-radius: 5px; /* Rounded corners */
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 1.1em;
            padding: 10px 15px; /* Padding for better clickability */
            transition: background-color 0.3s ease; /* Smooth transition for hover effects */
        }

        .navbar a:hover {
            text-decoration: underline;
            background-color: rgba(255, 255, 255, 0.2); /* Light overlay on hover */
        }

        .navbar a.active {
            background-color: rgba(255, 255, 255, 0.2); /* Darker orange for active link */
            border-radius: 5px; /* Rounded corners for active link */
        }

        /* Profile Container */
        .profile-container {
            background-color: white;
            margin: 20px auto;
            padding: 20px;
            border-radius: 10px; /* Slightly more rounded corners */
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); /* Deeper shadow for emphasis */
            width: 80%;
        }

        /* Profile Details */
        .profile-detail {
            margin: 15px 0;
            font-size: 1.2em;
            color: #333; /* Dark text for better readability */
        }

        /* Button Styles */
        .edit-btn, .delete-btn, .add-admin-btn {
            background-color: #ffa726; /* Orange button color */
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease; /* Smooth transition */
            font-size: 1em; /* Consistent font size */
            margin-top: 20px; /* Space between buttons */
            text-decoration: none; /* Remove underline from link */
            display: inline-block; /* Allow padding and margin */
        }

        .edit-btn:hover, .delete-btn:hover {
            background-color: #ff9800; /* Slightly darker orange on hover */
        }

        .delete-btn {
            background-color: #e64a19; /* Darker orange for delete button */
        }

        .delete-btn:hover {
            background-color: #d84315; /* Even darker orange on hover */
        }

        .add-admin-btn {
            background-color: #4caf50; /* Green color for the add button */
            color: white;
            padding: 10px 25px; /* Slightly more padding for the add button */
            font-size: 1.1em;
            text-decoration: none;
        }

        .add-admin-btn:hover {
            background-color: #388e3c; /* Darker green on hover */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column; /* Stack links on smaller screens */
                align-items: stretch; /* Stretch links to fill width */
            }

            .profile-container {
                width: 95%; /* Full width on smaller screens */
            }

            .add-admin-btn, .edit-btn, .delete-btn {
                width: 100%; /* Full width for buttons on smaller screens */
                margin: 10px 0; /* Margin for spacing */
            }
        }

        .footer {
            text-align: center;
            margin-top: 160px;
            font-size: 14px;
            color: #777;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="adminList.jsp">System Admins</a>
        <a href="registeredUsers.jsp">Registered Users</a>
        <a href="artistDashboard.jsp">Music Database</a> 
        <a href="feedback.jsp">User Feedbacks</a>   
        <a href="adminLogin.jsp">Logout</a>
    </div>
    <br>
    <br>
    <br>
    <h1>Welcome to the Admin Panel  <c:forEach var="admin" items="${adminDetails}"><strong>${admin.adminName}</strong> ! </c:forEach></h1>

    <div class="profile-container">
        <!-- Iterate over the adminDetails list and display details -->
        <c:forEach var="admin" items="${adminDetails}">
        
        <c:set var="id" value="${admin.adminID}"/>
        <c:set var="name" value="${admin.adminName}"/>
        <c:set var="password" value="${admin.password}"/>
        
            <div class="profile-detail">Your Admin ID: <strong>${admin.adminID}</strong></div>
            <div class="profile-detail">Your Admin Name: <strong>${admin.adminName}</strong></div>
            <div class="profile-detail">Your Password: <strong>${admin.password}</strong></div>
            <div class="profile-detail" style="margin-top: 20px;">
               
    <c:url value="updateAdmin.jsp" var="adminUpdate">
       <c:param name="id" value="${id}"></c:param>
       <c:param name="name" value="${name}"></c:param>
       <c:param name="password" value="${password}"></c:param>
    </c:url>
    
    <a href="${adminUpdate}">
    <input type="button"  name="update" value="Edit" class="edit-btn">
    </a>
    
    <br> <!-- Delete Process -->
    
    <c:url value="deleteAdmin.jsp" var="adminDelete">
          <c:param name="id" value="${id}"></c:param>
          <c:param name="name" value="${name}"></c:param>
          <c:param name="password" value="${password}"></c:param>
    </c:url>   
    <a href="${adminDelete}">
    <input type="button"  name="delete" value="Delete Account" class="delete-btn">
    </a>
               
         </div>
     </c:forEach>
    </div>
       
    <div>
        <div style="text-align: center; margin-top: 20px;">
            <a href="adminInsert.jsp" class="add-admin-btn">+ Add Admin</a>
        </div>
    </div>

    <div class="footer">
        &copy; 2024 Admin Dashboard. All rights reserved.
    </div>
    
</body>
</html>
