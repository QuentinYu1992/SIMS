using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegiser_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtFirstName.Text) && !string.IsNullOrEmpty(txtLastName.Text) && !string.IsNullOrEmpty(txtEmail.Text)
                 && !string.IsNullOrEmpty(txtPassword.Text) && !string.IsNullOrEmpty(txtConfirmPassword.Text))
            {
                if (txtPassword.Text != txtConfirmPassword.Text)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Login error", "alert('Password and confirm password should be same!');", true);
                    return;
                }

                InventoryBL bl = new InventoryBL();
                bool result = bl.SaveUser(new tbl_Users()
                {
                    FirstName = txtFirstName.Text,
                    LastName = txtLastName.Text,
                    Email_Id = txtEmail.Text,
                    Gender = "",
                    Phone = "",
                    Password = txtPassword.Text,
                    Group_Id = 3,
                    IsActive = true
                });

                if (result == true)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Login error", "alert('You have successfully register. Please login.');", true);
                    Response.Redirect("Login.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Login error", "alert('Error registering user. This might because of duplicate email address.');", true);
                }
            }
        }
    }
}