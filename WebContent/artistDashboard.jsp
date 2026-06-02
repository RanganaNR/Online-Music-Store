<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="artistDemo.artistDBUtil, artistDemo.Music, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Artist Dashboard</title>

    <!-- Link to Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
             margin: 0;
            padding: 0;
        }

        /* Navigation Bar */
        .navbar {
            background-color: #ff9800; /* Orange */
            padding: 15px 20px;
            display: flex;
            justify-content: space-between;
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

        /* Profile Icon */
        .profile-container {
            display: flex;
            align-items: center;
        }

        .profile-icon {
            cursor: pointer;
        }

        .profile-icon img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            border: 2px solid white;
            transition: border 0.3s;
        }

        .profile-icon:hover img {
            border-color: #ccc;
        }

        /* Cards container */
        .music-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            margin: auto;
            width: 90%;
        }

        /* Individual music card */
        .music-card {
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            transition: transform 0.3s ease;
        }

        .music-card:hover {
            transform: translateY(-10px); /* Lift the card on hover */
        }

        .music-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .music-card h3 {
            margin: 10px 0;
            font-size: 1.2em;
            color: #333;
        }

        .audio-player {
            width: 100%;
            margin-bottom: 10px;
        }

        .actions {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 10px;
        }

        .icon-btn {
            border: none;
            background: none;
            cursor: pointer;
            font-size: 18px;
            color: #555;
        }

        .icon-btn:hover {
            color: #000;
        }
        
         .add-btn {
            padding:5px 10px;
            border-radius:7px;
            background-color:blue;
            color: white;
        }

        .edit-btn {
            color: #4CAF50;
        }

        .delete-btn {
            color: #f44336;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .music-container {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }

            .profile-icon img {
                width: 30px;
                height: 30px;
            }
        }

    </style>
</head>
<body> 
    <div class="navbar">
        <div class="nav-links">
            <a href="adminList.jsp">System Admins</a>
            <a href="registeredUsers.jsp">Registered Users</a>
            <a href="artistDashboard.jsp">Music Database</a> 
            <a href="feedback.jsp">User Feedbacks</a>   
            <a href="adminLogin.jsp">Logout</a>
        </div>

    </div>

    <br><br>
    <a href="music.jsp">
    <button class="icon-btn add-btn">+ Upload Songs</button>
    </a>
    
    <h2>Uploaded Music</h2>
    
    <div class="music-container">
       <c:forEach var="music" items="${artistDBUtil.getAllMusic()}">
       
        <c:set var="id" value="${music.id}"/>
        <c:set var="title" value="${music.title}"/>
        <c:set var="description" value="${music.description}"/>
        
           <div class="music-card">
               <!-- Music Image -->
               <img src="${music.imagePath}" alt="${music.title}">
        
               <!-- Music Title -->
               <h3>${music.title}</h3>

               <!-- Audio player to listen to the file -->
               <audio controls class="audio-player">
                   <source src="${music.filePath}" type="audio/mpeg">
               </audio>

               <!-- Edit and Delete icons -->
               <div class="actions">
                   <!-- Edit button -->
                   <c:url value="updateMusic.jsp" var="updateMusic" >
                       <c:param name="id" value="${id}"/>
                       <c:param name="title" value="${title}"/>
                       <c:param name="description" value="${description}"/>
                   </c:url>
                   <a href="${updateMusic}">
                       <button type="button" name="updateMusic" class="icon-btn edit-btn" title="Edit">
                           <i class="fas fa-edit"></i>
                       </button>    
                   </a>

                   <!-- Delete button -->
                   <form action="deleteM" method="post" style="display:inline;">
                       <input type="hidden" name="id" value="${music.id}" />
                       <button type="submit" class="icon-btn delete-btn" title="Delete">
                           <i class="fas fa-trash-alt"></i>
                       </button>
                   </form>
               </div>
           </div>
       </c:forEach>
    </div>
</body>
</html>
