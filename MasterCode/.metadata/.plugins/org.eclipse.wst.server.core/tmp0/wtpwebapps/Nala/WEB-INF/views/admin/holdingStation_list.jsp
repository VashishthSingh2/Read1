<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Holding Stations List</title>
<meta name="keywords" content="#" />
<meta name="description" content="#" />
<%@include file="../includes/admin_links_n.jsp"%>
</head>
<body id="page-top">
  <!-- Page Wrapper -->
  <div id="wrapper">
    <div id="content-wrapper" class="d-flex flex-column">
	<%@include file="../includes/adminHeader_n.jsp"%> 
      <div id="content">
       <!-- Begin Page Content -->
        <div class="container-fluid">
          <!-- Page Heading -->
          <div class="col-xl-12">
            <!-- Search Start -->
            <div class="card mb-4">
              <div class="card-body">
                  <div class="row">
                    <div class="col">
                      <h5 class="m-0 font-weight-bold text-dark">Holding Stations List</h5>
                    </div>
                    <div class="col">
                        <a href="add-user.html" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal" onclick="getHoldingStation();">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Holding Station</span>
                        </a>
                      </div>
                  </div>
                <hr>
                 <form class="" id="" name="">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="" name="" class="form-control" placeholder="Holding Station Name">
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Mapped Station</option>
                            <option value="Station 1">Station 1</option>
                            <option value="Station 2">Station 2</option>                 
                        </select>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="isActive" id="isActive" class="custom-select">
                            <option value="">Status</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active </option>                
                        </select>
                    </div>
                     <div class="col-lg-1 col-md-4 col-sm-6 mb-2">
                        <button class="btn btn-primary" type="button" id="" name="" data-toggle="tooltip" data-placement="top" title="Search">
                          <i class="fas fa-search fa-sm"></i>
                         </button>
                    </div>
                  </div>
                </form>
              </div>
              </div> <!-- Search End -->
          <div class="card shadow mb-4">
              <div class="card-body">
                <div class="table-responsive">
                <table class="table table-bordered table-hover">
                  <thead class="thead-dark">
                    <tr>
                      <th>Holding Station ID</th>
                      <th>Name</th>
                      <th>Mapped Station</th>
                      <th>Status</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>
                    <tr>
                      <td>13</td>
                      <td>Holding Station 1</td>
                      <td>Station 1</td>
                      <td><span class="badge badge-success">Active</span></td>
                      <td> 
                        <span data-toggle="tooltip" data-placement="top" title="View"><a href="#" class="btn btn-info btn-circle btn-sm" data-toggle="modal" data-target="#viewModal"><i class="fas fa-eye"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Edit"><a href="#" class="btn btn-primary btn-circle btn-sm" data-toggle="modal" data-target="#editModal"><i class="fas fa-edit"></i></a></span>
                        <span data-toggle="tooltip" data-placement="top" title="Delete"><a href="#" class="btn btn-danger btn-circle btn-sm" data-toggle="modal" data-target="#deleteModal"><i class="fas fa-trash"></i></a></span>
                      </td>
                    </tr>
                   </tbody>
                </table>
              </div> <!--tablle End -->
              <div class="row listing-table">
                <div class="col-sm-12 col-md-5"><div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 10 of 57 entries</div></div>
                <div class="col-sm-12 col-md-7">
                <nav aria-label="...">
                   <ul class="pagination">
                    <li class="page-item disabled">
                      <a class="page-link" href="#" tabindex="-1">Previous</a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item active">
                      <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item">
                      <a class="page-link" href="#">Next</a>
                    </li>
                  </ul>
                </nav>
                </div>
              </div> <!-- pagination End -->
            </div>
          </div> <!-- Card End -->
        </div>
      </div><!-- /.container-fluid -->
      </div><!-- End of Main Content -->
    </div><!-- End of Content Wrapper -->
</div><!-- End of Page Wrapper -->
  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>
  <!-- Add Modal Start-->
  <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-hidden="true">  
  </div>
  <!-- Add model End -->
  <!-- Edit Modal Start-->
  <div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-hidden="true">
  </div>
  <!-- Edit Modal End-->
  <!-- View Modal Start-->
  <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-hidden="true">
  </div>
  <!-- View Modal End -->
  <!-- Delete Modal-->
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true">
  </div>
<!-- End -->
 <%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
