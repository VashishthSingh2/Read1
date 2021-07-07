<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="false" %>
<%@page buffer="8192kb" autoFlush="true" %>

<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Login - Nala </title>
  <!-- Custom fonts -->
  <script src="https://kit.fontawesome.com/c0abd2a385.js" crossorigin="anonymous"></script>
  <!-- <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">-->
  <!-- Custom styles-->
  
<style><%@include file="/assets/css/style.css"%></style>
</head>
<!-- Head End -->
<body class="bg-gradient-dark">
<div class="container">
    <!-- Outer Row -->
    <div class="row justify-content-center">
      <div class="col-xl-6 col-lg-12 col-md-9">
        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body p-0">
            <div class="row">
              <div class="col-lg-12">
                <div class="p-5">
                  <div class="text-center">
                    <img src="./assets/img/logo.png" class="img-fluid" alt="Nala Logo">
                    <hr>
                    <h1 class="h4 text-gray-900 mb-2">Login</h1> 
                  </div>
                   <c:url var="loginUrl" value="/login" />
                  <form action="${loginUrl}" method="post" class="user mt-4" >
					<c:if test="${param.error != null}">
						<div class="alert alert-danger"><p>Invalid Login ID and password.</p></div>
					</c:if>
					<c:if test="${param.logout != null}">
						<div class="alert alert-success"><p>You have been logged out successfully.</p></div>
					</c:if>
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user" id="username" name="ssoId" placeholder="Email Login ID" required="required" >
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password" required="required">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="rememberme" name="remember-me">
                        <label class="custom-control-label" for="customCheck">Remember Me</label>
                      </div>
                    </div>
                    <div class="form-group">
                      <button type="submit" class="btn btn-info btn-user btn-block"> Login</button>
                    </div>
				  	<input type="hidden" name="${_csrf.parameterName}"  value="${_csrf.token}" />	
                   </form>
                  <hr>
                  <div class="text-center">
                    <a class="small text-warning" href="${pageContext.request.contextPath}/forgot-password">Forgot Password?</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</body>
</html>
