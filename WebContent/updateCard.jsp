<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Card Payment - Music Store</title>
    <link rel="stylesheet" href="pricing.css">
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
        header nav {
            margin-top: 10px;
        }
        /* Form Styles */
        .form-container {
            padding: 20px;
            background-color: #f4f4f4;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            margin-top: 10px;
            color: #555;
        }
        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 10px;
            background-color: #efb446;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #a4a025;
        }
    </style>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <h1>Music Store</h1>
            <nav>
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="features.html">Features</a></li>
                    <li><a href="#pricing">Pricing</a></li>
                    <li><a href="contactUs.html">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <div class="container">
    
    
<%
    String Card_payment_id = request.getParameter("Card_payment_id");
    String Name = request.getParameter("Name");
    String Address = request.getParameter("Address");
    String Postal_code = request.getParameter("Postal_code");
    String Pay_amount = request.getParameter("Pay_amount");
    String Payment_date = request.getParameter("Payment_date");
    String Card_no = request.getParameter("Card_no");
    String CVC = request.getParameter("CVC");
    String Expire_date = request.getParameter("Expire_date");
%>
    
        <h2>Update Card Payment</h2>
        <div class="form-container">
            <form action="card" method="POST">
                <input type="text" name="Card_payment_id" value="<%= Card_payment_id %>" readonly> <!-- Hidden field for payment ID -->
                
                <label for="name">Name:</label>
                <input type="text" id="name" name="Name" value="<%= Name %>" required>

                <label for="address">Address:</label>
                <input type="text" id="address" name="Address" value="<%= Address %>" required>

                <label for="postalCode">Postal Code:</label>
                <input type="text" id="postalCode" name="Postal_code" value="<%= Postal_code %>" required>

                <label for="cardAmount">Payment Amount (Rs.):</label>
                <input type="number" id="cardAmount" name="Pay_amount" value="<%= Pay_amount %>" required>
                
                <label for="date">Payment Date:</label>
                <input type="date" id="date" name="Payment_date" value="<%= Payment_date %>" required>


                <label for="cardNo">Card No:</label>
                <input type="text" id="cardNo" name="Card_no" value="<%= Card_no %>" required>

                <label for="cvc">CVC:</label>
                <input type="text" id="cvc" name="CVC" value="<%= CVC %>" required>

                <label for="expiryDate">Expiry Date (MM/YY):</label>
                <input type="text" id="expiryDate" name="Expire_date" value="<%= Expire_date %>" required>
                
                <!-- Submit and Clear Buttons -->
                <button type="submit">Update Payment</button>
                <button type="reset">Clear Data</button>
            </form>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Music Store. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
