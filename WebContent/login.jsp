<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login to Music Store</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .login-container {
            background-color: white;
            width: 400px;
            margin: 50px auto;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h2 {
            color: #333;
            margin-bottom: 30px;
            font-size: 24px;
            font-weight: bold;
        }
        
                .error-message {
            color: red; 
            background-color: #ffe6e6;
            border: 1px solid red;
            border-radius: 5px;
            padding: 10px;
            margin-bottom: 20px;
            font-weight: bold;
            text-align: left;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 8px;
            color: #333;
            font-weight: bold;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 16px;
        }

        .remember-section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .remember-section input {
            margin-right: 5px;
        }

        .remember-section a {
            color: #ffa500;
            text-decoration: none;
        }

        .remember-section a:hover {
            text-decoration: underline;
        }

        .login-btn {
            background-color: #ffa500;
            color: white;
            padding: 15px;
            width: 100%;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            text-transform: uppercase;
        }

        .login-btn:hover {
            background-color: #333;
        }

        .signup-section {
            margin-top: 20px;
            font-size: 14px;
        }

        .signup-section a {
            color: #ffa500;
            font-weight: bold;
            text-decoration: none;
        }

        .signup-section a:hover {
            text-decoration: underline;
        }

        .social-login {
            margin-top: 30px;
        }

        .social-login span {
            display: block;
            margin-bottom: 10px;
            font-size: 14px;
            color: #888;
        }

        .social-icons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .social-icons img {
            width: 35px;
            height: 35px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Account Login</h2>
        
	<%
	    String error = (String) request.getAttribute("error");
	    if (error != null) {
	%>
	    <div class="error-message"><%= error %></div>
	<%
	    }
	%>
        
        <form action="login" method="post">
            <label for="email">Account</label>
            <input type="text" id="email" name="email" placeholder="Please enter your email" required>
            
            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter password" required>

            <div class="remember-section">
                <div>
                    <input type="checkbox" id="rememberMe" name="rememberMe">
                    <label for="rememberMe">Remember Me</label>
                </div>
                <a href="#">Forgot your password?</a>
            </div>

            <button type="submit" name="login" class="login-btn">Sign In</button>
        </form>

        <div class="signup-section">
            Don't Have an Account? <a href="signup.jsp">Sign Up Now</a>
        </div>

        <div class="social-login">
            <span>Or Sign In With</span>
            <div class="social-icons">
                <img src="https://cdn-icons-png.flaticon.com/512/733/733547.png" alt="Facebook">
                <img src="https://cdn-icons-png.flaticon.com/512/281/281764.png" alt="Google">
                <img src="https://cdn-icons-png.flaticon.com/512/0/7478.png" alt="Apple">
                <img src="https://cdn-icons-png.flaticon.com/512/732/732221.png" alt="Microsoft">
            </div>
        </div>
    </div>
</body>
</html>
