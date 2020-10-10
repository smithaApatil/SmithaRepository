<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Kit details </title>
</head>
<body>
<form action="customerlist" method="POST">
	<jsp:include page="header.jsp" />
	<h3>List of items added to kit is displayed here :</h3>

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
			
		<button>Back</button>
	
		</c:otherwise>
	</c:choose>
</form>	

<hr>
	<jsp:include page="footer.jsp"/>
	</hr>
</body>
</html>