<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.io.PrintWriter" %>
<%@page import="com.servlet.handler.*,com.servlet.model.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Member</title>
<style type="text/css">
	table, th, td{
    	border: 1px solid black;
    	border-collapse: collapse;
    	font-family: Arial;
    	font-size: 20px;
    	margin: 0 auto;
	}
	th, td{
    	padding: 10px;
	}
	.button{
    	background-color: #008CBA;
    	border: none;
    	color: white;
    	padding: 15px 32px;
    	text-align: center;
    	text-decoration: none;
    	display: inline-block;
    	fount-size: 16px;
	}
</style>
</head>
<body>
	<%
		PrintWriter pw = response.getWriter();
		int studentID = Integer.parseInt(request.getParameter("studentid"));
		Student student = StudentDAOHandler.getStudentByID(studentID);
		if(student == null || student.getStudentID()==0){
			pw.print("Student ID dose not exists");
			response.sendRedirect("index.jsp");
			return;
		}
	%>
	<form action="deletestudent?studentID=<%=studentID %>" method="post">
		<table>
			<tr>
				<td colspan="2"><h2>Delete Student Information Form</h2></td>
			</tr>
			<tr>
				<td>Student ID:</td><td><%=student.getStudentID() %></td>
			</tr>
			<tr>
				<td>Student Name:</td><td><%=student.getStudentName() %></td>
			</tr>
			<tr>
				<td>Student Email:</td><td><%=student.getStudentEmail() %></td>
			</tr>
			<tr>
				<td>Student Mobile:</td><td><%=student.getStudentMobile() %></td>
			</tr>
			<tr>
				<td>Student DOB:</td><td><%=student.getStudentDOB() %></td>
			</tr>
			<tr>
				<td>Student Gender:</td><td><%=student.getStudentGender() %></td>
			</tr>
			<tr>
				<td>Student City:</td><td><%=student.getStudentCity() %></td>
			</tr>
			<tr>
				<td colspan="2">
					<button type="submit">Delete me</button>
					<button type="button" onclick="location.href='index.jsp';">Cancel</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>