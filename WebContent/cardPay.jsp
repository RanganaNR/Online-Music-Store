<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing - Music Store</title>
    <link rel="stylesheet" href="pricing.css">

    <style>
        /* Base Styles */
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            line-height: 1.6;
            background-color: #f8f9fa;
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

        /* Pricing Section */
        .pricing {
            padding: 2rem 0;
            text-align: center;
            background: #f4f4f4;
        }

        /* Footer Section */
        footer {
            background: #333;
            color: #fff;
            padding: 1rem 0;
            text-align: center;
            margin-top: 2rem;
        }

        .container1 {
            display: flex;
            justify-content: space-between;
            padding: 20px;
            margin: auto;
            max-width: 800px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .right-side {
            width: 100%;
        }

        h2, h3 {
            color: #333;
            text-align: center;
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

        /* Adjust the select field size */
        select {
            width: 50%; /* Smaller width */
            margin: 5px auto; /* Center the select field */
            display: block; /* Center in block layout */
        }

        button {
            display: inline-block;
            padding: 10px 20px;
            margin-top: 20px;
            background-color: #efb446;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #a4a025;
        }

        /* Centering buttons */
        .buttons {
            text-align: center; /* Center the buttons */
            margin-top: 20px;
        }

        .payment-method {
            margin: 20px 0;
            display: flex;
            justify-content: center; /* Center align payment method selection */
            flex-direction: column; /* Stack vertically */
            align-items: center; /* Center items */
        }

        .payment-method label {
            display: flex;
            align-items: center;
            justify-content: center; /* Center the label text */
        }

        .payment-method img {
            width: 100px; /* Adjust size of payment method icons */
            height: auto; /* Maintain aspect ratio */
            margin-left: 10px;
        }
    </style>

    <script>
        // JavaScript validation function
        function validateForm() {
            const amount = document.getElementById('cardAmount').value;
            const cardNo = document.getElementById('cardNo').value;

            // Validate payment amount
            if (amount <= 0) {
                alert("Payment amount cannot be negative or zero.");
                return false;
            }

            // Validate card number format (16 digits)
            const cardNoPattern = /^\d{16}$/;
            if (!cardNoPattern.test(cardNo)) {
                alert("Card number must be exactly 16 digits.");
                return false;
            }

            // Form is valid
            return true;
        }
    </script>
</head>
<body>
    <!-- Header Section -->
    <header>
        <div class="container">
            <h1>Music Store</h1>
            <nav>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="features.jsp">Features</a></li>
                    <li><a href="pricing.jsp">Pricing</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <form id="personalForm" action="pay" method="POST" onsubmit="return validateForm();">
        <div class="container1">
            <!-- Right side: Payment Method Selection -->
            <div class="right-side">
                <div class="payment-method">
                    <label for="cardType">
                        Select Your Payment Method
                        <img src="img/paymethods.jpg" alt="Payment Methods">
                    </label>
                    <select id="cardType" name="Card_type" required>
                        <option value="pay1">--select--</option>
                        <option value="visa">Visa</option>
                        <option value="mastercard">MasterCard</option>
                        <option value="amex">American Express</option>
                    </select>
                </div>

                <h3>Card Payment Details</h3>
                <label for="name">Name:</label>
                <input type="text" id="name" name="Name" required>

                <label for="address">Address:</label>
                <input type="text" id="address" name="Address" required>

                <label for="postalCode">Postal Code:</label>
                <input type="text" id="postalCode" name="Postal_code" required>

                <label for="cardAmount">Payment Amount (Rs.):</label>
                <input type="number" id="cardAmount" name="Pay_amount" required>

                <label for="date">Payment Date:</label>
                <input type="date" id="date" name="Payment_date" required>

                <label for="cardNo">Card No:</label>
                <input type="text" id="cardNo" name="Card_no" required>

                <label for="cvc">CVC:</label>
                <input type="text" id="cvc" name="CVC" required>

                <label for="expiryDate">Expiry Date (MM/YY):</label>
                <input type="date" id="expiryDate" name="Expire_date" required>
            </div>
        </div>

        <!-- Submit and Clear Buttons -->
        <div class="buttons">
            <button type="submit">Submit</button>
            <button type="reset" id="resetButton">Clear Data</button>
        </div>
    </form>

    <!-- Footer Section -->
    <footer>
        <div class="container">
            <p>&copy; 2024 Music Store. All rights reserved.</p>
        </div>
    </footer>
</body>
</html>
