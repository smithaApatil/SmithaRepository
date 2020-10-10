<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Products list</title>
</head>
<body>

<jsp:include page="headeradmin.jsp" />
		
			<c:if test="${msg != null}">
				<p><strong>${msg }</strong>
		</c:if>
	
	<h3>Products list dispalyed below : </h3>	
	<c:choose>
		<c:when test="${prods==null || prods.isEmpty() }">
			<p>No Items Found</p>
		</c:when>
		<c:otherwise>
			<table border="1" cellspacing="5px" cellpadding="5px">
				<tr>
					<th>ID</th>
					<th>Product Name</th>
					<th>Cost</th>
					<th>Product Description</th>
				</tr>
				<c:forEach items="${prods }" var="prod">
					<tr>
					<td>${prod.id }</td>
					<td>${prod.productName }</td>
					<td>${prod.cost }</td>
					<td>${prod.productDescription }</td>
					
					<td>
						<a href="deleteProd?id=${prod.id }">DELETE</a> <span>|</span>
						<a href="editProd?id=${prod.id }">EDIT</a> <span>|</span>
					</td>
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
