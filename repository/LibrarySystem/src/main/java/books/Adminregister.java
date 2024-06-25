package books;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
@WebServlet("/shwetha")
public class Adminregister extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String INSERT_QUERY = "INSERT INTO newuseradmin(username, password, confirmpassword, email, adminid) VALUES(?,?,?,?,?)";

    public Adminregister() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String email = request.getParameter("email");
        String adminid = request.getParameter("adminid");

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminlogin", "root", "your_password");
                 PreparedStatement psCheck = con.prepareStatement("SELECT * FROM newuseradmin WHERE adminid=?")) {

                // Check if the user with the given admin ID already exists
                psCheck.setString(1, adminid);
                ResultSet rs = psCheck.executeQuery();
                if (rs.next()) {
                    // User already exists, display alert message
                	// User already exists, display alert message and redirect to the register page
                    pw.println("<script>alert('User already exists'); window.location.href = 'adminregi.html';</script>");
                   
                    return;
                }
                // Check if the required fields are not empty
                if (username != null && !username.isEmpty() && 
                    password != null && !password.isEmpty() && 
                    confirmpassword != null && !confirmpassword.isEmpty()) {
                    
                    // Check if passwords match
                    if (!password.equals(confirmpassword)) {
                        pw.println("Passwords do not match");
                        return;
                    }

                    // Proceed with registration
                    try (PreparedStatement psInsert = con.prepareStatement(INSERT_QUERY)) {
                        // Set parameters for the INSERT query
                        psInsert.setString(1, username);
                        psInsert.setString(2, password);
                        psInsert.setString(3, confirmpassword);
                        psInsert.setString(4, email);
                        psInsert.setString(5, adminid);

                        // Execute the INSERT query
                        int count = psInsert.executeUpdate();

                        if (count == 0) {
                            pw.println("Record not stored into the database");
                        } else {
                            // Redirect to the admin dashboard
                            response.sendRedirect("welcome.jsp");
                        }
                    }
                } else {
                    // Required fields are empty, display alert message
                    pw.println("<script>alert('Username, password, and confirm password cannot be null or empty');</script>");
                }
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Handle ClassNotFoundException and SQLException
            pw.println("Error: " + e.getMessage());
            e.printStackTrace();
        } catch (Exception e) {
            // Handle other exceptions
            pw.println("Error: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close PrintWriter
            pw.close();
        }
    }
}

