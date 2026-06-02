<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Confirmation</title>
    <style>

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

        /* User Container */
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

        /* Form Styles */
        table {
            width: 100%;
            margin: 20px 0;
        }

        td {
            padding: 10px;
        }

        input[type="text"] {
            width: calc(100% - 20px);
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }

        input[type="submit"] {
            background-color: #f44336; /* Red background for delete button */
            color: white; /* White text */
            padding: 10px 20px; /* Padding for the button */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            font-size: 1em; /* Font size */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s; /* Smooth background color transition */
            margin-top: 20px;
            display: block; /* Center the button */
            width: 100%; /* Full width */
        }

        input[type="submit"]:hover {
            background-color: #c62828; /* Darker red on hover */
        }

        /* Responsive Design */
        @media (max-width: 600px) {
            .user-container {
                width: 90%;
            }
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
        <h1>Confirm Deletion</h1>

        <%
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            String role = request.getParameter("role");
            String password = request.getParameter("password");
        %>

        <form action="deleteU" method="post" onsubmit="return confirmDeletion();">
            <table>
                <tr>
                    <td>Customer ID</td>
                    <td><input type="text" name="id" value="<%= id %>" readonly></td>
                </tr>
                <tr>
                    <td>Name</td>
                    <td><input type="text" name="name" value="<%= name %>" readonly></td>
                </tr>
                <tr>
                    <td>Phone</td>
                    <td><input type="text" name="phone" value="<%= phone %>" readonly></td>
                </tr>
                <tr>
                    <td>Email</td>
                    <td><input type="text" name="email" value="<%= email %>" readonly></td>
                </tr>
                <tr>
                    <td>Role</td>
                    <td><input type="text" name="role" value="<%= role %>" readonly></td>
                </tr>
            </table>
            <input type="submit" name="submit" value="Delete">
        </form>
    </div>

    <script>
        function confirmDeletion() {
            return confirm("Are you sure you want to delete your account?");
        }
    </script>

</body>
</html>
