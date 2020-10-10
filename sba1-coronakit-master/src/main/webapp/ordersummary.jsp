<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.wellsfargo.sba1.entity.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.wellsfargo.sba1.entity.Customer"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<jsp:include page="header.jsp" />
<title>Order Summary</title>
</head>
<body>
<%	List<Product> cart= (List<Product>) session.getAttribute("cart");
	request.setAttribute("cart",cart);
	Customer cust = (Customer) session.getAttribute("cust");
%>

	<h3> User Details </h3>
	<span> User Name : </span>
	<span><%=cust.getPersonName()%></span>
	<br>
	<span> Phone Number: </h3>
	<span><%=cust.getContactNumber()%></span>
	<br>
	<span> Email Address : </span>
	<span><%=cust.getEmail()%></span>
	<br>
	
	<br>
	
	<hr> </hr>
	<h3> Order Summary:</h3>

	<c:choose>
		<c:when test="${cart==null || cart.isEmpty() }">
			<p>No Items Found</p>
		</c:when>
		<c:otherwise>
			<table border="1" cellspacing="5px" cellpadding="5px">
				<tr>
					<th>Product Name</th>
					<th>Cost</th>
					<th>Product Description</th>
					
				</tr>
				<c:forEach items="${cart }" var="prod">
					<tr>
					<td>${prod.productName }</td>
					<td>${prod.cost }</td>
					<td>${prod.productDescription }</td>
					
				</tr>				
				</c:forEach>
			</table>
			</c:otherwise>
			</c:choose> 
			
			<hr>
	<jsp:include page="footer.jsp"/>
	</hr>
</body>
</html>