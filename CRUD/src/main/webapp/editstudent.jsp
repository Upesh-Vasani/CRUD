<%@page import="java.io.PrintWriter" %>
<%@page import="com.servlet.handler.*,com.servlet.model.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<style type="text/css">
	body {
    	font-family: Arial, sans-serif;
    	background-color: #f4f4f4;
    	display: flex;
    	justify-content: center;
    	align-items: center;
    	height: 100vh;
    	margin: 0;
	}

	.container {
    	background-color: #fff;
    	padding: 20px;
    	border-radius: 8px;
    	box-shadow: 0 0 10px rgba(0,0,0,0.1);
    	width: 100%;
    	max-width: 500px;
	}

	h1 {
    	text-align: center;
    	margin-bottom: 20px;
	}

	.form-group {
    	margin-bottom: 15px;
	}

	label {
    	display: block;
    	margin-bottom: 5px;
    	font-weight: bold;
	}

	input[type="text"],
	input[type="email"],
	input[type="tel"],
	input[type="date"],
	select {
    	width: 100%;
    	padding: 8px;
    	border: 1px solid #ccc;
    	border-radius: 4px;
    	box-sizing: border-box;
	}

	button {
    	background-color: lightseagreen;
    	color: white;
    	border: none;
    	padding: 15px 20px;
    	text-align: center;
    	text-decoration: none;
    	display: inline-block;
    	font-size: 16px;
    	margin: 4px 2px;
    	border-radius: 4px;
    	cursor: pointer;
	}

	button:hover {
    	background-color: lightseagreen;
	}
	.form-group.submit-group {
    	text-align: center;
	}
</style>
</head>
<body>
	<%
		PrintWriter pw = response.getWriter();
		int studentID = Integer.parseInt(request.getParameter("studentid"));
		Student student = StudentDAOHandler.getStudentByID(studentID);
		if(student==null){
			pw.print("Student ID dose not exists");
		}
	%>
	<div class="container">
        <h1>Edit Student Information Form</h1>
        <form action="editstudent?studentid=<%=studentID %>" method="post">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required value=<%=student.getStudentName() %>>
            </div>
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required value=<%=student.getStudentEmail() %>>
            </div>
            <div class="form-group">
                <label for="mobile">Mobile:</label>
                <input type="tel" id="mobile" name="mobile" required value=<%=student.getStudentMobile() %>>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth:</label>
                <input type="date" id="dob" name="dob" required value=<%=student.getStudentDOB() %>>
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select id="gender" name="gender" required value=<%=student.getStudentGender() %>>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select>
            </div>
            <div class="form-group">
                <label for="city">City:</label>
                <input type="text" id="city" name="city" required value=<%=student.getStudentCity() %>>
            </div>
            <div class="form-group submit-group">
                <button type="submit">Submit</button>
            </div>
        </form>
    </div>
</body>
</html>