<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Music Store</title>
    <style>
    @charset "UTF-8";

    /* Base Styles */
body {
    margin: 0;
    font-family: Arial, sans-serif;
    line-height: 1.6;
}

.container {
    width: 80%;
    margin: auto;
    overflow: hidden;
}

/* Header Styles */
header {
    /* background: linear-gradient(90deg, #6a11cb 0%, #2575fc 100%); */
    background: #333;
    padding: 1rem 0;
    text-align: center;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    position: sticky;
    top: 0;
    z-index: 1000;
}

header h1 {
    color: #fff;
    margin: 0;
    font-size: 2rem;
    float: left;
}

header img{
    width: 70px;
    height: 70px;
    float: left;
    position: absolute;
    left: 40px;
    bottom: 3px;
}

header nav {
    margin-top: 10px;
}

header ul {
    padding: 0;
    list-style: none;
    display: flex;
    justify-content: center;
    margin: 0;
}

header ul li {
    margin: 0 15px;
}

header ul li a {
    color: #fff;
    text-decoration: none;
    padding: 10px 15px;
    font-weight: bold;
    border-radius: 25px;
    transition: background 0.3s ease, color 0.3s ease;
}

header ul li a:hover {
    background: #fff;
    color: #6a11cb;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

/* Hero Section with Image Overlay */
.hero {
    position: relative;
    background: url('img/b3.jpg') no-repeat center center/cover;
    height: 100vh;
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}
/* Search Bar Styles */
.search-container {
    display: flex;
    align-items: center;
    position: absolute;
    top: 25px;
    right: 50px;
}

.search-container input[type="text"] {
    padding: 8px;
    border: 1px solid #ddd;
    border-radius: 10px;
    font-size: 16px;
    margin-right: 8px;
}

.search-container button {
    padding: 8px 16px;
    border: none;
    background-color: orange;
    color: white;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}

.search-container button:hover {
    background-color: #555;
}


.overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5); /* Dark overlay for better text visibility */
    display: flex;
    align-items: center;
    justify-content: center;
}

.hero-content {
    z-index: 1;
}

.hero h2 {
    margin: 0;
    font-size: 3rem;
}

.hero p {
    font-size: 1.2rem;
}

.btn {
    display: inline-block;
    padding: 0.5rem 1rem;
    background: #e67e22;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
    margin-top: 1rem;
    transition: background 0.3s ease;
}
.btn1 {
    margin-left: 40px;
    display: inline-block;
    padding: 0.5rem 1rem;
    background: #e67e22;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
    margin-top: 1rem;
    transition: background 0.3s ease;
}

.btn:hover {
    background: #d35400;
}

.btn1:hover {
    background: #d35400;
}

/* Features Section */
.features {
    padding: 2rem 0;
    text-align: center;
}

.features .feature-item {
    margin: 1rem 0;
}

.features h2 {
    margin-bottom: 1rem;
}

/* Pricing Section */
.pricing {
    background: #f4f4f4;
    padding: 2rem 0;
    text-align: center;
}

.pricing-plan {
    display: inline-block;
    margin: 1rem;
    padding: 1rem;
    border: 1px solid #ddd;
    background: #fff;
    border-radius: 5px;
}

.pricing-plan h3 {
    margin: 0;
}

.pricing-plan p {
    margin: 0.5rem 0;
}

.pricing-plan .btn {
    margin-top: 1rem;
}

/* Footer Section */
footer {
    background: #333;
    color: #fff;
    padding: 1rem 0;
    text-align: center;
    margin-top: 2rem;
}
    </style>
</head>
<body onload="slider()">
    <!-- Header Section -->
    <header>
        <div class="container">
            <img src="img/logo2.png" alt="music-logo">
            <h1>Music Store</h1>
            <nav>
                <ul>
                    <li><a href="#">Home</a></li>
                    <li><a href="features.jsp">Features</a></li>
                    <li><a href="pricing.jsp">Pricing</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <div class="search-container">
                    <input type="text" placeholder="Search...">
                    <button type="submit">Search</button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Hero Section with Image Overlay -->
    <section id="home" class="hero">
        <div class="overlay">
            <div class="hero-content">
                <h2>Stream Your Favorite Music Anytime, Anywhere</h2>
                <p>Join our community and explore a world of music.</p>
                <a href="signup.jsp" class="btn">Get Started</a>
                <a href="adminLogin.jsp" class="btn1">Login as Admin</a>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section id="features" class="features">
        <div class="container">
            <h2>Features</h2>
            <div class="feature-item">
                <h3>Unlimited Streaming</h3>
                <p>Access millions of songs on demand.</p>
            </div>
            <div class="feature-item">
                <h3>Create Playlists</h3>
                <p>Organize your favorite tracks into playlists.</p>
            </div>
            <div class="feature-item">
                <h3>Offline Mode</h3>
                <p>Download songs and listen without an internet connection.</p>
            </div>
        </div>
    </section>

    <!-- Pricing Section -->
    <section id="pricing" class="pricing">
        <div class="container">
            <h2>Pricing</h2>
            <div class="pricing-plan">
                <h3>Free Plan</h3>
                <p>$0/month</p>
                <p>Limited access to features</p>
                <a href="signup.html" class="btn">Sign Up</a>
            </div>
            <div class="pricing-plan">
                <h3>Standard Plan</h3>
                <p>$9.99/month</p>
                <p>Medium access to all features</p>
                <a href="pricing.html" class="btn">Get Started</a>
            </div>
            <div class="pricing-plan">
                <h3>Premium Plan</h3>
                <p>$19.99/month</p>
                <p>Full access to all features</p>
                <a href="pricing.html" class="btn">Go Premium</a>
            </div>
        </div>
    </section>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Music Store. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
    