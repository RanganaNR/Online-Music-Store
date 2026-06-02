<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Music Store - Sign Up</title>
    <style>
    /* General Styles */
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f4f4f4;
    }
    .logo img{
        width: 70px;
        height: 70px;
        float: left;
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
        position: relative;
        top: 20px;
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

    /* Sign Up Form */
    .signup-container {
        background-color: white;
        position: relative;
        top: 40px;
        width: 400px;
        margin: 50px auto;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2);
        text-align: center;
    }

    .signup-container h2 {
        color: #333;
        margin-bottom: 20px;
    }

    .signup-container label {
        display: block;
        text-align: left;
        margin-bottom: 5px;
        color: #333;
        font-weight: bold;
    }

    .signup-container input[type="text"],
    .signup-container input[type="email"],
    .signup-container input[type="password"],
    .signup-container input[type="tel"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
    }

    .signup-container select {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
        box-sizing: border-box;
        font-size: 16px;
        color: #333;
    }

    .signup-container .signup-btn {
        background-color: #ffa500;
        color: white;
        padding: 12px;
        width: 100%;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
    }

    .signup-container .signup-btn:hover {
        background-color: #333;
    }

    /* Responsive Design */
    @media (max-width: 600px) {
        .signup-container {
            width: 90%;
        }

        .navbar .nav-links {
            flex-direction: column;
        }
    }

    /* Login Redirect */
    .login-redirect {
        margin-top: 20px;
        font-size: 14px;
        color: #333;
    }

    .login-redirect a {
        color: #ffa500;
        text-decoration: none;
        font-weight: bold;
    }

    .login-redirect a:hover {
        color: #333;
    }

    </style>

    <!-- JavaScript validation -->
    <script>
        function validatePasswords() {
            var password = document.getElementById("password").value;
            var confirmPassword = document.getElementById("confirm-password").value;
            
            if (password !== confirmPassword) {
                alert("Passwords do not match. Please try again.");
                return false;  // Prevent form submission
            }
            return true;  // Allow form submission
        }
    </script>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="img/logo2.png" alt="music-logo">
            <a href="index.html">Music Store</a>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="features.jsp">| Features</a></li>
            <li><a href="pricing.jsp">| Pricing</a></li>
            <li><a href="contactUs.jsp">| Contact</a></li>
        </ul>
    </div>
    <div class="signup-container">
        <h2>Create Your Account</h2>
        <form action="signup" method="post" onsubmit="return validatePasswords();">
            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Your name..." required>
            
            <label for="phone">Phone Number</label>
            <input type="tel" id="phone" name="phone" placeholder="Your phone number..." required>
            
            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Your email..." required>
            
            <label for="role">Role</label>
            <select id="role" name="role" required>
                <option value="">Select a role...</option>
                <option value="User">User</option>
                <option value="Artist">Artist</option>
            </select>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Create a password..." required>
            
            <label for="confirm-password">Confirm Password</label>
            <input type="password" id="confirm-password" name="confirm-password" placeholder="Confirm your password..." required>
            
            <button type="submit" class="signup-btn">Sign Up</button>
        </form>
        <div class="login-redirect">
            Already have an account? <a href="login.jsp">Log in</a>
        </div>
    </div>
</body>
</html>
