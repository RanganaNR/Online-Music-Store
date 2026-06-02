<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Contact Us Details</title>
    <style>
        /* Simple CSS for styling */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: white;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .action-button {
            text-align: center;
        }

        .action-button a {
            text-decoration: none;
            color: white;
            background-color: #28a745;
            padding: 8px 16px;
            border-radius: 4px;
            display: inline-block;
            margin-right: 10px;
        }

        .action-button form {
            display: inline;
        }

        .action-button a.delete,
        .action-button input.delete {
            background-color: #dc3545;
            border: none;
            color: white;
            padding: 8px 16px;
            border-radius: 4px;
            cursor: pointer;
        }

        h1 {
            text-align: center;
            font-size: 24px;
            margin: 20px 0;
        }
    </style>
</head>
<body>

    <h1>Contact Us Details</h1>

    <table>
        <thead>
            <tr>
                <th>Contact Us Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Message</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cont" items="${contactDBUtil.getAllContacts()}">
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
        </tbody>
    </table>

</body>
</html>
