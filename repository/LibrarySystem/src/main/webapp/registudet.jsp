<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: rgb(201, 201, 232);
        }
        .container {
            margin-top: 30px;
            outline-color: black;
        }
        .table {
            background-color: #f8f9fa; /* Light background color for the table */
        }
        th, td {
            padding: 10px; /* Add padding to create margin-like space */
        }
        th{
            background-color: #a0051a;
            color: #dee2e6;
        }
        .table-bordered {
            border: 1px solid #dee2e6;
            border-spacing: 10px; /* Adjust this value to control spacing */
        }
        .btn-link {
            color: #1520b9; /* Bootstrap link button color */
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" id="searchInput" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="searchTable()">Search</button>
            </form>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="card">
        <table class="table table-bordered align-middle mb-0 bg-white" id="booksTable">
            <thead class="bg-light">
            <tr>
                <th>Student Name</th>
                <th>Email</th>
                <th>USN</th>
                <th>Branch</th>
            </tr>
            </thead>
            <tbody>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "#Dhuvihegde26");
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM newuserstudent");

                    while(rs.next()) { 
            %>
            <tr>
                <td><%=rs.getString("username") %></td>
                <td><%= rs.getString("email") %></td>
                <td><%= rs.getString("usn") %></td>
                <td><%= rs.getString("branch") %></td>
            </tr>
            <% 
                    }
                    rs.close();
                    st.close();
                    con.close();
                } catch(Exception e) {
                    out.println("Error: " + e.getMessage());
                    e.printStackTrace();
                }
            %>
            </tbody>
        </table>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function searchTable() {
        var input, filter, table, tr, td, i, txtValue;
        input = document.getElementById("searchInput");
        filter = input.value.toUpperCase();
        table = document.getElementById("booksTable");
        tr = table.getElementsByTagName("tr");

        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[1]; // Index 1 corresponds to the Book Name column
            if (td) {
                txtValue = td.textContent || td.innerText;
                if (txtValue.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }
        }

        // Clear search input and display all rows if input is empty
        if (filter === "") {
            for (i = 0; i < tr.length; i++) {
                tr[i].style.display = "";
            }
        }
    }
    // Update search results while typing
    document.getElementById("searchInput").addEventListener("input", searchTable);
</script>


</body>
</html>
