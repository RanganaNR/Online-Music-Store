<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Features - Music Store</title>
    <style>
    

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



.bg-background {
    background-color: #f5f5f5;
}

.text-foreground {
    color: #333;
}

/* Header */
.bg-primary {
    background-color: #2c3e50;
}

.text-primary-foreground {
    color: #ecf0f1;
}


/* Main Content */
.bg-card {
    background-color: whitesmoke;
}

.text-muted-foreground {
    color: #7f8c8d;
}

.shadow-lg {
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.rounded-lg {
    border-radius: 10px;
}

.p-6 {
    padding: 1.5rem;
}

/* Footer */
.bg-primary {
    background-color: #333;
}

.mt-auto {
    margin-top: auto;
}

.text-primary-foreground {
    color: #ecf0f1;
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
<body class="bg-background text-foreground">
     <!-- Header Section -->
     <header>
        <div class="container">
            <img src="img/logo2.png" alt="music-logo">
            <h1>Music Store</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="#">Features</a></li>
                    <li><a href="pricing.jsp">Pricing</a></li>
                    <li><a href="contactUs.jsp">Contact</a></li>
                </ul>
                <div class="search-container">
                    <input type="text" placeholder="Search...">
                    <button type="submit">Search</button>
                </div>
            </nav>
        </div>
    </header>

    <main class="container mx-auto my-8">
        <section class="bg-card p-6 rounded-lg shadow-lg mb-8">
            <h2 class="text-2xl font-bold mb-4">User Account Creation</h2>
            <p class="text-muted-foreground">Create your own account easily to get access to a world of music. Whether you're an avid music lover or just someone who enjoys casual listening, having your own account allows you to personalize your experience. Registration is simple, and once you're in, you can explore the full features of our music store.</p>
        </section>

        <section class="bg-card p-6 rounded-lg shadow-lg mb-8">
            <h2 class="text-2xl font-bold mb-4">Song Previews and Details</h2>
            <p class="text-muted-foreground">Not sure if you want to commit to a full track or album? Unregistered users can preview songs and view detailed information about the music, including artist bios, album details, and more. It's the perfect way to discover new music before making any decisions.</p>
        </section>

        <section class="bg-card p-6 rounded-lg shadow-lg mb-8">
            <h2 class="text-2xl font-bold mb-4">Play-list Management</h2>
            <p class="text-muted-foreground">Registered users have the ability to create and manage their own playlists. Organize your favorite tracks, create different playlists for various moods, and access them anytime. It's your music, your way.</p>
        </section>

        <section class="bg-card p-6 rounded-lg shadow-lg mb-8">
            <h2 class="text-2xl font-bold mb-4">Premium Features</h2>
            <p class="text-muted-foreground">Unlock the full potential of your music experience by purchasing a premium package. Premium users can download songs for offline listening and enjoy an ad-free experience. This feature ensures that your music enjoyment is uninterrupted and accessible anywhere.</p>
        </section>
    </main>

    <footer class="w-full bg-primary py-4 mt-auto">
        <div class="container mx-auto text-center">
            <p class="text-primary-foreground">&copy; 2024 Music Store. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
    