package com.servlet.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.servlet.handler.StudentDAOHandler;
@WebServlet("/deletestudent")

public class deletestudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public deletestudent() {
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		response.setContentType("text/html");
		try {
			int studentID = Integer.parseInt(request.getParameter("studentID"));
			
			int result = StudentDAOHandler.deleteStudent(studentID);
			
			if(result>0) {
				pw.print("Record deleted Successfully!");
				request.getRequestDispatcher("index.jsp").include(request, response);
			}else {
				pw.print("Erroe in record delete!");
			}
			
		}catch(Exception ex) {
			System.out.print("Error: "+ ex.getMessage());
		}
	}

}
