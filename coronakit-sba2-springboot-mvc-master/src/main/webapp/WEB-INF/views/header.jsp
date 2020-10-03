<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Go Corona Header</title>
</head>
<body>
<hr>
		 
		<spring-form:form class="form-inline" action="${pageContext.request.contextPath}/logout" method="POST">			
			<input type="submit" value="Logout">
		</spring-form:form>
<hr/>
</body>
</html>