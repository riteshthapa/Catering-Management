<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String id=request.getParameter("id");
String name=request.getParameter("name");
String co_id=request.getParameter("co_id");

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cs485_lab", "root", "admin");
Statement st=conn.createStatement();

int i=st.executeUpdate("insert into staffs(ID,employee_name,company_id)values('"+id+"','"+name+"','"+co_id+"')");
out.println("Added new staff sucessfully!");

}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
<a href="staffInfo.jsp">Go back</a>