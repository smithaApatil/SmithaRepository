<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.wellsfargo.sba1.entity.Product"%>
<%@page import="com.wellsfargo.sba1.service.ProductService"%>
<%@page import="java.util.List"%>
<%@page import="com.wellsfargo.sba1.service.ProductServiceImple"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User</title>
</head>
<body>

<jsp:include page="header.jsp" />	
<%
	if (session.getAttribute("newuser") == null  || session.getAttribute("newuser")!="newuser") {
	%>
	<h3> Please provide your details below : </h3>
	
	<form action="customerDetails" method="POST">
		<div>
			<label>Full Name : </label>
			<input type="text" name="CustomerName" minlength="3" maxlength="20" required />
		</div>
			<label>Phone Number : </label>
			<input type="text" name="PhoneNum" minlength="10" maxlength="10" required />
		</div>
		</div>
			<label>Email ID : </label>
			<input type="text" name="EmaildID" minlength="10" maxlength="25" required />
		</div>
		<button>Add</button>			
	</form>
	
	<% }  else if(session.getAttribute("newuser").toString().equals("newuser")){
		ProductService prodService = new ProductServiceImple();
		List<Product> prods = prodService.getAllProducts();
		request.setAttribute("prods", prods);
	request.getRequestDispatcher("listproductsForCustomer.jsp").forward(request, response);
	 } %>
	 
<hr>
	<jsp:include page="footer.jsp"/>
	</hr>
</body>

</html>
