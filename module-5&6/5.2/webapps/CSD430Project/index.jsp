<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<!--
  index.jsp — Main navigation hub for CSD430 States Database Project
  Author: Nima Memarzadeh
-->
<html>
<head>
    <meta charset="UTF-8">
    <title>CSD430 - Nima's States Database Project</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Link to external CSS for styling -->
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <!-- Page header -->
    <header>
        <h1>CSD430 States Project</h1>
        <h2>By Nima Memarzadeh</h2>
    </header>

    <!-- Main navigation section -->
    <main>
        <section>
            <h3>Project Navigation</h3>
            <ul class="nav-list">
                <!-- Links to all CRUD and utility modules -->
                <li><a href="CreateTable.jsp">Create Table</a></li>
                <li><a href="PopulateTable.jsp">Populate Table</a></li>
                <li><a href="CRUD_Create.jsp">Create Record</a></li>
                <li><a href="CRUD_Read.jsp">View All Records</a></li>
                <li><a href="CRUD_Update.jsp">Update Record</a></li>
                <li><a href="CRUD_Delete.jsp">Delete Record</a></li>
                <li><a href="StateLookup.jsp">State Lookup</a></li>
            </ul>
        </section>
    </main>

</body>
</html>
