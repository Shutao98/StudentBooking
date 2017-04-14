<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.StudentBean" %>
<%@ page import="controller.BookingServlet" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Confirmation View</title>
</head>
<body bgcolor="#EBF4FD">

<%
	model.StudentBean bean=(model.StudentBean)request.getAttribute("confirmView");
%>
<center><h2>${confirmView.title} ${confirmView.name}</h2></center>
<form  style="margin-left:20%"><font size="3">
	Your appointment details are as follows:<br><br>
	<b>Student ID:</b> ${confirmView.studentId}<br>
	<b>Email Address:</b> ${confirmView.email}<br>
	<b>Phone:</b> ${confirmView.phone}<br>
	<b>Campus:</b> ${confirmView.campus}<br>
	<b>School:</b> ${confirmView.school}<br>
	<b>Advisor Type:</b> ${confirmView.advisorType}<br>
	<b>Week:</b> ${confirmView.week}<br>
	<b>Week Day:</b> ${confirmView.weekDay}<br>
	<b>Batch:</b> ${confirmView.batch}<br>
</font></form>

<center><h4>Your Online Advisor Booking Completed.<br>You Can Reschedule the Appointment One Day in Advance.</h4></center>
<center><h4><a href='http://localhost:8080/BookingApp/StudentBooking.html'>Back</a></h4></center>

</body>
</html>