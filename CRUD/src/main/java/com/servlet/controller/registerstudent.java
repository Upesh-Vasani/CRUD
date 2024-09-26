package com.servlet.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.servlet.handler.StudentDAOHandler;
import com.servlet.model.Student;
@WebServlet("/registerstudent")

public class registerstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public registerstudent() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		try {
			Student student = new Student();
			student.setStudentName(request.getParameter("name"));
			student.setStudentEmail(request.getParameter("email"));
			student.setStudentMobile(request.getParameter("mobile"));
			student.setStudentDOB(request.getParameter("dob"));
			student.setStudentGender(request.getParameter("gender"));
			student.setStudentCity(request.getParameter("city"));
			
			int result = StudentDAOHandler.addStudent(student);
			
			if(result > 0) {
				pw.print("Record Saved Successfully!");
				request.getRequestDispatcher("index.jsp").include(request, response);
			}else {
				pw.print("Erroe in record insert!");
			}
			
		}catch(Exception ex) {
			System.out.print("Error: "+ ex.getMessage());
		}
	}

}
