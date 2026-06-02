<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing - Music Store</title>
    <style>
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

/* Pricing Section */
.pricing {
    padding: 2rem 0;
    text-align: center;
    background: #f4f4f4;
}

.pricing h2 {
    font-size: 2.5rem;
    margin-bottom: 1rem;
}

.pricing-list {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-around;
    margin-top: 2rem;
}

.pricing-item {
    background: #fff;
    padding: 1.5rem;
    margin: 1rem;
    border-radius: 10px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: calc(33.333% - 2rem);
    text-align: left;
    transition: transform 0.3s ease;
}

.pricing-item:hover {
    transform: translateY(-10px);
}

.pricing-item h3 {
    font-size: 1.5rem;
    color: #333;
    margin-bottom: 0.5rem;
}

.pricing-item .price {
    font-size: 2rem;
    color: orange;
    margin: 1rem 0;
}

.pricing-item .price span {
    font-size: 1rem;
    color: #666;
}

.pricing-item ul {
    list-style-type: none;
    padding: 0;
}

.pricing-item ul li {
    padding: 0.5rem 0;
    border-bottom: 1px solid #ddd;
    font-size: 1rem;
    color: #666;
}

.pricing-item button {
    background: orange;
    color: #fff;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 25px;
    cursor: pointer;
    transition: background 0.3s ease;
    margin-top: 1rem;
    width: 100%;
}

.pricing-item button:hover {
    background:orange;
}

/* Premium Plan Highlight */
.premium {
    background: orange;
    color: #fff;
}

.premium h3, .premium .price {
    color: #fff;
}

.premium ul li {
    border-bottom: 1px solid #ccc;
}

.premium button {
    background: #fff;
    color: orange;
}

.premium button:hover {
    background: orange;
    color: #fff;
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
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <img src="img/logo2.png" alt="music-logo">
            <h1>Music Store</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="features.jsp">Features</a></li>
                    <li><a href="#pricing">Pricing</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <div class="search-container">
                    <input type="text" placeholder="Search...">
                    <button type="submit">Search</button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Pricing Section -->
    <section id="pricing" class="pricing">
        <div class="container">
            <h2>Our Pricing Plans</h2>
            <div class="pricing-list">
                <div class="pricing-item">
                    <h3>Free Plan</h3>
                    <p class="price">$0 <span>/ month</span></p>
                    <ul>
                        <li>Listen to song previews</li>
                        <li>View song details</li>
                        <li>Ads included</li>
                    </ul>
                    <a href="signup.jsp">
                        <button type="button">Sign Up</button>
                    </a>
                    
                </div>
                <div class="pricing-item">
                    <h3>Standard Plan</h3>
                    <p class="price">$9.99 <span>/ month</span></p>
                    <ul>
                        <li>Listen to full songs</li>
                        <li>Create and manage playlists</li>
                        <li>Ads included</li>
                    </ul>
                    <a href="cardPay.jsp">
                    <button>Get Started</button>
                    </a>

                </div>
                <div class="pricing-item premium">
                    <h3>Premium Plan</h3>
                    <p class="price">$19.99 <span>/ month</span></p>
                    <ul>
                        <li>Listen to full songs</li>
                        <li>Create and manage playlists</li>
                        <li>Download songs</li>
                        <li>No ads</li>
                    </ul>
                    <a href="cardPay.jsp">
                    <button>Go Premium</button>
                    </a>
                </div>
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
