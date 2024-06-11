package books;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/awe")
public class NewadminLog extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String SELECT_QUERY = "SELECT password FROM newuseradmin WHERE username = ? AND adminid = ?";

    public NewadminLog() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // This servlet will handle both GET and POST requests
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter pw = response.getWriter();

        String username = request.getParameter("username");
        String adminid = request.getParameter("adminid");
        String password = request.getParameter("password");
        
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminlogin", "root", "#Dhuvihegde26");
             PreparedStatement ps = con.prepareStatement(SELECT_QUERY)) {

            ps.setString(1, username);
            ps.setString(2, adminid);
            
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String storedPassword = rs.getString("password");
                    if (storedPassword.equals(password)) {
                    	 request.setAttribute("adminid", adminid);
                         // Forward the request to the JSP
                         request.getRequestDispatcher("AdminDashboard.jsp").forward(request, response);
                       
                    } else {
                        pw.println("Invalid Username or Password!");
                    }
                } else {
                    pw.println("User not found!");
                }
            }
        } catch (SQLException e) {
            pw.println("Error: " + e.getMessage());
            e.printStackTrace();
        }
    }
}