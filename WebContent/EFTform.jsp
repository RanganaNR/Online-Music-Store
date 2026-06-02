<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pricing - Music Store</title>
    <style>

      
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
                    <li><a href="index.html">Home</a></li>
                    <li><a href="features.html">Features</a></li>
                    <li><a href="#pricing">Pricing</a></li>
                    <li><a href="contactUs.html">Contact</a></li>
                </ul>
                <div class="search-container">
                    <input type="text" placeholder="Search...">
                    <button type="submit">Search</button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Payment Section -->
    <form action="eft" method="POST">
        <div class="container1">
            <div class="right-side">
                <h2>Select Payment Method</h2>
                <div class="payment-method">
                    <a href="CardForm.jsp" class="Button">Card Payment</a>
                    <a href="EFTform.jsp" class="Button">EFT Payment</a>
                </div>

                <!-- EFT Payment Form (Initially Hidden) -->
                <div id="eftForm" class="payment-form hidden">
                    <h3>EFT Payment</h3>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="Name" required>

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="Address" required>

                    <label for="postalCode">Postal Code:</label>
                    <input type="text" id="postalCode" name="Postal_code" required>

                    <label for="eftAmount">Payment Amount (Rs.):</label>
                    <input type="number" id="eftAmount" name="Payment_amount" required>

                    <label for="date">Payment Date:</label>
                    <input type="date" id="date" name="Payment_date" required>

                    <label for="bank">Bank Name:</label>
                    <input type="text" id="bank" name="Bank_name" required>

                    <label for="branch">Branch:</label>
                    <input type="text" id="branch" name="Branch" required>

                    <label for="accountNumber">Account Number:</label>
                    <input type="text" id="accountNumber" name="Acc_no" required>
                </div>

                <label>Payment Type:</label>
                <div class="payment-type">
                    <select id="paymentType" name="Payment_type" required>
                        <option value="pay1">--select--</option>
                        <option value="direct deposit">Direct Deposit</option>
                        <option value="mobile wallet">Mobile Wallet</option>
                        <option value="wire transfer">Wire Transfer</option>
                    </select>
                </div>
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
