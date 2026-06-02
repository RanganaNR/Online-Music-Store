<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Add Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            text-align: center;
            color: #333;
        }

        form {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            margin: 20px auto;
        }

        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        input[type="submit"] {
            background-color: #FFA500; /* Orange background */
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            width: 100%;
        }

        input[type="submit"]:hover {
            background-color: #FF8C00; /* Darker orange on hover */
        }
    </style>
    <script>
        function validateForm() {
            const password = document.getElementById("password").value;
            const passwordPattern = /^(?=.*[!@#$%^&*])[A-Za-z\d@$!%*?&]{8,}$/; // At least 8 characters and a special character

            if (!passwordPattern.test(password)) {
                alert("Password must be at least 8 characters long and include at least one special character.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body>

    <h1>Add New Admin</h1>
    <form action="insertA" method="post" onsubmit="return validateForm();">
         <label for="adminName">Name:</label>
         <input type="text" name="AdminName" required id="adminName"> 

         <label for="password">Password:</label>
         <input type="password" name="password" required id="password"> 
         
         <input type="submit" name="submit" value="Create Admin">    
    </form>

</body>
</html>
