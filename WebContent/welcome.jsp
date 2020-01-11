<%@ page import="main.Account" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Welcome</title>

<!-- Required meta tags -->
   <meta charset="utf-8">
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <!-- Bootstrap CSS -->
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   <link rel="stylesheet" href="css/main.css" />
   <link rel="stylesheet" href="css/table.css" />
   <link rel="stylesheet" href="css/form.css" />
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top" role="navigation">
    <div class="container">
        <a class="navbar-brand" href="#"><img id="brand_logo" src="img/logo.png" alt="brand_logo"/></a>
        <button class="navbar-toggler border-0" type="button" data-toggle="collapse" data-target="#exCollapsingNavbar">
            &#9776;
        </button>
        <div class="collapse navbar-collapse" id="exCollapsingNavbar">
            
            
            <ul class="nav navbar-nav">
                <li class="nav-item"><a href="welcome.jsp" class="nav-link">Kitchen</a></li>
                <li class="nav-item"><a href="menu.jsp" class="nav-link">Menu</a></li>
            
            <li class="nav-item dropdown">
		        <a class="nav-link dropdown-toggle" href=staffInfo.jsp" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		          Staff
		        </a>
		        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
		       	 <a class="dropdown-item" href="staffInfo.jsp">Know your staff member</a>
		          <a class="dropdown-item" href="add.jsp">Add new staff member</a>
		          <a class="dropdown-item" href="delete.jsp">Delete staff member</a>
		       
		      </li>
             </ul>
            
            
            <ul class="nav navbar-nav flex-row justify-content-between ml-auto">
                
                <li class="dropdown order-1">
                     <ul class="nav navbar-nav ml-md--auto">
                      <li class="dropdown"> 
                        <a href="#" class="nav-link dropdown-toggle" id="navbarDropdown" data-toggle="dropdown" aria-expanded="false"> 
                                Welcome,
								<%= ((Account) request.getSession().getAttribute("account")).getFirstName() %>
								<%= ((Account) request.getSession().getAttribute("account")).getLastName() %> <b class="caret"></b>
                         </a>
                             <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                             <a class="dropdown-item" href="logout.jsp">Logout</a>
                            </div>
                         </li> 
                     </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>


<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "cs485_lab";
String userId = "root";
String password = "admin";


try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<div class="bg-img">
	<div class="form_container">
 		<form class="text-center border border-light p-5" action="#!">

		  <p class="h4 mb-4">CATERING KITCHEN</p>
		
		  <p>FIND KITCHEN INFORMATION BASED ON ITS ZIP CODE</p>
		
		  <!-- Name -->
		  <input type="text" id="defaultSubscriptionFormPassword" name="zip_code" class="form-control mb-4" placeholder="enter zip code">
		
		  <!-- Sign in button -->
		  <button class="btn btn-info btn-block" type="submit">Submit</button>
		</form>	
	</div>

	<div class="table">
		<table class="rwd-table">
		  <tr>
		    <th>Kitchen ID</th>
		    <th>Address </th>
		  </tr>
		<%
		try{ 
		connection = DriverManager.getConnection(connectionUrl+dbName, userId, password);
		statement=connection.createStatement();
		String zip_code = request.getParameter("zip_code");
		
		String sql ="SELECT * FROM kitchen where zip_code = '" + zip_code + "'";
		
		resultSet = statement.executeQuery(sql);
		while(resultSet.next()){
		%>
		<tr>
		
		<td><%=resultSet.getString("ID") %></td>
		<td><%=resultSet.getString("address") %></td>
		
		</tr>
	
		<% 
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
		</table>
	</div>
</div>




 <!-- Footer -->
<footer class="page-footer font-small indigo">

  <!-- Footer Links -->
  <div class="container">

    <!-- Grid row-->
    <div class="row text-center d-flex justify-content-center pt-5 mb-3">

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
        <h6 class="text-uppercase font-weight-bold">
          <a href="#!">About us</a>
        </h6>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
        <h6 class="text-uppercase font-weight-bold">
          <a href="#!">Help</a>
        </h6>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
        <h6 class="text-uppercase font-weight-bold">
          <a href="#!">Contact</a>
        </h6>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row-->
    <hr class="rgba-white-light" style="margin: 0 15%;">

    <!-- Grid row-->
    <div class="row d-flex text-center justify-content-center mb-md-0 mb-4">

      <!-- Grid column -->
      <div class="col-md-8 col-12 mt-5">
        <p style="line-height: 1.7rem">This website was designed as a part of final project for Database System Design class. <br>
        Website features house information on the catering companies as well as their employees, their kitchen location.<br>
         Project completed by Nick Huinker and Ritesh Thapa.</p>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row-->
    <hr class="clearfix d-md-none rgba-white-light" style="margin: 10% 15% 5%;">




 <!-- Grid row-->
    <div id="socialMedia" class="row text-center d-flex justify-content-center">

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
          <a href="#" class="fa fa-facebook"></a>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
      <a href="#" class="fa fa-twitter"></a>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
       <a href="#" class="fa fa-google"></a>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
      <a href="#" class="fa fa-linkedin"></a>
      </div>
      <!-- Grid column -->

      <!-- Grid column -->
      <div class="col-md-2 mb-3">
      <a href="#" class="fa fa-instagram"></a>
      </div>
      <!-- Grid column -->

    </div>
    <!-- Grid row-->
  
  </div>
  <!-- Footer Links -->

  <!-- Copyright -->
  <div class="footer-copyright text-center py-3">© 2019 Copyright, Winona State University All rights reserved.
  </div>
  <!-- Copyright -->

</footer>
<!-- Footer -->



<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
	<script type="text/javascript">
	
</body>
</html>