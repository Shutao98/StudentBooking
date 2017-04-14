package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudentBean;

/**
 * Servlet implementation class ViewServlet
 */
@WebServlet("/ViewServlet")
public class ViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ViewServlet() {
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

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;	
		
		//System.out.println("debug1");
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();		
		
		//Get the user name
		String strStudentId = request.getParameter("id"); 
		int studentId = Integer.parseInt(strStudentId);
		if(studentId == 0){
			//Display the alert when no name input for query
			pw.println("<html><body bgcolor=\"#EBF4FD\">");
			pw.println("You should input a student ID for query!<br> ");
			pw.println("<br><br><b><a href='http://localhost:8080/BookingApp/"
					+ "StudentBooking.html'>Back</a></b>");	
			pw.println("</body></html>");
			return;
		}
		
		try{
			//Create connection to database
			Class.forName("com.mysql.jdbc.Driver");
			String connectionUrl = "jdbc:mysql://localhost:3306/bookingadvisordb";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			
			//System.out.println("debug2");

			//Create the java statement
			stmt = conn.createStatement();
			
			//The SQL SELECT query 	      
			String query = "SELECT * FROM bookingadvisordb.studentbooking WHERE studentid ='" + studentId + "';";
		      
		    //Execute the query, and get a java result set
		    rs = stmt.executeQuery(query);				
		    
            if (rs.next()){          	           	
        		StudentBean student=new StudentBean(); 
        		
        		//below keys are from the column names in database:
        		int intID = Integer.parseInt(rs.getString("studentid"));
        		student.setStudentId(intID);
        		student.setName(rs.getString("studentname"));
        		System.out.println(rs.getString("studentname"));
        		System.out.println("why"+student.getName());
        		student.setName("Yingya Wu");


        		student.setEmail(rs.getString("email"));  
        		long lPhone = Long.parseLong(rs.getString("phone"));
        		student.setPhone(lPhone);
        		student.setCampus(rs.getString("campus"));
        		student.setSchool(rs.getString("school"));
        		student.setAdvisorType(rs.getString("advisortype"));
        		student.setWeek(rs.getString("week"));
        		student.setWeekDay(rs.getString("weekday"));
        		student.setBatch(rs.getString("batch"));
    			//System.out.println("debug3");
        		
        		//set attribute
        		request.setAttribute("queryView", student);
    			//System.out.println("debug4");

        		StudentBean bean=(StudentBean)request.getAttribute("queryView");
        		System.out.println("bean test" + bean.getName());
        		//dispatch to JSP_View
        		RequestDispatcher rd = request.getRequestDispatcher("/JSP/QueryView.jsp");
    			System.out.println("debug5");

        		rd.forward(request, response);
			}else {
				//Display alert when failed to query
				pw.println("<html><body bgcolor=\"#EBF4FD\">");
				pw.println("Your input name is not included in the system!<br> ");
				pw.println("<br><br><b><a href='http://localhost:8080/BookingApp/"
					+ "StudentBooking.html'>Back</a></b>");	
				pw.println("</body></html>");
				return;
			}
		}
		catch (Exception e) {
			//Display alert when failed to query
			pw.println("<html><body bgcolor=\"#EBF4FD\">");
			pw.println("Your query failed!<br> "+ e);
			pw.println("<br><br><b><a href='http://localhost:8080/BookingApp/"
					+ "StudentBooking.html'>Back</a></b>");	
			pw.println("</body></html>");
		}	
	}

}
