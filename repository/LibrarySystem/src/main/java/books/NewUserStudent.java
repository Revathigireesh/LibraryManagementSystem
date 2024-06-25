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
/**
 * Servlet implementation class Demo
 */
//... (import statements)
@WebServlet("/abd")
public class NewUserStudent extends HttpServlet {
 private static final long serialVersionUID = 1L;
 private static final String INSERT_QUERY = "INSERT INTO newuserstudent(username, password,confirmpassword,email,usn,branch) VALUES(?,?,?,?,?,?)";

 public NewUserStudent() {
     super();
 }
 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 response.setContentType("text/html");
	    PrintWriter pw = response.getWriter();

	    String username = request.getParameter("username");
	    String password = request.getParameter("password");
	    String confirmPassword = request.getParameter("confirmPassword");// Add this line to get confirm password
	    String email = request.getParameter("email");
	    String usn = request.getParameter("usn");
	    String branch = request.getParameter("branch");
	    try {
	        if (username != null && !username.isEmpty() && password != null && !password.isEmpty()) { // Check if name and password are not null or empty
	            if (!password.equals(confirmPassword)) { // Check if passwords match
	                pw.println("Passwords do not match");
	                return;
	            }
	            Class.forName("com.mysql.cj.jdbc.Driver");
	            try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "your_password");
	                 PreparedStatement psCheck = con.prepareStatement("SELECT * FROM newuserstudent WHERE usn = ?");
	                 PreparedStatement psInsert = con.prepareStatement(INSERT_QUERY)) {

	                // Check if username already exists
	                psCheck.setString(1, usn);
	                ResultSet rs = psCheck.executeQuery();
	                if (rs.next()) {
	                    pw.println("Username already registered");
	                    return;
	                }
	                
	                // Insert new user record
	                psInsert.setString(1, username);
	                psInsert.setString(2, password);
	                psInsert.setString(3, confirmPassword);
	                psInsert.setString(4, email);
	                psInsert.setString(5, usn);
	                psInsert.setString(6, branch);

	                int count = psInsert.executeUpdate();

	                if (count == 0) {
	                    pw.println("Record not stored into the database");
	                } else {
	                    response.sendRedirect("studentDahboard.jsp");
	                }
	            }
	        } else {
	            pw.println("Name and Password cannot be null or empty");
	        }
	    } catch (ClassNotFoundException | SQLException e) {
	        pw.println("Error: " + e.getMessage());
	        e.printStackTrace();
	    } catch (Exception e) {
	        pw.println("Error: " + e.getMessage());
	        e.printStackTrace();
	    } finally {
	        pw.close();
	    }
 }
}
