<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="false"%>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="ConfidentLeeÂ® is a program designed to help develop well-rounded and confident students. Our outcome-based programs will instill the necessary tools in students to become 21st century learners.">
  <meta name="author" content="Confidentlee">
  <title>Add User Profile</title>
  <!-- Custom fonts -->
  <script src="https://kit.fontawesome.com/c0abd2a385.js" crossorigin="anonymous"></script>
  <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
  <!-- Custom styles-->
  <style><%@include file="/assets/css/style.css"%></style>
  
</head>

<!-- Head End -->
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <!-- Sidebar -->
    <ul class="navbar-nav bg-primary sidebar sidebar-dark accordion" id="accordionSidebar">
     <li> <a class="sidebar-brand d-flex align-items-center justify-content-center" href="#">
        <div class="sidebar-brand-icon">
          <i class="fas fa-utensils"></i>
        </div>
        <div class="sidebar-brand-text mx-3">Nala</div>
      </a></li>
      <hr class="sidebar-divider my-0">
      <li class="nav-item">
        <a class="nav-link" href="./admin/loginAction">
          <i class="fas fa-fw fa-sign-in-alt"></i>
          <span>Login</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="forgot-password.html">
          <i class="fas fa-fw fa-key"></i>
          <span>Forgot Password</span></a>
      </li>
       <li class="nav-item active">
        <a class="nav-link" href="users-list.html">
          <i class="fas fa-fw fa-users"></i>
          <span>Users</span></a>
      </li>
     <hr class="sidebar-divider d-none d-md-block">
     <div class="text-center d-none d-md-inline">
        <button class="rounded-circle border-0" id="sidebarToggle"></button>
      </div>
      </ul>
    <!-- End of Sidebar -->
    <!-- Content Wrapper -->
    <div id="content-wrapper" class="d-flex flex-column">
      <div id="content">
       <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
          <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
            <i class="fa fa-bars"></i>
          </button>
            <ul class="navbar-nav ml-auto">
              <li class="nav-item dropdown no-arrow">
              <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                <span class="mr-2 d-none d-lg-inline text-gray-600 small">Meghanadh Dondapati</span>
                <img class="img-profile rounded-circle" src="assets/img/user-icon.jpg" alt="User Iocn">
              </a>
              <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in" aria-labelledby="userDropdown">
                <a class="dropdown-item" href="#">
                  <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                  Profile
                </a>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-key fa-sm fa-fw mr-2 text-gray-400"></i>
                  Change Password
                </a>
                <div class="dropdown-divider"></div>
                <a class="dropdown-item" href="#">
                  <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                  Logout
                </a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- End of Topbar -->
        <!-- Begin Page Content -->
        <div class="container-fluid">

          <!-- Page Heading -->
          <div class="col-lg-12">
          <div class="card shadow mb-4">
                <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-dark">Add User Profile</h6>
                </div>
                <div class="card-body">
                  <form:form method="post" action="${pageContext.request.contextPath}/admin/saveProfile">
                <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                       <td><form:label path="type">Profile Name</form:label></td>
            		   <td><form:input path="type"/></td>
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                         <td><form:label path="sequence">Sequence</form:label></td>
            			 <td><form:input path="sequence"/></td>
                      </div>
                    </div>
                  </div>
                 
                  <div class="row">
                    <div class="col-md-12">
                    <button type="submit" class="btn btn-warning my-2">Save</button>
                  </div>
                  </div>
                <!-- Address -->
               </form:form>
                </div>
              </div>
            </div>
          </div>
      </div><!-- End of Main Content -->
      <!-- Footer -->
      <footer class="sticky-footer bg-white">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright &copy;  Nala  2020</span>
          </div>
        </div>
      </footer>
    </div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
<!-- Scripts-->
  <script src="assets/js/jquery.min.js"></script>
  <script src="assets/js/bootstrap.bundle.min.js"></script>
  <script src="assets/js/jquery.easing.min.js"></script>
  <script src="assets/js/custom.min.js"></script>
  <script src="assets/js/moment.min.js"></script>
</body>
</html>
