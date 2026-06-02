<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Music Store</title>
    <style>
    /* Base Styles */
body {
    background: url('img/c1.jpg') no-repeat center center/cover;
    margin: 0;
    padding: 0;
    height: 100%;
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

.container-form {
    height: 100%;
    position: relative;
    top: -25px;
}

.container-form h2 {
    font-size: 3.5rem;
    margin-bottom: 1rem;
    color: black;
}

.container-form p {
    margin-bottom: 2rem;
    font-size: 1.2rem;
    color: black;
}

header h1 {
    color: white;
    margin: 0;
    font-size: 2rem;
    float: left;
}

header img {
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

.contact-us {
    padding: 2rem 0;
    text-align: center;
}

form {
    position: relative;
    z-index: 1;
    background-color: rgba(255, 255, 255, 0.8);
    padding: 20px 80px;
    border-radius: 10px;
    max-width: 600px;
    margin: 100px auto;
    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
}

.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    margin-bottom: 0.5rem;
    font-weight: bold;
    color: black;
}

.form-group input,
.form-group textarea {
    width: 100%;
    padding: 0.75rem;
    border: 1px solid #ddd;
    border-radius: 5px;
    font-size: 1rem;
}

.btn {
    display: inline-block;
    padding: 0.75rem 1.5rem;
    background: #6a11cb;
    color: #fff;
    border-radius: 5px;
    text-decoration: none;
    font-size: 1rem;
    transition: background 0.3s ease;
    cursor: pointer;
    position: relative;
    left: 5px;
}

.btn:hover {
    background: #2575fc;
}

footer {
    background: #333;
    color: #fff;
    padding: 1rem 0;
    text-align: center;
    margin-top: 2rem;
}
    </style>

    <script>
        // JavaScript validation function
        function validateForm() {
            // Name validation
            const name = document.getElementById("name").value;
            if (name.length < 3) {
                alert("Name must be at least 3 characters long.");
                return false;
            }

            // Message validation
            const message = document.getElementById("message").value;
            if (message.length < 10) {
                alert("Message must be at least 10 characters long.");
                return false;
            }

            // If all validations pass, return true
            return true;
        }
    </script>
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
                    <li><a href="pricing.jsp">Pricing</a></li>
                    <li><a href="#contact">Contact</a></li>
                </ul>
                <div class="search-container">
                    <input type="text" placeholder="Search...">
                    <button type="submit">Search</button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Contact Us Section -->
    <section id="contact" class="contact-us">
        <div class="container-form">   
          <fieldset>
            <legend><h1>Contact Us</h1></legend>
            <form action="insert" method="post" onsubmit="return validateForm()">
                <p><b>If you have any questions or need support, feel free to reach out to us using the form below.</b></p>
                <div class="form-group">
                    <label for="name">Name :</label>
                    <input type="text" id="name" name="name"  placeholder="Your Name" required>
                </div>
                <div class="form-group">
                    <label for="email">Email :</label>
                    <input type="email" id="email" name="email" placeholder="Your Email" required>
                </div>
                <div class="form-group">
                    <label for="message">Message :</label>
                    <textarea id="message" name="message" rows="5" placeholder="Your Message" required></textarea>
                </div>
                <button type="submit" class="btn">Submit</button>
            </form>
          </fieldset>
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
