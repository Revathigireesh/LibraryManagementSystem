<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Submit Request</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Submit Request</h5>
            <%
                String bookID = request.getParameter("BookID");
                String bookName = request.getParameter("BookName");
                String edition = request.getParameter("Edition");
                String usn = request.getParameter("usn");
                String username = request.getParameter("username");
                String request_date=request.getParameter("request_date");

                // Debugging: Print the values to check if they are retrieved correctly
                out.println("BookID: " + bookID + "<br>");
                out.println("BookName: " + bookName + "<br>");
                out.println("Edition: " + edition + "<br>");
                out.println("USN: " + usn + "<br>");
                out.println("Username: " + username + "<br>");
                out.println("requested date:"+request_date+"<br>");

                Connection conAdmin = null;
                Connection conStudent = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Connect to student database
                    conStudent = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "your_password");

                    // Validate student details
                    PreparedStatement pst = conStudent.prepareStatement("SELECT * FROM newuserstudent WHERE usn = ? AND username = ?");
                    pst.setString(1, usn);
                    pst.setString(2, username);
                    ResultSet rs = pst.executeQuery();

                    if (rs.next()) {
                        // Connect to admin database
                        conAdmin = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminlogin", "root", "#Dhuvihegde26");

                        // Insert request details into admin database
                        PreparedStatement pstInsert = conAdmin.prepareStatement("INSERT INTO requestedbooks (BookID, BookName, Edition, usn, username,request_date) VALUES (?, ?, ?, ?, ?,?)");
                        pstInsert.setString(1, bookID);
                        pstInsert.setString(2, bookName);
                        pstInsert.setString(3, edition);
                        pstInsert.setString(4, usn);
                        pstInsert.setString(5, username);
                        pstInsert.setString(6,request_date);
                        int result = pstInsert.executeUpdate();

                        if (result > 0) {
                            out.println("<div class='alert alert-success' role='alert'>Request submitted successfully!</div>");
                        } else {
                            out.println("<div class='alert alert-danger' role='alert'>Failed to submit request.</div>");
                        }

                        pstInsert.close();
                    } else {
                        out.println("<div class='alert alert-danger' role='alert'>Student details not found. Please check your USN and Name.</div>");
                    }

                    rs.close();
                    pst.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                    e.printStackTrace();
                } finally {
                    if (conStudent != null) {
                        try {
                            conStudent.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                    if (conAdmin != null) {
                        try {
                            conAdmin.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
            <a href="studentDahboard.jsp" class="btn btn-primary">Back to Books List</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
