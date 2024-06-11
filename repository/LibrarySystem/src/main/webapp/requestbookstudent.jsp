<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.ResultSet, java.sql.Statement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Request Book</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: rgb(201, 201, 232);
        }
        .container {
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Request Book</h5>
            <%
                String bookID = request.getParameter("BookID");
                String bookName = request.getParameter("BookName");
                String edition = request.getParameter("Edition");
            %>
            <form action="submitrequeststu.jsp" method="post">
                <div class="form-group">
                    <label for="BookID">Book ID</label>
                    <input type="text" class="form-control" id="BookID" name="BookID" value="<%= bookID %>" readonly>
                </div>
                <div class="form-group">
                    <label for="BookName">Book Name</label>
                    <input type="text" class="form-control" id="BookName" name="BookName" value="<%= bookName %>" readonly>
                </div>
                <div class="form-group">
                    <label for="Edition">Edition</label>
                    <input type="text" class="form-control" id="Edition" name="Edition" value="<%= edition %>" readonly>
                </div>
                <div class="form-group">
                    <label for="usn">USN</label>
                    <input type="text" class="form-control" id="usn" name="usn" required>
                </div>
                <div class="form-group">
                    <label for="username">Name</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                  <div class="form-group">
                    <label for="date">Date</label>
                    <input type="date" class="form-control" id="request_date" name="request_date" required>
                </div>
                <button type="submit" class="btn btn-primary">Submit Request</button>
            </form>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
