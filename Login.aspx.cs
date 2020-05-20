using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["User"] = null;
            Session["UserId"] = null;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtEmail.Text) && !string.IsNullOrEmpty(txtPassword.Text))
            {
                InventoryBL bl = new InventoryBL();
                var user = bl.ValidateUserLogin(txtEmail.Text, txtPassword.Text);
                if (user != null)
                {
                    Session["User"] = user;
                    Session["UserId"] = user.GetType().GetProperty("UserId").GetValue(user, null);
                    Response.Redirect("Dashboard.aspx");
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "Login error", "alert('Invalid User Name/Password!');", true);
                }
            }
        }
    }
}