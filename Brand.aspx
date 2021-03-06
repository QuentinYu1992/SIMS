﻿<%@ Page Title="" Language="C#" MasterPageFile="~/CommonMaster.master" AutoEventWireup="true" CodeBehind="Brand.aspx.cs" Inherits="InventoryStore.Brand" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="content-wrapper" class="d-flex flex-column">
        <div class="container-fluid">
            <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800">Manage Brands</h1>
            <div style="clear: both; padding: 10px 0px 10px 0px">
                <button class="btn-primary btn-Show-Save" btn-save-id="0" type="button">Add Brand</button>
                <div class="modal fade" id="addBrandModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="addModalLabel">Add Brand</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form runat="server">
                                    <div class="form-group">
                                        <label>Category</label>
                                        <asp:DropDownList runat="server" required CssClass="form-control" ID="ddlCategory"></asp:DropDownList>
                                    </div>
                                    <div class="form-group">
                                        <label>Brand Name</label>
                                        <input type="text" class="form-control" id="txtName" placeholder="Enter Brand name" />
                                    </div>
                                    <div class="form-group">
                                        <label>Status</label>
                                        <select class="form-control" id="ddlStatus">
                                            <option value="1">Active</option>
                                            <option value="0">Inactive</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label>Company Name</label>
                                        <input type="text" class="form-control" id="txtCName" placeholder="Enter Company name" />
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
                <div class="modal fade" id="deleteBrandModal" tabindex="-1" role="dialog" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Delete Confirmation</h5>
                                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <span>Are you sure want to delete this record?</span>
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
                        <%--<asp:GridView ID="dataTable" runat="server" AutoGenerateColumns="false" DataKeyNames="User_Id" CssClass="table table-bordered"
                            OnRowCommand="dataTable_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="Brand Name" />
                                <asp:BoundField DataField="LastName" HeaderText="Status" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <button class="btn btn-primary" type="button" data-toggle="modal" data-target="#addBrandModal">Edit</button>
                                        <button class="btn btn-danger">Delete</button>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>--%>
                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                            <thead>
                                <tr>
                                    <th>Category</th>
                                    <th>Brand Name</th>
                                    <th>Company Name</th>
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

        function openSaveModal(id, that) {
            $("#btnSaveModal").attr('btn-save-id', id);
            if (id > 0) {
                $("#addModalLabel").text("Edit Brand");
                var model = JSON.parse($(that).attr("btn-save-model"));
                $("#txtName").val(model.Brand_Name);
                $("#ddlStatus").val(model.Brand_Status ? "1" : "0");
                $("#ddlCategory").val(model.Category_id ? model.Category_id : "0");
                $("#txtCName").val(model.Company_Name);


            }
            else {
                $("#addModalLabel").text("Add Brand");
                $("#txtName").val("");
                $("#ddlStatus").val("1");
            }
            $("#addBrandModal").modal('show');
        }

        function openDeleteConfirmation(id) {
            $("#btnDeleteModal").attr('btn-save-id', id);
            $("#deleteBrandModal").modal('show');
        }

        $(document).ready(function () {
            loadBrands();

            function loadBrands() {
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Brand.aspx/GetBrands") %>',
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
                                $("#dataTable tbody").append("<tr><td>" + result.d[i].Category_Name + "</td><td>" + result.d[i].Brand_Name + "</td><td>" + result.d[i].Company_Name + "</td><td>" + (result.d[i].Brand_Status ? "Active" : "Inactive") + "</td>" +
                                    "<td><button class='btn btn-primary btn-Show-Save' onclick='openSaveModal(" + result.d[i].Brand_Id + ",this);' btn-save-model='" + JSON.stringify(result.d[i]) + "'>Edit</button>&nbsp" +
                                    "<button class='btn btn-danger btn-Show-delete' onclick='openDeleteConfirmation(" + result.d[i].Brand_Id + ");'> Delete</button ></td></tr>");
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

            $("#btnSaveModal").click(function () {
                var reqData = {
                    id: $(this).attr('btn-save-id'),
                    name: $("#txtName").val(),
                    status: $("#ddlStatus").val(),
                    Category_id: $("#<%= ddlCategory.ClientID %>").val(),
                    companyname: $("#txtCName").val(),
                };
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Brand.aspx/SaveBrand") %>',
                    data: JSON.stringify(reqData),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    },
                    success: function (result) {
                        if (result && result.d && result.d == true) {
                            loadBrands();
                            alert('Brand saved succesfully');
                            $("#addBrandModal").modal('hide');
                        }
                        else {
                            alert('Error Saving! This may because duplicate name.');
                        }
                    }
                });
            });

            $("#btnDeleteModal").click(function () {
                var reqData = {
                    id: $(this).attr('btn-save-id')
                };
                $.ajax({
                    type: "POST",
                    url: '<%= ResolveUrl("Brand.aspx/DeleteBrand") %>',
                    data: JSON.stringify(reqData),
                    contentType: 'application/json; charset=utf-8',
                    dataType: 'json',
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        alert("Request: " + XMLHttpRequest.toString() + "\n\nStatus: " + textStatus + "\n\nError: " + errorThrown);
                    },
                    success: function (result) {
                        if (result && result.d && result.d == true) {
                            loadBrands();
                            $("#deleteBrandModal").modal('hide');
                        }
                        else {
                            alert('Error Deleting record!');
                        }
                    }
                });
            });
        });

    </script>
</asp:Content>
