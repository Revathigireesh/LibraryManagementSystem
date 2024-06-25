<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Profile</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        body { background-color: #f2f6fc; color: #69707a; }
        .container { margin-top: 20px; }
        .card { box-shadow: 0 0.15rem 1.75rem 0 rgb(33 40 50 / 15%); }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <div class="card-header">Update Profile</div>
        <div class="card-body">
             <%
                String usn = "";
                String branch = "";
                String phone = "";
                String location = "";
                String birthday = "";

                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "your_password");

                    String query = "SELECT * FROM newuserstudent WHERE usn = ?"; // Assuming usn is unique
                    ps = con.prepareStatement(query);
                    ps.setString(1, request.getParameter("usn"));
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        usn = rs.getString("usn");
                        phone = rs.getString("phone");
                        branch = rs.getString("branch");
                        location = rs.getString("location");
                        birthday = rs.getString("birthday");
                    }
                } catch (Exception e) {
                    out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            %>

            <%-- Display the profile update form --%>
            <form method="post">
                <div class="form-group">
                    <label for="usn">USN</label>
                    <input type="text" class="form-control" id="usn" name="usn" readonly value="<%= usn %>">
                </div>
                <div class="form-group">
                    <label for="branch">Branch</label>
                    <input type="text" class="form-control" id="branch" name="branch" readonly value="<%= branch %>">
                </div>
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" class="form-control" id="phone" name="phone" placeholder="Enter your phone number" value="<%= phone %>">
                </div>
                <div class="form-group">
                    <label for="location">Location</label>
                    <input type="text" class="form-control" id="location" name="location" placeholder="Enter your location" value="<%= location %>">
                </div>
                <div class="form-group">
                    <label for="birthday">Birthday</label>
                    <input type="date" class="form-control" id="birthday" name="birthday" value="<%= birthday %>">
                </div>
                <button type="submit" class="btn btn-primary">Save changes</button>
            </form>

            <%-- Handle the form submission and update the database --%>
            <%
                if (request.getMethod().equals("POST")) {
                    String newPhone = request.getParameter("phone");
                    String newLocation = request.getParameter("location");
                    String newBirthday = request.getParameter("birthday");

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "#Dhuvihegde26");

                        String updateQuery = "UPDATE newuserstudent SET phone = ?, location = ?, birthday = ? WHERE usn = ?";
                        ps = con.prepareStatement(updateQuery);
                        ps.setString(1, newPhone);
                        ps.setString(2, newLocation);
                        ps.setString(3, newBirthday);
                        ps.setString(4, usn);

                        int rowsUpdated = ps.executeUpdate();

                        if (rowsUpdated > 0) {
                            out.println("<div class='alert alert-success'>Profile updated successfully!</div>");
                        } else {
                            out.println("<div class='alert alert-danger'>Error updating profile. Please try again.</div>");
                        }
                    } catch (Exception e) {
                        out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
                        e.printStackTrace();
                    } finally {
                        try {
                            if (ps != null) ps.close();
                            if (con != null) con.close();
                        } catch (SQLException e) {
                            e.printStackTrace(); // Print stack trace without passing out object
                        }
                    }
                }
            %>
        </div>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
