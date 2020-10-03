<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Product</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

<h3> Add Product Page</h3>
<jsp:include page="header.jsp" />	
<hr>

<li class="nav-item"><a class="btn btn-sm btn-Success" role="button" href="${pageContext.request.contextPath}/admin/home">Home</a></li>&nbsp;&nbsp;
		<li class="nav-item"><a  class="btn btn-sm btn-Success" href="${pageContext.request.contextPath}/admin/product-list">View Products</a></li>
	
  	<h3 align="left" style="font: normal; color: black;">Add Product</h3>
  <div align="left">
    <div align="left" style="display: inline-block;padding: 10px;">
    
      <form:form action="${pageContext.request.contextPath}/admin/product-save" method="post" modelAttribute="product">
   
        <div>
          <form:label class="col-sm-2 col-form-label" path="productName">Name:</form:label>
          <form:input class="form-control" type="text" path="productName" required="required" maxlength="50" />
          <form:errors path="productName"/>
        </div>
        
        <div class="form-group row">
          <form:label class="col-sm-2 col-form-label" path="cost">Cost:</form:label>
          <form:input class="form-control" type="number" path="cost" step="1" min="1" required="required" />
          <form:errors path="cost"/>
        </div>
        
        <div class="form-group row">
          <form:label class="col-sm-2 col-form-label" path="productDescription">Description:</form:label>
          <form:input class="form-control" type="text" path="productDescription" maxlength="100" />
          <form:errors path="productDescription"/>
        </div>
        
        <div align="center">
        <button>Save</button></div>
        <br>
      </form:form>
    </div>
  </div>
  
  <jsp:include page="footer.jsp" />	
</body>
</html>