<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<%@ page import="payment.CardDBUtil, payment.Payment_card, java.util.List" %>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Display message as a JavaScript alert if present -->
<c:if test="${not empty param.message}">
    <script type="text/javascript">
        alert("${param.message}");
    </script>
</c:if>

<!-- Display error message if exists -->
<c:if test="${not empty errorMessage}">
    <p style="color:red;">${errorMessage}</p>
</c:if>

<!-- Card Payments Dashboard -->
<div class="dashboard-container">
    <h2>Card Payments Dashboard</h2>

    <div class="payment-container">
        <c:forEach var="payment" items="${CardDBUtil.getCardPaymentsAsArrayList()}">

            <c:set var="Card_payment_id" value="${payment.card_payment_id}"/>
            <c:set var="Name" value="${payment.name}"/>
            <c:set var="Address" value="${payment.address}"/>
            <c:set var="Postal_code" value="${payment.postal_code}"/>
            <c:set var="Pay_amount" value="${payment.pay_amount}"/>
            <c:set var="Payment_date" value="${payment.payment_date}"/>
            <c:set var="Card_no" value="${payment.card_no}"/>
            <c:set var="CVC" value="${payment.CVC}"/>
            <c:set var="Expire_date" value="${payment.expire_date}"/>

            <div class="payment-card">
                <h3>Payment ID: ${payment.card_payment_id}</h3>
                <p><strong>Name:</strong> ${payment.name}</p>
                <p><strong>Address:</strong> ${payment.address}</p>
                <p><strong>Postal Code:</strong> ${payment.postal_code}</p>
                <p><strong>Payment Amount:</strong> ${payment.pay_amount}</p>
                <p><strong>Payment Date:</strong> ${payment.payment_date}</p>
                <p><strong>Card Type:</strong> ${payment.card_type}</p>
                <p><strong>Card Number:</strong>
                    <c:out value="**** **** **** ${fn:substring(payment.card_no, fn:length(payment.card_no)-4, fn:length(payment.card_no))}"/>
                </p>
                <p><strong>CVC:</strong> ${payment.CVC}</p>
                <p><strong>Expiry Date:</strong> ${payment.expire_date}</p>
                <div class="payment-actions">

                    <c:url value="updateCard.jsp" var="updateCard">
                        <c:param name="Card_payment_id" value="${Card_payment_id}"/>
                        <c:param name="Name" value="${Name}"/>
                        <c:param name="Address" value="${Address}"/>
                        <c:param name="Postal_code" value="${Postal_code}"/>
                        <c:param name="Pay_amount" value="${Pay_amount}"/>
                        <c:param name="Payment_date" value="${Payment_date}"/>
                        <c:param name="Card_no" value="${Card_no}"/>
                        <c:param name="CVC" value="${CVC}"/>
                        <c:param name="Expire_date" value="${Expire_date}"/>
                    </c:url>
                    <a href="${updateCard}">
                        <input type="button" name="updateCard" value="Edit" class="btn-update">
                    </a>

                    <form action="deleteC" method="post" style="display:inline;">
                        <input type="hidden" name="Card_payment_id" value="${payment.card_payment_id}">
                        <input type="submit" value="Delete" onclick="return confirm('Are you sure you want to delete this payment?');" class="btn-delete">
                    </form>
                </div>
            </div>
        </c:forEach>
    </div>

    <!-- Back to Payment Form Button -->
    <div class="back-button">
        <a href="cardPay.jsp"><button class="btn-back">Back to Payment Form</button></a>
    </div>
</div>

<!-- CSS styles -->
<style>
    .dashboard-container {
        margin-bottom: 20px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 8px;
        background-color: #f9f9f9;
    }
    .payment-container {
        display: flex;
        flex-wrap: wrap; /* Allow the cards to wrap if there isn't enough space */
        gap: 20px; /* Space between cards */
        justify-content: center; /* Center the cards horizontally */
    }
    .payment-card {
        background-color: #fff;
        border: 1px solid #ccc;
        border-radius: 8px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        padding: 15px;
        transition: transform 0.2s;
        width: 300px; /* Set a larger width for the cards */
    }
    .payment-card:hover {
        transform: scale(1.02);
    }
    .payment-actions {
        margin-top: 10px;
        display: flex;
        justify-content: space-between;
    }
    .btn-update, .btn-delete, .btn-back {
        padding: 6px 10px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }
    .btn-update {
        background-color: #4CAF50;
        color: white;
    }
    .btn-delete {
        background-color: #f44336;
        color: white;
    }
    .btn-back {
        background-color: #007BFF;
        color: white;
        display: block;
        margin: 20px auto;
        padding: 8px 12px;
    }
    .btn-back:hover, .btn-update:hover, .btn-delete:hover {
        opacity: 0.9;
    }
    .back-button {
        text-align: center;
    }
</style>
