<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.StudentBean" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Query View</title>
</head>
<body bgcolor="#EBF4FD">
<h2>Your Appointment Information</h2>

<form method="POST" action="EditServlet">
Enter your Name: <input type="text" name="name" value="${param.name}"><br><br>
<%
	StudentBean bean=(StudentBean)request.getAttribute("queryView");
	String a  = bean.getName();
	String[] b = a.split(" ");
	
	out.print("Enter your Student ID: <input type=\"text\" name=\"id\" value=" + bean.getStudentId() + "><br><br>");
	out.print("Enter your Name: <input type=\"text\" name=\"name\" value=" + bean.getName() + "><br><br>");
	out.print("Enter your Email: <input type=\"text\" name=\"email\" value=" + bean.getEmail() + "><br><br>");
	out.print("Enter your Phone: <input type=\"text\" name=\"phone\" value=" + bean.getPhone() + "><br><br>");
	
	out.print("Enter the Campus: <br>");
	String campusrd1= "",campusrd2 = "",campusrd3 = "",campusrd4 = "",campusrd5 = "",campusrd6 = "";
	if(bean.getCampus().equalsIgnoreCase("Ashtonbee Campus")){
		campusrd1 = "checked";
	}else if(bean.getCampus().equalsIgnoreCase("Eglinton Learning Site")){
		campusrd2 = "checked";
	}else if(bean.getCampus().equalsIgnoreCase("Morningside Campus")){
		campusrd3 = "checked";
	}else if(bean.getCampus().equalsIgnoreCase("Pickering Learning Site")){
		campusrd4 = "checked";
	}else if(bean.getCampus().equalsIgnoreCase("Progress Campus")){
		campusrd5 = "checked";
	}else if(bean.getCampus().equalsIgnoreCase("Story Arts Centre")){
		campusrd6 = "checked";
	}
	out.print("<input type=\"radio\" value=\"Ashtonbee Campus\" name=\"rdCampus\"" + campusrd1 + "/>Ashtonbee Campus<br>");
	out.print("<input type=\"radio\" value=\"Eglinton Learning Site\" name=\"rdCampus\"" + campusrd2 + "/>Eglinton Learning Site<br>");
	out.print("<input type=\"radio\" value=\"Morningside Campus\" name=\"rdCampus\"" + campusrd3 + "/>Morningside Campus<br>");
	out.print("<input type=\"radio\" value=\"Morningside Campus\" name=\"rdCampus\"" + campusrd4 + "/>Morningside Campus<br>");
	out.print("<input type=\"radio\" value=\"Morningside Campus\" name=\"rdCampus\"" + campusrd5 + "/>Morningside Campus<br>");
	out.print("<input type=\"radio\" value=\"Morningside Campus\" name=\"rdCampus\"" + campusrd6 + "/>Morningside Campus<br><br>");

	out.print("Enter the School: <br>");
	String schoolrd1= "",schoolrd2= "",schoolrd3= "",schoolrd4= "",schoolrd5= "",schoolrd6= "",schoolrd7= "",schoolrd8= "";
	if(bean.getSchool().equalsIgnoreCase("School of Advancement")){
		schoolrd1 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("School of Business")){
		schoolrd2 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("School of Communications, Media, Arts and Design")){
		schoolrd3 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("School of Community and Health Studies")){
		schoolrd4 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("School of Engineering Technology and Applied Science")){
		schoolrd5 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("School of Hospitality, Tourism and Culinary Arts")){
		schoolrd6 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("School of Transportation")){
		schoolrd7 = "checked";
	}else if(bean.getSchool().equalsIgnoreCase("Part Time Learning")){
		schoolrd8 = "checked";
	}
	out.print("<input type=\"radio\" value=\"School of Advancement\" name=\"rdSchool\"" + schoolrd1 + "/>School of Advancement<br>");
	out.print("<input type=\"radio\" value=\"School of Business\" name=\"rdSchool\"" + schoolrd2 + "/>School of Business<br>");
	out.print("<input type=\"radio\" value=\"School of Communications, Media, Arts and Design\" name=\"rdSchool\"" + schoolrd3 + "/>School of Communications, Media, Arts and Design<br>");
	out.print("<input type=\"radio\" value=\"School of Community and Health Studies\" name=\"rdSchool\"" + schoolrd4 + "/>School of Community and Health Studies<br>");
	out.print("<input type=\"radio\" value=\"School of Engineering Technology and Applied Science\" name=\"rdSchool\"" + schoolrd5 + "/>School of Engineering Technology and Applied Science<br>");
	out.print("<input type=\"radio\" value=\"School of Hospitality, Tourism and Culinary Arts\" name=\"rdSchool\"" + schoolrd6 + "/>School of Hospitality, Tourism and Culinary Arts<br>");
	out.print("<input type=\"radio\" value=\"School of Transportation\" name=\"rdSchool\"" + schoolrd7 + "/>School of Transportation<br>");
	out.print("<input type=\"radio\" value=\"Part Time Learning\" name=\"rdSchool\"" + schoolrd8 + "/>Part Time Learning<br><br>");

	out.print("Enter the Advisor Type: <br>");
	String advisorrd1= "",advisorrd2 = "",advisorrd3 = "";
	if(bean.getAdvisorType().equalsIgnoreCase("Program Coordinator")){
		advisorrd1 = "checked";
	}else if(bean.getAdvisorType().equalsIgnoreCase("Academic Advisor")){
		advisorrd2 = "checked";
	}else if(bean.getAdvisorType().equalsIgnoreCase("Morningside Campus")){
		advisorrd3 = "checked";
	}	
	out.print("<input type=\"radio\" value=\"Program Coordinator\" name=\"rdAdvisor\"" + advisorrd1 + "/>Program Coordinator<br>");
	out.print("<input type=\"radio\" value=\"Academic Advisor\" name=\"rdAdvisor\"" + advisorrd2 + "/>Program Coordinator<br>");
	out.print("<input type=\"radio\" value=\"Faculty member\" name=\"rdAdvisor\"" + advisorrd3 + "/>Faculty member<br><br>");
	
	out.print("Enter the Week: <br>");
	String weekrd1= "",weekrd2 = "";
	if(bean.getWeek().equalsIgnoreCase("Week Before Semester Starting")){
		weekrd1 = "checked";
	}else if(bean.getWeek().equalsIgnoreCase("Week After Semester Starting")){
		weekrd2 = "checked";
	}
	out.print("<input type=\"radio\" value=\"Week Before Semester Starting\" name=\"rdWeek\"" + weekrd1 + "/>Week Before Semester Starting<br>");
	out.print("<input type=\"radio\" value=\"Week After Semester Starting\" name=\"rdWeek\"" + weekrd2 + "/>Week After Semester Starting<br><br>");

	out.print("Enter the Week Day: <br>");
	String weekdayrd1= "",weekdayrd2 = "",weekdayrd3 = "",weekdayrd4 = "",weekdayrd5 = "";
	if(bean.getWeekDay().equalsIgnoreCase("Monday")){
		weekdayrd1 = "checked";
	}else if(bean.getWeekDay().equalsIgnoreCase("Tuesday")){
		weekdayrd2 = "checked";
	}else if(bean.getWeekDay().equalsIgnoreCase("Wednesday")){
		weekdayrd3 = "checked";
	}else if(bean.getWeekDay().equalsIgnoreCase("Thursday")){
		weekdayrd4 = "checked";
	}else if(bean.getWeekDay().equalsIgnoreCase("Friday")){
		weekdayrd5 = "checked";
	}
	out.print("<input type=\"radio\" value=\"Monday\" name=\"rdWeekDay\"" + weekdayrd1 + "/>Monday<br>");
	out.print("<input type=\"radio\" value=\"Tuesday\" name=\"rdWeekDay\"" + weekdayrd2 + "/>Tuesday<br>");
	out.print("<input type=\"radio\" value=\"Wednesday\" name=\"rdWeekDay\"" + weekdayrd3 + "/>Wednesday<br>");
	out.print("<input type=\"radio\" value=\"Thursday\" name=\"rdWeekDay\"" + weekdayrd4 + "/>Thursday<br>");
	out.print("<input type=\"radio\" value=\"Friday\" name=\"rdWeekDay\"" + weekdayrd5 + "/>Friday<br><br>");

	out.print("Select Your Time Schedule: <br>");
	String batchrd81= "", batchrd82= "", batchrd83= "",batchrd84 = "";
	String batchrd91= "", batchrd92= "", batchrd93= "",batchrd94 = "";
	String batchrd101= "", batchrd102= "", batchrd103= "",batchrd104 = "";
	String batchrd111= "", batchrd112= "", batchrd113= "",batchrd114 = "";
	String batchrd121= "", batchrd122= "", batchrd123= "",batchrd124 = "";
	String batchrd131= "", batchrd132= "", batchrd133= "",batchrd134 = "";
	String batchrd141= "", batchrd142= "", batchrd143= "",batchrd144 = "";
	if(bean.getBatch().equalsIgnoreCase("08:00-08:15")){
		batchrd81 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("08:15-08:30")){
		batchrd82 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("08:30-08:45")){
		batchrd83 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("08:45-09:00")){
		batchrd84 = "checked";
	}
	else if(bean.getBatch().equalsIgnoreCase("09:00-09:15")){
		batchrd91 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("09:15-09:30")){
		batchrd92 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("09:30-09:45")){
		batchrd93 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("09:45-10:00")){
		batchrd94 = "checked";
	}
	else if(bean.getBatch().equalsIgnoreCase("10:00-10:15")){
		batchrd101 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("10:15-10:30")){
		batchrd102 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("10:30-10:45")){
		batchrd103 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("10:45-11:00")){
		batchrd104 = "checked";
	}
	else if(bean.getBatch().equalsIgnoreCase("11:00-11:15")){
		batchrd111 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("11:15-11:30")){
		batchrd112 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("11:30-11:45")){
		batchrd113 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("11:45-12:00")){
		batchrd114 = "checked";
	}
	else if(bean.getBatch().equalsIgnoreCase("13:00-13:15")){
		batchrd131 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("13:15-13:30")){
		batchrd132 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("13:30-13:45")){
		batchrd133 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("13:45-14:00")){
		batchrd134 = "checked";
	}
	else if(bean.getBatch().equalsIgnoreCase("14:00-14:15")){
		batchrd141 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("14:15-14:30")){
		batchrd142 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("14:30-14:45")){
		batchrd143 = "checked";
	}else if(bean.getBatch().equalsIgnoreCase("14:45-15:00")){
		batchrd144 = "checked";
	}
	out.print("<input type=\"radio\" value=\"08:00-08:15\" name=\"rdBatch\"" + batchrd81 + ">08:00-08:15");
	out.print("<input type=\"radio\" value=\"08:15-08:30\" name=\"rdBatch\"" + batchrd82 + ">08:15-08:30");
	out.print("<input type=\"radio\" value=\"08:30-08:45\" name=\"rdBatch\"" + batchrd83 + ">08:30-08:45");
	out.print("<input type=\"radio\" value=\"08:45-09:00\" name=\"rdBatch\"" + batchrd84 + ">08:45-09:00<br>");
	out.print("<input type=\"radio\" value=\"09:00-09:15\" name=\"rdBatch\"" + batchrd91 + ">09:00-09:15");
	out.print("<input type=\"radio\" value=\"09:15-09:30\" name=\"rdBatch\"" + batchrd92 + ">09:15-09:30");
	out.print("<input type=\"radio\" value=\"09:30-09:45\" name=\"rdBatch\"" + batchrd93 + ">09:30-09:45");
	out.print("<input type=\"radio\" value=\"09:45-10:00\" name=\"rdBatch\"" + batchrd94 + ">09:45-10:00<br>");
	out.print("<input type=\"radio\" value=\"10:00-10:15\" name=\"rdBatch\"" + batchrd101 + ">10:00-10:15");
	out.print("<input type=\"radio\" value=\"10:15-10:30\" name=\"rdBatch\"" + batchrd102 + ">10:15-10:30");
	out.print("<input type=\"radio\" value=\"10:30-10:45\" name=\"rdBatch\"" + batchrd103 + ">10:30-10:45");
	out.print("<input type=\"radio\" value=\"10:45-11:00\" name=\"rdBatch\"" + batchrd104 + ">10:45-11:00<br>");
	out.print("<input type=\"radio\" value=\"11:00-11:15\" name=\"rdBatch\"" + batchrd111 + ">11:00-11:15");
	out.print("<input type=\"radio\" value=\"11:15-11:30\" name=\"rdBatch\"" + batchrd112 + ">11:15-11:30");
	out.print("<input type=\"radio\" value=\"11:30-11:45\" name=\"rdBatch\"" + batchrd113 + ">11:30-11:45");
	out.print("<input type=\"radio\" value=\"11:45-12:00\" name=\"rdBatch\"" + batchrd114 + ">11:45-12:00<br>");
	out.print("<input type=\"radio\" value=\"13:00-13:15\" name=\"rdBatch\"" + batchrd131 + ">13:00-13:15");
	out.print("<input type=\"radio\" value=\"13:15-13:30\" name=\"rdBatch\"" + batchrd132 + ">13:15-13:30");
	out.print("<input type=\"radio\" value=\"13:30-13:45\" name=\"rdBatch\"" + batchrd133 + ">13:30-13:45");
	out.print("<input type=\"radio\" value=\"13:45-14:00\" name=\"rdBatch\"" + batchrd134 + ">13:45-14:00<br>");
	out.print("<input type=\"radio\" value=\"14:00-14:15\" name=\"rdBatch\"" + batchrd141 + ">14:00-14:15");
	out.print("<input type=\"radio\" value=\"14:15-14:30\" name=\"rdBatch\"" + batchrd142 + ">14:15-14:30");
	out.print("<input type=\"radio\" value=\"14:30-14:45\" name=\"rdBatch\"" + batchrd143 + ">14:30-14:45");
	out.print("<input type=\"radio\" value=\"14:45-15:00\" name=\"rdBatch\"" + batchrd144 + ">14:45-15:00<br><br><br>");
%>
		<input type="Submit" value="Edit" name="btnSubmit">
		<input type="Submit" value="Cancel" name="btnView" onclick="form.action='CancelServlet'">
		<input type="reset" value="Clear" name="btnClear">
		<input type="button" value="Back" onclick="window.location.href='http://localhost:8080/BookingApp/StudentBooking.html'">
</form>
</body>
</html>
