<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpServlet" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Submission</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-5">Request Submission</h2>
    <%
        String bookID = request.getParameter("BookID");
        String bookName = request.getParameter("BookName");
        String edition = request.getParameter("Edition");
        String username = request.getParameter("username");
        String usn = request.getParameter("usn");
        String request_date = request.getParameter("request_date");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminlogin", "root", "#Dhuvihegde26");
            String query = "INSERT INTO bookrequests (BookID, BookName, Edition, username, usn,request_date) VALUES (?, ?, ?, ?, ?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, bookID);
            pstmt.setString(2, bookName);
            pstmt.setString(3, edition);
            pstmt.setString(4, username);
            pstmt.setString(5, usn);
            pstmt.setString(6, request_date);
            int rowCount = pstmt.executeUpdate();

            if(rowCount > 0) {
                out.println("<div class='alert alert-success' role='alert'>Request submitted successfully!</div>");
            } else {
                out.println("<div class='alert alert-danger' role='alert'>Failed to submit request.</div>");
            }

            pstmt.close();
            con.close();
        } catch(Exception e) {
            out.println("<div class='alert alert-danger' role='alert'>Error: " + e.getMessage() + "</div>");
            e.printStackTrace();
        }
    %>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
