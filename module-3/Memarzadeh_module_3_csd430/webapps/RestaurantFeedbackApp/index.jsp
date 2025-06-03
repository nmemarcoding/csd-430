<!-- Name: Nima Memarzadeh -->
<!-- Date: 06/04/2025 -->
<!-- Module 3 Assignment - Working with JSP Forms -->

<!-- Description: This JSP page collects customer feedback for a restaurant -->

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Feedback Form</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">  <!-- Ensures responsive design -->
    <link rel="stylesheet" type="text/css" href="styles.css">  <!-- Links to external CSS file -->

</head>
<body>
    <h1>Customer Experience Feedback</h1>  <!-- Page heading -->
    <p>Please fill out the form below to help us improve our service.</p>  <!-- Instructional text -->

    <form name="feedbackForm" action="displayFeedback.jsp" method="post">  <!-- Form with POST method that submits to displayFeedback.jsp -->
        <table border="1" cellpadding="5">  <!-- Table for organizing form fields -->
            <tr>
                <td><label for="fullName">Full Name:</label></td>
                <td><input type="text" id="fullName" name="fullName" required></td>  <!-- Name input field -->
            </tr>
            <tr>
                <td><label for="email">Email Address:</label></td>
                <td><input type="email" id="email" name="email" required></td>  <!-- Email input field with validation -->
            </tr>
            <tr>
                <td><label for="visitDate">Date</select> of Visit:</label></td>
                <td><input type="date" id="visitDate" name="visitDate" required></td>  <!-- Date picker for visit date -->
            </tr>
            <tr>
                <td><label for="rating">Service Rating (1 to 5):</label></td>
                <td>
                    <select id="rating" name="rating" required>  <!-- Dropdown for rating selection -->
                        <option value="1">1 - Poor</option>
                        <option value="2">2</option>
                        <option value="3">3 - Average</option>
                        <option value="4">4</option>
                        <option value="5">5 - Excellent</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="comments">Additional Comments:</label></td>
                <td><textarea id="comments" name="comments" rows="4" cols="40"></textarea></td>  <!-- Text area for additional feedback -->
            </tr>
        </table>

        <br>
        <input type="reset" value="Clear">  <!-- Button to reset the form -->
        <input type="submit" value="Submit Feedback">  <!-- Button to submit the form -->
    </form>
</body>
</html>
