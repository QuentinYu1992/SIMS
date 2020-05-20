<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeBehind="Users.aspx.cs" Inherits="InventoryStore.Users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Manage Users</h1>
            <div style="clear: both; padding: 10px 0px 10px 0px">
                <button class="btn-primary btn-Show-Save" btn-save-id="0" type="button">Add User</button>
                <div class="modal fade" id="addUserModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addModalLabel">Add User</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form runat="server">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label>First Name</label>
                                            <input type="text" class="form-control" id="txtFirstName" placeholder="Enter First name" />
                                        </div>
                                        <div class="col-md-6">
                                            <label>Last Name</label>
                                            <input type="text" class="form-control" id="txtLastName" placeholder="Enter Last name" />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label>Gender</label>
                                            <select class="form-control" id="ddlGender">
                                                <option value="1">Male</option>
                                                <option value="0">Female</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6">
                                            <label>Phone</label>
                                            <input type="text" class="form-control" id="txtPhone" placeholder="Enter Phone" />
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label>User Name/Email</label>
                                            <input type="text" class="form-control" id="txtEmail" placeholder="Enter Email" />
                                        </div>
                                        <div class="col-md-6">
                                            <label>User Group</label>
                                            <select class="form-control" id="ddlGroup">
                                                <option value="2">Staff</option>
                                                <option value="3">Customer</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <label>Status</label>
                                            <select class="form-control" id="ddlStatus">
                                                <option value="1">Active</option>
                                                <option value="0">Inactive</option>
                                            </select>
                                        </div>
                                        <div class="col-md-6"></div>
                                    </div>
                                </form>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="#" id="btnSaveModal">Save</a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal fade" id="deleteUserModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete Confirmation</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <span>Are you sure want to delete this user?</span>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                                <a class="btn btn-primary" href="#" id="btnDeleteModal">Delete</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Name</th>
                                    <th>Gender</th>
                                    <th>Phone</th>
                                    <th>Email</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            loadUsers();

            function loadUsers() {
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Users.aspx/GetUsers") %>',
                    data: {},
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    },
                    success: function (result) {
                        $("#dataTable tbody").html("");
                        if (result && result.d && result.d.length > 0) {
                            for (var i = 0; i < result.d.length; i++) {
                                $("#dataTable tbody").append("<tr>" +
                                    "<td>" + (result.d[i].FirstName + " " + result.d[i].LastName) + "</td>" +
                                    "<td>" + (result.d[i].Gender == "M" ? "Male" : (result.d[i].Gender == "F" ? "Female" : "")) + "</td>" +
                                    "<td>" + result.d[i].Phone + "</td>" +
                                    "<td>" + result.d[i].Email_Id + "</td>" +
                                    "<td>" + (result.d[i].IsActive ? "Active" : "Inactive") + "</td>" +
                                    "<td>" +
                                    (result.d[i].GroupId == "1" ? "" : (
                                        "<button class='btn btn-primary btn-Show-Save' onclick='openSaveModal(" + result.d[i].User_Id + ",this);' btn-save-model='" + JSON.stringify(result.d[i]) + "'>Edit</button>&nbsp" +
                                        "<button class='btn btn-danger btn-Show-delete' onclick='openDeleteConfirmation(" + result.d[i].User_Id + ");'> Delete</button>")) +
                                    "</td></tr>");
                            }
                        }
                        else {
                            $("#dataTable tbody").append('<tr><td colspan="3">No records found!</td><td>');
                        }
                        $('#dataTable').DataTable();
                        //alert("We returned: " + JSON.stringify(result));
                    }
                });
            }

            $(".btn-Show-Save").click(function () {
                var rowId = parseInt($(this).attr('btn-save-id'));
                openSaveModal(rowId, $(this));
            });

            function openSaveModal(id, that) {
                $("#btnSaveModal").attr('btn-save-id', id);
                if (id > 0) {
                    $("#addModalLabel").text("Edit User");
                    var model = JSON.parse($(that).attr("btn-save-model"));
                    $("#txtFirstName").val(model.FirstName);
                    $("#txtLastName").val(model.LastName);
                    $("#ddlGender").val(model.Gender == "M" ? "1" : "0");
                    $("#txtPhone").val(model.Phone);
                    $("#txtEmail").val(model.Email_Id);
                    $("#txtEmail").attr("readonly", "readonly");
                    $("#ddlGroup").val(model.GroupId);
                    $("#ddlStatus").val(model.IsActive);
                }
                else {
                    $("#addModalLabel").text("Add User");
                    $("#txtFirstName").val("");
                    $("#txtLastName").val("");
                    $("#ddlGender").val("1");
                    $("#txtPhone").val("");
                    $("#txtEmail").val("");
                    $("#ddlGroup").val("");
                    $("#ddlStatus").val("");
                }
                $("#addUserModal").modal('show');
            }
        });

    </script>
</asp:Content>
