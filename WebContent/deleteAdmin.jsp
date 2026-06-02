<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Your Account</title>
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
            color: red;
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

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[readonly] {
            background-color: #e9e9e9;
        }

        /* Button Styles */
        input[type="submit"] {
            background-color: red;
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
            background-color: darkred;
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
      String name = request.getParameter("name");
      String password = request.getParameter("password");
    %>

    <h2>Delete Your Account !!!</h2>
    <form action="deleteA" method="post">
        <!-- Display AdminID as read-only for reference -->
        <label for="AdminID">Admin ID:</label>
        <input type="text" id="AdminID" name="id" value="<%= id %>" readonly><br><br>

        <!-- Display current Admin Name with option to update -->
        <label for="newAdminName">Admin Name:</label>
        <input type="text" id="AdminName" name="name" value="<%= name %>" readonly><br><br>

        <!-- Display current Password with option to update -->
        <label for="newPassword">Password:</label>
        <input type="password" id="password" name="password" value="<%= password %>" readonly><br><br>

        <input type="submit" name="submit" value="Delete My Account">
    </form>

</body>
</html>
