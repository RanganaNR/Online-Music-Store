<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Music Store - Sign Up</title>
    <link rel="stylesheet" href="signup.css">
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
.signup-container input[type="password"] {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
    border-radius: 5px;
    border: 1px solid #ccc;
    box-sizing: border-box;
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

.signup-container .login-btn {
    background-color: #ffa500;
    color: white;
    padding: 12px;
    width: 100%;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
}

.signup-container .login-btn:hover {
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
    
    </style>
</head>
<body>
    <div class="navbar">
        <div class="logo">
            <img src="img/logo2.png" alt="music-logo">
            <a href="index.html">Music Store</a>
        </div>
        <ul class="nav-links">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="features.html">| Features</a></li>
            <li><a href="pricing.html">| Pricing</a></li>
            <li><a href="contactUs.html">| Contact</a></li>
        </ul>
    </div>
    <div class="signup-container">
        <h2>Admin Login Portal</h2>
        
        <!-- Display error message if available -->
    
        <p style="color: red;">${errorMessage}</p>
   
    
        <form action="log" method="post">
            <label for="name">User Name</label>
            <input type="text" id="AdminName" name="AdminName" placeholder="Your name..." required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder=" password..." required>
            
            <button type="submit" class="login-btn">Log in</button>
        </form>
    </div>
</body>
</html>
