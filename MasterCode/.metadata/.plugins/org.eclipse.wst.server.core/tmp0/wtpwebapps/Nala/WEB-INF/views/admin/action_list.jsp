<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="author" content="Nala">
  <title>Action List</title>
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
                      <h5 class="m-0 font-weight-bold text-dark">Action List</h5>
                    </div>
                    <div class="col">
                        <a href="#" class="btn btn-warning btn-icon-split float-right" data-toggle="modal" data-target="#addModal" onclick="addAction();">
                          <span class="icon text-white-50"><i class="fas fa-plus" aria-hidden="true"></i></span>
                          <span class="text">Add Action </span>
                        </a>
                      </div>
                  </div>
                <hr>
                 <form class="" id="" name="">
                  <div class="row">
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <input type="text" id="" name="" class="form-control" placeholder="Spatula Name">
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select Type</option>
                            <option value="Flat and slotted">Flat and slotted</option>
                            <option value="silicone">silicone</option>                 
                        </select>
                    </div>
                    <div class="col-lg-3 col-md-4 col-sm-6 mb-2">
                      <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Status</option>
                            <option value="Active">Active</option>
                            <option value="In Active">In Active</option>                 
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
                      <th>Action ID</th>
                      <th>Action Name</th>
                      <th>Description</th>
                      <th>Classification Type</th>
                      <th>Actions</th>
                    </tr>
                  </thead>
                    <tbody>
                    <tr>
                      <td>13</td>
                      <td>Veg Collect</td>
                      <td>Veg Collection</td>
                      <td>Veg</td>
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
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-dark">Update Spatula</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">?</span>
          </button>
        </div>
        <div class="modal-body">
          <form class="">
                <div class="row">
                  <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">ID</label>
                        <input type="text" id="" name="" class="form-control" value="213" disabled="disabled">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Name</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Spatula Name" value="Turners">
                      </div>
                    </div>
                    </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Description</label>
                        <input type="text" id="" name="" class="form-control" placeholder="Enter Description" value="Flat and slotted">
                      </div>
                    </div>
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Type </label>
                        <select name="" id="" class="custom-select mr-sm-2">
                            <option value="">Select</option>
                            <option value="Spatula Type1" selected="selected">Spatula Type1</option>
                            <option value="Spatula Type2">Spatula Type2</option>                 
                        </select>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-6">
                      <div class="form-group">
                        <label class="form-control-label" for="">Image</label>
                        <div class="input-group">
                          <div class="custom-file">
                            <input type="file" class="custom-file-input" id="image">
                            <label class="custom-file-label" for="image">Choose file</label>
                          </div>
                        </div>
                      </div>
                    </div>
                 </div>
                 <div class="row">
                    <div class="col-md-12">
                    <button type="button" class="btn btn-warning my-2" data-dismiss="modal">Update Spatula</button>
                  </div>
                  </div>
                <!-- Address -->
               </form>
        </div>
      </div>
    </div>
  </div>
  <!-- Edit Modal End-->
  <!-- View Modal Start-->
  <div class="modal fade" id="viewModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title">View Spatula Deatils</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">?</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="table-responsive">
                <table class="table table-striped">
                   <tbody>
                    <tr>
                      <td><b>Spatula ID</b></td>
                      <td>45</td>
                    </tr>
                    <tr>
                      <td><b>Spatula Name</b></td>
                      <td>Turners</td>
                    </tr>
                   <tr>
                      <td><b>Description</b></td>
                      <td>Flat and slotted </td>
                    </tr>
                   <tr>
                      <td><b>Type</b></td>
                      <td>Spatula Type1</td>
                    </tr>
                    <tr>
                      <td><b>Image</b></td>
                      <td><img src="https://bulbandkey.com/blog/wp-content/uploads/2020/03/Turners.jpg" class="img-fluid" alt="Spatula" width="400" height="400"></td>
                    </tr>
                    <tr>
                      <td><b>Status</b></td>
                      <td>Active</td>
                    </tr>
                    <tr>
                      <td><b>Created On</b></td>
                      <td>Jul-22-2020 02:05 AM</td>
                    </tr>
                  </tbody>
                </table>
              </div>
        </div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal">Close</button>
         </div>
      </div>
    </div>
  </div>
  <!-- View Modal End -->
  <!-- Delete Modal-->
  <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Delete Entry</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">?</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Delete this Entry ?</div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal">No</button>
          <button class="btn btn-success" type="button">Yes</button>
         </div>
      </div>
    </div>
  </div>
   <!-- In Active Modal-->
  <div class="modal fade" id="inActiveModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Warning Message</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">?</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Inactive this Entry ?</div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal">No</button>
          <button class="btn btn-success" type="button">Yes</button>
         </div>
      </div>
    </div>
  </div>
  <!-- End -->
   <!-- Active Modal-->
  <div class="modal fade" id="activeModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header bg-light">
          <h5 class="modal-title text-danger">Warning Message</h5>
          <button class="close" type="button" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">?</span>
          </button>
        </div>
        <div class="modal-body">Are You Sure Want To Active this Entry ?</div>
        <div class="modal-footer">
          <button class="btn btn-danger" type="button" data-dismiss="modal">No</button>
          <button class="btn btn-success" type="button">Yes</button>
         </div>
      </div>
    </div>
  </div>
  <!-- End -->
<%@include file="../includes/adminFooter_n.jsp"%>
</body>
</html>
