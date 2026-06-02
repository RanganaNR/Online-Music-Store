<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="artistDemo.artistDBUtil, artistDemo.Music, java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        /* Add your styles here */
    </style>
</head>
<body>
    <header>
        <h1>Music Store</h1>
        <!-- Add navigation and other header elements here -->
    </header>
    
    <div class="container">
        <h2>Search Results</h2>
        
        <%
            String query = request.getParameter("query");
            List<Music> results = artistDBUtil.searchMusic(query);
            if (results != null && !results.isEmpty()) {
        %>
            <div class="music-container">
                <c:forEach var="music" items="${artistDBUtil.searchMusic(query)}">
                    <div class="music-card">
                        <img src="${music.imagePath}" alt="${music.title}">
                        <h3>${music.title}</h3>
                        <audio controls>
                            <source src="${music.filePath}" type="audio/mpeg">
                        </audio>
                    </div>
                </c:forEach>
            </div>
        <%
            } else {
        %>
            <p>No results found for "<%= query %>".</p>
        <%
            }
        %>
    </div>
    
    <footer>
        <p>&copy; 2024 Music Store. All rights reserved.</p>
    </footer>
</body>
</html>
