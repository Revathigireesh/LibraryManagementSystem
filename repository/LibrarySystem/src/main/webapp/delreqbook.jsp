<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Request</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-body">
            <h5 class="card-title">Delete Request</h5>
            <%
                String bookID = request.getParameter("BookID");

                // Debugging: Print the value to check if it is retrieved correctly
                out.println("BookID: " + bookID + "<br>");

                Connection conAdmin = null;
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Connect to admin database
                    conAdmin = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminlogin", "root", "your_password");

                    // Delete request details from admin database
                    PreparedStatement pstDelete = conAdmin.prepareStatement("DELETE FROM requestedbooks WHERE BookID = ?");
                    pstDelete.setInt(1, Integer.parseInt(bookID));  // Ensure bookID is an integer
                    int result = pstDelete.executeUpdate();

                    if (result > 0) {
                        out.println("<div class='alert alert-success' role='alert'>Request deleted successfully!</div>");
                    } else {
                        out.println("<div class='alert alert-danger' role='alert'>Failed to delete request.</div>");
                    }

                    pstDelete.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                    e.printStackTrace();
                } finally {
                    if (conAdmin != null) {
                        try {
                            conAdmin.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }
            %>
            <a href="disreqbookstu.jsp" class="btn btn-primary">Back to Books List</a>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
