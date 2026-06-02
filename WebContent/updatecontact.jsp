<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Contact</title>
    <style>
        /* General Styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 40%;
            margin: 50px auto;
            background-color: white;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            padding: 30px;
            border-radius: 10px;
        }

        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
        }

        label {
            font-weight: bold;
            margin: 10px 0 5px;
        }

        input[type="text"], textarea {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            width: 100%;
        }

        textarea {
            resize: none;
        }

        input[type="submit"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px;
            font-size: 18px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #218838;
        }

        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            text-decoration: none;
            color: #007BFF;
        }

        .back-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <h1>Update Contact</h1>

        <%
            String contactid = request.getParameter("contactid");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String message = request.getParameter("message");
        %>

        <form action="update" method="post">
            <label for="contactid">Contact ID</label>
            <input type="text" name="contactid" id="contactid" value="<%= contactid %>" readonly>

            <label for="name">Name</label>
            <input type="text" name="name" id="name" value="<%= name %>" required>

            <label for="email">Email</label>
            <input type="text" name="email" id="email" value="<%= email %>" required>

            <label for="message">Message</label>
            <textarea id="message" name="message" rows="5" required><%= message %></textarea>

            <input type="submit" name="submit" value="Update">
        </form>

        <div class="back-link">
            <a href="contactServlets"></a>
        </div>
    </div>

</body>
</html>

