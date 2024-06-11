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
import java.sql.SQLException;
/**
 * Servlet implementation class Demo
 */
//... (import statements)

@WebServlet("/Option2Servlet")
public class ToAddNewBook extends HttpServlet {
 private static final long serialVersionUID = 1L;
 private static final String INSERT_QUERY = "INSERT INTO booksdetail(BookName, Edition, Author) VALUES(?, ?, ?)";

 public ToAddNewBook() {
     super();
 }

 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     response.setContentType("text/html");
     PrintWriter pw = response.getWriter();

     String BookName = request.getParameter("BookName");
     String Edition = request.getParameter("Edition");
     String Author = request.getParameter("Author");

     try {
         Class.forName("com.mysql.cj.jdbc.Driver");
         try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adminlogin", "root", "#Dhuvihegde26");
              PreparedStatement ps = con.prepareStatement(INSERT_QUERY)) {

             ps.setString(1, BookName);
             ps.setString(2, Edition);
             ps.setString(3, Author);

             int count = ps.executeUpdate();
             if (count == 0) {
                 pw.println("Record not stored into the database");
             } else {
                 pw.println("<script>alert('Record Stored Successfully '); window.location.href = 'Displaybookadmin.jsp';</script>");
             }
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

 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
     doGet(request, response);
 }
}
