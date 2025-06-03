# Restaurant Feedback Application

A simple JSP-based web application for collecting and displaying customer feedback for a restaurant.

## Overview

This application consists of:
- A feedback form where customers can input their experience details
- A confirmation page that displays the submitted feedback

## Requirements

- Java Development Kit (JDK) 8 or higher
- Apache Tomcat 9.x or higher
- Web browser

## Installation & Deployment Instructions

### Option 1: Deploy the Provided WAR File

1. **Download the application**
   - Download the `RestaurantFeedbackApp.war` file from the provided source

2. **Deploy to Tomcat**
   - Locate your Tomcat installation directory (referred to as `CATALINA_HOME`)
   - Copy the `RestaurantFeedbackApp.war` file to `CATALINA_HOME/webapps/` directory
   - If Tomcat is running, it will automatically deploy the application
   - If Tomcat is not running, start it using the startup script:
     - Windows: `CATALINA_HOME\bin\startup.bat`
     - macOS/Linux: `CATALINA_HOME/bin/startup.sh`

### Option 2: Deploy the Webapp Directory

1. **Download the application**
   - Download the entire `RestaurantFeedbackApp` directory

2. **Deploy to Tomcat**
   - Locate your Tomcat installation directory (referred to as `CATALINA_HOME`)
   - Copy the entire `RestaurantFeedbackApp` directory to `CATALINA_HOME/webapps/` directory
   - Restart Tomcat if it's already running:
     - Windows: Run `CATALINA_HOME\bin\shutdown.bat` followed by `CATALINA_HOME\bin\startup.bat`
     - macOS/Linux: Run `CATALINA_HOME/bin/shutdown.sh` followed by `CATALINA_HOME/bin/startup.sh`

## Accessing the Application

1. Start your web browser
2. Navigate to: `http://localhost:8080/RestaurantFeedbackApp/`
   - If you've configured Tomcat to use a different port, replace 8080 with your port number

## Application Usage

1. Fill out the feedback form with your information:
   - Full Name
   - Email Address
   - Date of Visit
   - Service Rating (1-5)
   - Additional Comments

2. Click "Submit Feedback" to submit the form
3. View the confirmation page displaying your submitted feedback

## Troubleshooting

1. **Application doesn't load**
   - Verify Tomcat is running
   - Check Tomcat logs at `CATALINA_HOME/logs/` for any errors
   - Ensure the application was deployed correctly

2. **404 Error**
   - Make sure you're using the correct URL
   - Check if the application directory exists in `CATALINA_HOME/webapps/`
   - Verify the WAR file was properly deployed

3. **Form submission errors**
   - Ensure all required fields are completed
   - Check that the date format is valid

## File Structure
Please see [CONTRIBUTING](CONTRIBUTING.md) for more info.
