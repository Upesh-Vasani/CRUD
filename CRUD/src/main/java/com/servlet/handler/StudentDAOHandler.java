package com.servlet.handler;

import java.sql.*;
import java.util.*;
import com.servlet.model.Student;

public class StudentDAOHandler{
	public static Connection connectionDB() {
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/crud?useSSL=false";
			con = DriverManager.getConnection(url,"root","Upesh@2005");
		} catch(Exception ex) {
			System.out.print("Error: "+ ex.getMessage());
		}
		return con;
	}
	public static int addStudent(Student student)throws SQLException {
		int result = 0;
		try {
			Connection con = StudentDAOHandler.connectionDB();
			String sqlstr = "insert into student(Name, Email, Mobile, DOB, Gender, City) values(?,?,?,?,?,?)";
			
			PreparedStatement pstmt = con.prepareStatement(sqlstr);
			pstmt.setString(1, student.getStudentName());
			pstmt.setString(2, student.getStudentEmail());
			pstmt.setString(3, student.getStudentMobile());
			pstmt.setString(4, student.getStudentDOB());
			pstmt.setString(5, student.getStudentGender());
			pstmt.setString(6, student.getStudentCity());
			
			result = pstmt.executeUpdate();
			con.close();
			
		} catch(Exception ex) {
			System.out.print("Error: "+ ex.getMessage());
		}
		return result;
	}
	
	public static int updateStudent(Student student)throws SQLException {
		int result = 0;
		try {
			Connection con = StudentDAOHandler.connectionDB();
			String sqlstr = "update student set Name = ?, Email = ?, Mobile = ?, DOB = ?, Gender = ?, City = ? where ID = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sqlstr);
			pstmt.setString(1, student.getStudentName());
			pstmt.setString(2, student.getStudentEmail());
			pstmt.setString(3, student.getStudentMobile());
			pstmt.setString(4, student.getStudentDOB());
			pstmt.setString(5, student.getStudentGender());
			pstmt.setString(6, student.getStudentCity());
			pstmt.setInt(7, student.getStudentID());
			
			
			result = pstmt.executeUpdate();
			con.close();
			
		} catch(Exception ex) {
			System.out.print("Error: "+ ex.getMessage());
		}
		return result;
	}
	
	public static int deleteStudent(int studentid)throws SQLException {
		int result = 0;
		try {
			Connection con = StudentDAOHandler.connectionDB();
			String sqlstr = "delete from student where ID = ?";
			
			PreparedStatement pstmt = con.prepareStatement(sqlstr);
			pstmt.setInt(1, studentid);
			
			result = pstmt.executeUpdate();
			con.close();
			
		} catch(Exception ex) {
			System.out.print("Error: "+ ex.getMessage());
		}
		return result;
	}
	
	public static Student getStudentByID(int studentID)throws SQLException{
		Student student = new Student();
		Connection con = StudentDAOHandler.connectionDB();
		String sqlstr = "select * from student where ID = ?";
		PreparedStatement pstmt = con.prepareStatement(sqlstr);
		pstmt.setInt(1, studentID);
		
		ResultSet result = pstmt.executeQuery();
		if(result.next()) {
			student.setStudentID(result.getInt(1));
			student.setStudentName(result.getString(2));
			student.setStudentEmail(result.getString(3));
			student.setStudentMobile(result.getString(4));
			student.setStudentDOB(result.getString(5));
			student.setStudentGender(result.getString(6));
			student.setStudentCity(result.getString(7));
		}
		con.close();
		return student;
	}
	public static List<Student>getAllStudent()throws SQLException{
		List<Student> students = new ArrayList<Student>();
		
		Connection con = StudentDAOHandler.connectionDB();
		String sqlstr = "select * from student";
		PreparedStatement pstmt = con.prepareStatement(sqlstr);
		
		ResultSet result = pstmt.executeQuery();
		while(result.next()) {
			Student student = new Student();
			
			student.setStudentID(result.getInt(1));
			student.setStudentName(result.getString(2));
			student.setStudentEmail(result.getString(3));
			student.setStudentMobile(result.getString(4));
			student.setStudentDOB(result.getString(5));
			student.setStudentGender(result.getString(6));
			student.setStudentCity(result.getString(7));
			students.add(student);
		}
		con.close();
		return students;
	}
}