<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Account</title>
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

        /* User Account Section */
        .user-container {
            background-color: white;
            position: relative;
            top: 40px;
            width: 600px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        }

        .user-container h1, .user-container h2 {
            color: #333;
            text-align: center;
        }

        .user-details {
            text-align: left;
            margin-bottom: 20px;
        }

        .user-details div {
            font-size: 1.1em;
            color: #333;
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }

        .user-details div span {
            font-weight: bold;
        }

        /* Manage Profile Section */
        .manage-profile {
            display: flex; /* Use Flexbox */
            justify-content: space-between; /* Space between elements */
            align-items: center; /* Align items vertically */
            margin-top: 30px;
        }

        .manage-profile a:hover {
            background-color: #333;
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .user-container {
                width: 90%;
            }

            .navbar .nav-links {
                flex-direction: column;
            }
        }

        .delete-account-button, .logout-button {
            background-color: red; /* Red */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
            display: inline-block;
        }

        .delete-account-button:hover, .logout-button:hover {
            background-color: darkred; /* Darker red on hover */
        }

        .edit-profile-button {
            background-color: #ffa500; /* Orange */
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s;
            text-align: center;
            display: inline-block;
            text-decoration: none; /* Remove underline from links */
        }

        .edit-profile-button:hover {
            background-color: #cc8400; /* Darker orange on hover */
        }
    </style>
</head>

<body>

    <div class="navbar">
        <div class="logo">
            <a>User Account</a>
        </div>
        
        <ul class="nav-links">
            <li><a href="dashboard.jsp">Dashboard</a></li>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="features.jsp">Features</a></li>
            <li><a href="pricing.jsp">Pricing</a></li>
            <li><a href="contactUs.jsp">Contact</a></li>
        </ul>
    </div>

    <div class="user-container">
        <c:if test="${not empty cusDetails}">
            <h1>Welcome, ${cusDetails[0].name}!</h1>
            
            <h2>Manage Your Profile</h2>

            <div class="user-details">
                <c:forEach var="cus" items="${cusDetails}">
                    <div><span>ID:</span> ${cus.id}</div>
                    <div><span>Name:</span> ${cus.name}</div>
                    <div><span>Phone:</span> ${cus.phone}</div>
                    <div><span>Email:</span> ${cus.email}</div>
                    <div><span>Role:</span> ${cus.role}</div>
                </c:forEach>
            </div>
        </c:if>

        <!-- Manage Profile Section -->
        <div class="manage-profile">
            <div>
                <c:url value="updateProfile.jsp" var="cusupdate">
                    <c:param name="id" value="${cusDetails[0].id}"/>
                    <c:param name="name" value="${cusDetails[0].name}"/>
                    <c:param name="phone" value="${cusDetails[0].phone}"/>
                    <c:param name="email" value="${cusDetails[0].email}"/>
                    <c:param name="role" value="${cusDetails[0].role}"/>
                    <c:param name="password" value="${cusDetails[0].password}"/>
                </c:url>
                <a href="${cusupdate}" class="edit-profile-button">Edit Profile</a>
                
                <c:url value="deleteProfile.jsp" var="cusdelete">
                    <c:param name="id" value="${cusDetails[0].id}"/>
                    <c:param name="name" value="${cusDetails[0].name}"/>
                    <c:param name="phone" value="${cusDetails[0].phone}"/>
                    <c:param name="email" value="${cusDetails[0].email}"/>
                    <c:param name="role" value="${cusDetails[0].role}"/>
                    <c:param name="password" value="${cusDetails[0].password}"/>
                </c:url>
                <input type="button" class="delete-account-button" value="Delete My Account" onclick="location.href='${cusdelete}'">
            </div>
            
            <div>
                <input type="button" class="logout-button" value="Logout" onclick="location.href='index.jsp'">
            </div>
        </div>

    </div>

</body>

</html>
