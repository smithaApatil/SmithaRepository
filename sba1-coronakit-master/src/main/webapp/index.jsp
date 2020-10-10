<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Covid Kit Management System</title>
</head>
<body>
<div>

	<h1>Welcome!!</h1>
	<jsp:include page="header.jsp" />
			
			<c:if test="${msg != null}">
				<p><strong>${msg }</strong>
		</c:if>

<br>
<br>
	<jsp:include page="footer.jsp"/>

</body>
</html>