<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add New Song</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef; /* Light background color */
            margin: 0;
            padding: 50px 0; /* Space around the form */
        }
        .form-container {
            background-color: #f2f2f2;
            padding: 30px; /* Increased padding */
            border-radius: 8px; /* Slightly rounder corners */
            width: 600px;
            margin: auto;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); /* Soft shadow */
        }
        h2 {
            text-align: center; /* Centered heading */
            color: #333; /* Darker heading color */
        }
        label {
            font-weight: bold;
            display: block; /* Block display for better alignment */
            margin-bottom: 5px; /* Space below labels */
            color: #555; /* Slightly lighter label color */
        }
        input[type="text"],
        input[type="file"],
        textarea {
            width: 100%; /* Full width */
            padding: 10px; /* Padding inside input fields */
            margin-bottom: 20px; /* Space below inputs */
            border: 1px solid #ccc; /* Light border */
            border-radius: 4px; /* Rounded corners */
            box-sizing: border-box; /* Include padding in width */
        }
        textarea {
            resize: vertical; /* Allow vertical resizing */
            height: 100px; /* Default height */
        }
        input[type="submit"] {
            background-color: #28a745; /* Green background */
            color: white; /* White text */
            padding: 10px; /* Padding */
            border: none; /* No border */
            border-radius: 5px; /* Rounded corners */
            font-size: 16px; /* Larger font size */
            cursor: pointer; /* Pointer cursor on hover */
            transition: background-color 0.3s ease; /* Smooth transition */
            width: 100%; /* Full width */
        }
        input[type="submit"]:hover {
            background-color: #218838; /* Darker green on hover */
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Add New Song</h2>
        <form action="upload" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>
            
            <label for="description">Description:</label>
            <textarea id="description" name="description" required></textarea>
            
            <label for="file">Upload MP3:</label>
            <input type="file" id="file" name="file" accept=".mp3" required> <!-- MP3 upload field -->
            
            <label for="image">Upload Image (optional):</label>
            <input type="file" id="image" name="image" accept=".jpg,.jpeg,.png"> <!-- Image upload field -->

            <input type="submit" value="Upload Music">
        </form>
    </div>
</body>
</html>
