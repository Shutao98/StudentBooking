package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.StudentBean;

/**
 * Servlet implementation class BookingServlet
 */
@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BookingServlet() {
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
		
		response.setContentType("text/html");
		PrintWriter pw = response.getWriter();	
		
		String studentName = "", email = "", campus = "", school = "", advisorType = "", week = "", weekDay = "", batch = "";
		int studentId = 0;
		long phone = 0;

		String title = "";
		
		try {
			//GET DATA FROM INPUT
			String strStudentId = request.getParameter("id"); 
			studentId = Integer.parseInt(strStudentId);
			//System.out.println("debug1");
			studentName = request.getParameter("name"); 
			email = request.getParameter("email");
			String strPhone = request.getParameter("phone"); 
			phone = Long.parseLong(strPhone);
			//System.out.println("debug2");
			campus = request.getParameter("rdCampus"); 
			school = request.getParameter("rdSchool");
			advisorType = request.getParameter("rdAdvisor");
			week = request.getParameter("rdWeek");
			weekDay = request.getParameter("rdWeekDay");
			batch = request.getParameter("rdBatch"); 
			//System.out.println("debug3");
			 
		} catch (Exception e) {
			//Display error message if input data TYPE is not correct
			RequestDispatcher rd = request.getRequestDispatcher("/JSP/Error.jsp");
			rd.forward(request, response);
		}
		
		//SET DATA TO BEAN CLASS	
		StudentBean student = new StudentBean();
		student.setStudentId(studentId);
		student.setName(studentName);
		student.setEmail(email);
		student.setPhone(phone);
		student.setCampus(campus);		
		student.setSchool(school);
		student.setAdvisorType(advisorType);
		student.setWeek(week);
		student.setWeekDay(weekDay);
		student.setBatch(batch);
		title = "Welcome, ";
		student.setTitle(title);
		
		//Set attribute for use in confirmation view
		request.setAttribute("confirmView", student);		
		
		try{
			//Create connection to database
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			String connectionUrl = "jdbc:mysql://localhost/bookingadvisordb";
			String connectionUser = "root";
			String connectionPassword = "";
			conn = DriverManager.getConnection(connectionUrl, connectionUser, connectionPassword);
			stmt = conn.createStatement();
			
			//System.out.println("debug4");
			//student.validate() = true;
			//System.out.println("debug b2"+ student.validate());
		//bookingadvisordb.studentbooking
			//if(student.validate()){
			if(true){	
				System.out.println("debug5");
				
				//insert input data of user input to database				
				stmt.executeUpdate("INSERT INTO bookingadvisordb.studentbooking (studentid,"
						+ " studentname, email, phone, campus, school, advisortype, week, "
						+ "weekday, batch)" + " VALUES('" + studentId + "', '"+ studentName
						+ "', '" +   email + "', '"+ phone + "', '"	+ campus + "', '"
						+ school + "', '" +	advisorType + "', '" + week	+ "', '" + 
						weekDay + "', '" + batch + "')");
				
				System.out.println("debug6");
				//Dispatch to confirmation view			
				RequestDispatcher rd = request.getRequestDispatcher("/JSP/ConfirmationView.jsp");
				rd.forward(request, response);
			/*}else{
				//Display error message if input data FORMAT is not correct
				System.out.println("debug7");
				RequestDispatcher rd = request.getRequestDispatcher("/JSP/Error.jsp");
				rd.forward(request, response);
			}*/
		}}
		catch(Exception e) {
			//Display error alert
			System.out.println("debug8");
			pw.println("<html><body bgcolor=\"#EBF4FD\">");
			pw.println(" Insertion Failed!<br>" + e);
			pw.println("<br><br><b><a href='http://localhost:8080/BookingApp/"
					+ "StudentBooking.html'>Back</a></b>");	
			pw.println("</body></html>");
		}
	}

}
