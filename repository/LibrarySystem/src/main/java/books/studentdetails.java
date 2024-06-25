package books;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/studentDetails")
public class studentdetails extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Retrieve the logged-in USN from the session or request attribute
        String usn = request.getParameter("usn");

        if (usn != null && !usn.isEmpty()) {
            try {
                // Load the JDBC driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Establish a connection to the database
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/studentlogin", "root", "your_password");

                // Prepare the SQL query to fetch student details by USN
                String query = "SELECT username, email, usn, branch FROM newuserstudent WHERE usn=?";
                PreparedStatement ps = conn.prepareStatement(query);
                ps.setString(1, usn);

                // Execute the query
                ResultSet rs = ps.executeQuery();

                // Check if student details are found
                if (rs.next()) {
                    // Forward the retrieved student information to the JSP page
                    request.setAttribute("username", rs.getString("username"));
                    request.setAttribute("email", rs.getString("email"));
                    request.setAttribute("usn", rs.getString("usn"));
                    request.setAttribute("branch", rs.getString("branch"));
                    request.getRequestDispatcher("").forward(request, response);
                } else {
                    out.println("No student found with the provided USN.");
                }

                // Close resources
                rs.close();
                ps.close();
                conn.close();
            } catch (Exception e) {
                out.println("<div style='background-color: #f8d7da; padding: 15px; text-align: center;'>Error: " + e.getMessage() + "</div>");
                e.printStackTrace(out);
            }
        } else {
            out.println("Please provide a valid USN.");
        }
    }
}
