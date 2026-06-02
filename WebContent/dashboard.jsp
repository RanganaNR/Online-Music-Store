<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="artistDemo.artistDBUtil, artistDemo.Music, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>

    <!-- Link to Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #121212; /* Dark background */
            color: #fff; /* Light text color */
        }

        header {
            background: orange;
            padding: 10px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        header img {
            width: 50px;
            height: auto;
            margin-right: 15px;
        }

        nav {
            background-color: orange; /* Orange navigation bar */
            padding: 10px;
            border-radius: 5px;
            margin-left: 20px;
        }

        nav ul {
            list-style: none;
            padding: 0;
            display: flex;
            gap: 15px;
            align-items: center;
        }

        nav a {
            text-decoration: none;
            color: #121212; /* Dark text for links */
            font-weight: bold;
        }

        nav .search-container {
            display: inline-flex;
            align-items: center;
        }

        nav input[type="text"] {
            padding: 5px;
            margin-right: 5px;
            border: none;
            border-radius: 3px;
        }

        nav button {
            padding: 5px 10px;
            background-color: #1DB954; /* Spotify green for the button */
            border: none;
            border-radius: 3px;
            color: #fff; /* White text */
            cursor: pointer;
        }

        .profile-icon img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
        }

        .container {
            padding: 20px;
        }

        .welcome-message {
            font-size: 2em;
            margin-bottom: 20px;
            text-align: center;
        }

        .music-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }

        .music-card {
            background-color: #282828; /* Card background */
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.2s ease;
        }

        .music-card:hover {
            transform: scale(1.05); /* Slightly enlarge card on hover */
        }

        .music-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .music-card h3 {
            margin: 10px;
            font-size: 1.2em;
            color: #fff; /* Title color */
        }

        .audio-player {
            width: 100%;
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            margin: 20px 0;
            font-size: 0.9em;
            color: #b3b3b3; /* Light gray text */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .music-container {
                grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
            }
        }
    </style>
</head>
<body>

<header>
    <img src="img/logo2.png" alt="Music Store Logo">
    <h1>Music Store</h1>
    
    <nav>
        <ul>
            <li><a href="#">Home</a></li>
            <li><a href="features.jsp">Features</a></li>
            <li><a href="pricing.jsp">Pricing</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
       <div class="search-container">
       <form action="searchResults.jsp" method="GET">
        <input type="text" name="query" placeholder="Search..." required>
        <button type="submit">Search</button>
       </form>
</div>

    </nav>

    <div class="profile-icon" onclick="window.location.href='userAccount.jsp'">
        <img src="img/profile.png" alt="Profile Icon">
    </div>
</header>

<div class="container">
    <h1 class="welcome-message">Welcome, ${cusDetails[0].name}!</h1>
    
    <p style="text-align:center; color: #b3b3b3;">Explore your favorite tracks and discover new music tailored just for you.</p>

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
            </div>
        </c:forEach>
    </div>
</div>

<footer>
    <p>&copy; 2024 Music Store. All rights reserved.</p>
</footer>

</body>
</html>
