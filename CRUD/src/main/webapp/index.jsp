<%@page import="com.servlet.handler.*" %>
<%@page import="com.servlet.model.*" %>
<%@page import="java.util.*" %>
<%@page import="java.io.PrintWriter" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Record</title>
<style type="text/css">
		body {
            font-family: Arial, sans-serif;
        }
        .crud-header {
            background-color: lightslategray;
            padding: 10px;
            text-align: center;
            color: white;
        }
        .add-btn {
            background-color: lightseagreen;
            color: white;
            padding: 5px 10px;
            text-decoration: none;
            border-radius: 5px;
            float: left;
            position: relative;
            top: 20px;
        }
        table {
            width: 100%;
            margin-top: 20px;
            border-collapse: collapse;
            position: relative;
            top: 30px;
        }
        th, td {
            border-bottom: 1px solid #ddd;
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: lightsteelblue;
            color: black;
        }
        tr:nth-child(odd) {
        	background-color: lightgrey;
    	}
    	tr:nth-child(even) {
        	background-color: white;
        }
        .operation-btns {
            background-color: lightseagreen;
            color: white;
            padding: 5px 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
</style>
</head>
<body>
	<div class="crud-header">
        <h1>CRUD Operation</h1>
        <a href="addstudent.jsp" class="add-btn">Add New Member</a>
    </div>
    <table id="alter">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Mobile</th>
            <th>Date of Birth</th>
            <th>Gender</th>
            <th>City</th>
            <th>Operation</th>
        </tr>
		<%
		List<Student> students = StudentDAOHandler.getAllStudent();
			for(Student student : students){%>
				<tr>
					<td><%=student.getStudentID()%></td>
					<td><%=student.getStudentName()%></td>
					<td><%=student.getStudentEmail()%></td>
					<td><%=student.getStudentMobile()%></td>
					<td><%=student.getStudentDOB()%></td>
					<td><%=student.getStudentGender()%></td>
					<td><%=student.getStudentCity()%></td>
					<td>
						<a href="editstudent.jsp?studentid=<%= student.getStudentID() %>">
							<input class="operation-btns" type="button" value="Edit Record"/>
						</a>
						<a href="deletestudent.jsp?studentid=<%= student.getStudentID() %>">
							<input class="operation-btns" type="button" value="Delete Record"/>
						</a>
					</td>
				</tr>
			<%}
		%>
	</table>
</body>
</html>