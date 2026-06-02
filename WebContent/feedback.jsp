<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="com.contact.contact" %>
<%@ page import="com.contact.contactDBUtil" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us Details</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            font-size: 28px;
            color: #333;
            margin-bottom: 30px;
        }
        
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
            background-color:rgba(255, 255, 255, 0.2); /* Darker orange for active link */
            border-radius: 5px; /* Rounded corners for active link */
        }
        .profile-container {
            display: flex;
            align-items: center;
        }

        .profile-icon {
            margin-left: auto;
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

        /* Table Styling */
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #ff9800; /* Orange header */
            color: white;
            font-size: 16px;
        }

        td {
            font-size: 14px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9; /* Light alternating row color */
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Action Button Styling */
        .action-button {
            text-align: center;
        }

        .action-button a {
            text-decoration: none;
            color: white;
            background-color: #28a745;
            padding: 8px 16px;
            border-radius: 4px;
            font-size: 14px;
            display: inline-block;
        }

        .action-button a.reply {
            background-color: #ff9800; /* Orange button */
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
            }

            .action-button a {
                padding: 6px 12px;
                font-size: 12px;
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

    <h1>User Feedbacks</h1>

    <table>
        <thead>
            <tr>
                <th>Contact ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve all feedbacks from the database
                List<contact> getAllFeedbacks = contactDBUtil.getAllContacts();
                for (contact cont : getAllFeedbacks) {
            %>
                <tr>
                    <td><%= cont.getContactid() %></td>
                    <td><%= cont.getName() %></td>
                    <td><%= cont.getEmail() %></td>
                    <td><%= cont.getMessage() %></td>
                    <td class="action-button">
                        <a href="replyFeedback.jsp?contactid=<%= cont.getContactid() %>" class="reply">Reply</a>
                    </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
