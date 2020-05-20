using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class CommonMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["User"] == null)
            {
                Response.Redirect("Login.aspx");
            }
            else if (!Page.IsPostBack)
            {
                var user = (dynamic)Session["User"];
               
                string menu_access = Convert.ToString(user.GetType().GetProperty("MenuAccess").GetValue(user, null));
                string[] menus = menu_access.Split(',');
                 lnkDashBoard.Visible = menus.Contains("DashBoard");

                lnkBrands.Visible = menus.Contains("Brand");
                lnkCategories.Visible = menus.Contains("Categories");
                //lnkStores.Visible = menus.Contains("Stores");
                //lnkProducts.Visible = menus.Contains("Products");
                //lnkOrders.Visible = menus.Contains("Orders");
                //lnkUsers.Visible = menus.Contains("Users");
                //lnkSuppliers.Visible = menus.Contains("Suppliers");

                spnUserName.InnerHtml = Convert.ToString(user.GetType().GetProperty("FirstName").GetValue(user, null)) + " " +
                    Convert.ToString(user.GetType().GetProperty("LastName").GetValue(user, null));
            }
        }
    }
}