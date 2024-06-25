<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .navbar-custom {
            background-color: #755100;
        }
        .navbar-custom .navbar-nav .nav-link {
            color: white;
        }
        .centered {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .user-details-container {
            background-color: #fff;
            padding: 50px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-align: center;
        }
        .user-details-container h2 {
            color: #333;
            text-align: center;
        }
    </style>
</head>
<body style="background-color:#bd8600">
<nav class="navbar navbar-expand-lg navbar-custom">
    <div class="container-fluid">
        <a class="navbar-brand" href="Homepage.html">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#" >Search books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" >View Borrowed books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Return books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Renew books</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="studentloginpage.html">Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<h1 style="margin-left:240px;padding:30px;">Welcome to our hub of inspiration and learning!!</h1>
<div class="container">
    <div class="user-details-container">
        <%
    String username = request.getParameter("username");
   
    // Database Connection
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    // Validate if username is provided
    if (username == null || username.isEmpty()) {
        out.println("<div style='background-color: #f8d7da; padding: 15px; text-align: center;'>Please provide a username.</div>");
        return;
    }
    try {
        // Establish database connection
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "your_password");

        // Debug statement to print the SQL query
        String query = "SELECT username, email, usn, branch FROM newuserstudent WHERE username=?";

        // Prepare SQL query to select user details based on username
        ps = con.prepareStatement(query);
        ps.setString(1, username);

        // Execute the query
        rs = ps.executeQuery();

        if (rs.next()) {
            // User found, display user details
%>
            <h2>User Details</h2>
            <p><strong>Username:</strong> <%= rs.getString("username") %></p>
            <p><strong>Email:</strong> <%= rs.getString("email") %></p>
            <p><strong>USN:</strong> <%= rs.getString("usn") %></p>
            <p><strong>Branch:</strong> <%= rs.getString("branch") %></p>
<%
        } else {
            // No user found with the provided username
%>
            <p>No user found with the provided username.</p>
<%
        }
    } catch(Exception e) {
        e.printStackTrace();
    } finally {
        try {
            // Close resources
            if(rs != null) rs.close();
            if(ps != null) ps.close();
            if(con != null) con.close();
        } catch(Exception e) {
            e.printStackTrace();
        }
    }
    %>
        <%-- Your Java code to retrieve user details goes here --%>
    </div>
</div>
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
