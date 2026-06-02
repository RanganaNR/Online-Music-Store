<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="artistDemo.Music" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Music</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #333;
            margin: 0;
            padding: 0;
            padding-top: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
        }

        form {
            width: 50%;
            margin: 0 auto;
            background-color: #f9f9f9;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }

        label {
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="file"] {
            margin: 10px 0;
        }

        /* Button Styles */
        input[type="submit"] {
            background-color: #ffa500;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #333;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            form {
                width: 90%;
            }

            input[type="submit"] {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>

<%
    String id = request.getParameter("id");
    String title = request.getParameter("title");
    String description = request.getParameter("description");
%>

<h2>Update Music Details</h2>
<form action="updateM" method="post">
    
    <label for="id">Music ID:</label>
    <input type="text" id="id" name="id" value="<%= id %>" readonly>

    <!-- Display current Title with option to update -->
    <label for="title">Title:</label>
    <input type="text" id="title" name="title" value="<%= title %>" required>

    <!-- Display current Description with option to update -->
    <label for="description">Description:</label>
    <textarea id="description" name="description" required><%= description %></textarea>

    <input type="submit" name="submit" value="Save Changes">
</form>

</body>
</html>
