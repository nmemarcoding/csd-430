<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Feedback Form</title>
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
    <h1>Customer Experience Feedback</h1>
    <p>Please fill out the form below to help us improve our service.</p>

    <form name="feedbackForm" action="displayFeedback.jsp" method="post">
        <table border="1" cellpadding="5">
            <tr>
                <td><label for="fullName">Full Name:</label></td>
                <td><input type="text" id="fullName" name="fullName" required></td>
            </tr>
            <tr>
                <td><label for="email">Email Address:</label></td>
                <td><input type="email" id="email" name="email" required></td>
            </tr>
            <tr>
                <td><label for="visitDate">Date of Visit:</label></td>
                <td><input type="date" id="visitDate" name="visitDate" required></td>
            </tr>
            <tr>
                <td><label for="rating">Service Rating (1 to 5):</label></td>
                <td>
                    <select id="rating" name="rating" required>
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
                <td><textarea id="comments" name="comments" rows="4" cols="40"></textarea></td>
            </tr>
        </table>

        <br>
        <input type="reset" value="Clear">
        <input type="submit" value="Submit Feedback">
    </form>
</body>
</html>
