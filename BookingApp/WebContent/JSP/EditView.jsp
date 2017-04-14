<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.StudentBean" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Reschedule View</title>
</head>
<body bgcolor="#EBF4FD">

<%
	model.StudentBean bean=(model.StudentBean)request.getAttribute("editView");
%>
<center><h2>${editView.title}${editView.name}</h2></center>
<form  style="margin-left:20%"><font size="3">

	Your appointment details have been modified as follows:<br><br>
	
	<b>Email Address:</b> ${editView.email}<br>
	<b>Phone:</b> ${editView.phone}<br>
	<b>Campus:</b> ${editView.campus}<br>
	<b>School:</b> ${editView.school}<br>
	<b>Advisor Type:</b> ${editView.advisorType}<br>
	<b>Week:</b> ${editView.week}<br>
	<b>Week Day:</b> ${editView.weekDay}<br>
	<b>Schedule Time:</b> ${editView.batch}<br>
	
</font></form>
	<br>
	<center><h3><a href='http://localhost:8080/BookingApp/StudentBooking.html'>Back</a></h3></center>

</body>
</html>