<%@ page import="java.util.List" %>
<%@ page import="com.customer.Customer" %>
<%@ page import="com.customer.CustomerDBUtil" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Registered Users</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #fff;
            color: #333;
            margin: 0;
            padding: 0;
        }

        h2 {
            color: #333;
            text-align: center;
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

        /* Profile Icon */
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

        /* Table Styles */
        table {
            width: 80%;
            margin: 20px auto;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 12px 15px;
            text-align: center;
        }

        th {
            background-color: #ffa500;
            color: white;
            font-size: 16px;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        /* Button Styles */
        .delete-btn {
            background-color: #ff4500;
            color: white;
            padding: 7px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
        }

        .delete-btn:hover {
            background-color: #ff6347;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            table {
                width: 100%;
            }

            th, td {
                padding: 10px;
            }

            .delete-btn {
                padding: 6px 12px;
                font-size: 13px;
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
   
    <h2>Registered Users</h2>
    <table>
        <thead>
            <tr>
                <th>User ID</th>
                <th>Username</th>
                 <th>Phone Number</th>
                <th>Email</th>
                 <th>Role</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                List<Customer> allUsers =CustomerDBUtil.getAllCustomers();
                for (Customer cus : allUsers) {
            %>
                <tr>
                    <td><%= cus.getId() %></td>
                    <td><%= cus.getName() %></td>
                    <td><%= cus.getPhone() %></td>
                    <td><%= cus.getEmail() %></td>
                    <td><%= cus.getRole() %></td>
                    <td>
                        <form action="deleteUser" method="post">
                            <input type="hidden" name="userID" value="<%= cus.getId() %>">
                            <button type="submit" class="delete-btn">Delete</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>
