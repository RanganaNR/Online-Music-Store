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
        /* Delete Button Styling */
.delete {
    background-color: #dc3545; /* Red background */
    color: white; /* White text color */
    border: none; /* No border */
    padding: 8px 16px; /* Padding for better appearance */
    border-radius: 4px; /* Rounded corners */
    font-size: 14px; /* Font size */
    cursor: pointer; /* Pointer cursor on hover */
    transition: background-color 0.3s; /* Smooth transition for hover effect */
}

.delete:hover {
    background-color: #c82333; /* Darker red on hover */
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

    <h1>User Feedbacks</h1>

    <table>
        <thead>
            <tr>
                <th>Contact ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Retrieve all feedbacks from the database
                List<contact> getAllFeedbacks = contactDBUtil.getAllFeedbacks();
                for (contact cont : getAllFeedbacks) {
            %>
               <c:forEach var="cont" items="${contactDBUtil.getAllFeedbacks()}">
                <tr>
                    <td><c:out value="${cont.contactid}" /></td>
                    <td><c:out value="${cont.name}" /></td>
                    <td><c:out value="${cont.email}" /></td>
                    <td><c:out value="${cont.message}" /></td>
                    <td class="action-button">
                        <!-- Create dynamic URL for the Edit button -->
                        <c:url value="updatecontact.jsp" var="contupdate">
                            <c:param name="contactid" value="${cont.contactid}" />
                            <c:param name="name" value="${cont.name}" />
                            <c:param name="email" value="${cont.email}" />
                            <c:param name="message" value="${cont.message}" />
                        </c:url>
                        <a href="${contupdate}">Edit</a>
                    </td>
                    <td class="action-button">
                        <!-- Delete form with POST method -->
                        <form action="deletecontactServlet" method="POST">
                            <input type="hidden" name="contactid" value="${cont.contactid}">
                            <input type="submit" value="Delete" class="delete">
                        </form>
                    </td>
                </tr>
            </c:forEach>
            <%
                }
            %>
        </tbody>
    </table>

</body>
</html>
