package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CancelServlet
 */
@WebServlet("/CancelServlet")
public class CancelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		System.out.println("debug6");
		Connection conn = null;
		PreparedStatement ps = null;
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();
		
		String strStudentId = request.getParameter("id"); 
		int studentId = Integer.parseInt(strStudentId);
		
		System.out.println("debug7");
		try{
			//Create connection to database
			Class.forName("com.mysql.jdbc.Driver");
			String connectionUrl = "jdbc:mysql://localhost/bookingadvisordb";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
						
			//Delete the selected user's info from database			
			ps= conn.prepareStatement("DELETE FROM bookingadvisordb.studentbooking WHERE studentid = ?");
			ps.setInt(1, studentId);
			ps.executeUpdate();	
			//ps.executeUpdate();	//twice?
			
			//Display deletion is successful
			pw.println("<html><body bgcolor=\"#EBF4FD\">");
			pw.println(" Deletion succeeded!<br>");
		}
		catch(Exception e) {
			//Display insertion alert
			pw.println("<html><body bgcolor=\"#EBF4FD\">");
			pw.println(" Deletion Failed!<br>" + e);
		}
		
		pw.println("<br><br><b><a href='http://localhost:8080/BookingApp/"
					+ "StudentBooking.html'>Back</a></b>");	
		pw.println("</body></html>");
	}
}


