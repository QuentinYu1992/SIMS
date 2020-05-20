<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="InventoryStore.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet" />
</head>
<body class="bg-gradient-primary">
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <div class="row" style="text-align: center; padding-top: 30px;">
                    <div class="col-lg-12">
                        <h1 class="h3 mb-2 text-gray-800">Welcome to Inventory Store!</h1>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="p-5">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
                            </div>
                            <form class="user" runat="server">
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:TextBox runat="server" ID="txtFirstName" placeholder="First Name" CssClass="form-control form-control-user"></asp:TextBox>
                                        <%--<input type="text" class="form-control form-control-user" id="exampleFirstName" placeholder="First Name">--%>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox runat="server" ID="txtLastName" placeholder="Last Name" required CssClass="form-control form-control-user"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <asp:TextBox runat="server" ID="txtEmail" placeholder="Email Address" required TextMode="Email" CssClass="form-control form-control-user"></asp:TextBox>
                                </div>
                                <div class="form-group row">
                                    <div class="col-sm-6 mb-3 mb-sm-0">
                                        <asp:TextBox runat="server" CssClass="form-control form-control-user" TextMode="Password" ID="txtPassword" required placeholder="Password"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-6">
                                        <asp:TextBox runat="server" CssClass="form-control form-control-user" TextMode="Password" ID="txtConfirmPassword" required placeholder="Confirm Password"></asp:TextBox>
                                    </div>
                                </div>
                                <asp:Button runat="server" Text="Register Account" ID="btnRegiser" CssClass="btn btn-primary btn-user btn-block" OnClick="btnRegiser_Click" />
                                </a>
                                <hr>
                            </form>
                            <hr>
                            <%--<div class="text-center">
                                <a class="small" href="forgot-password.html">Forgot Password?</a>
                            </div>--%>
                            <div class="text-center">
                                <a class="small" href="Login.aspx">Already have an account? Login!</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
</body>
</html>
