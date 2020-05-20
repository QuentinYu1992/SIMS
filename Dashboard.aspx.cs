using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InventoryStore
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                LoadDashBoard();
        }

        public void LoadDashBoard()
        {
            InventoryBL bl = new InventoryBL();
            var counts = bl.GetDashboardDetails();
            spnBrandsCount.InnerHtml = Convert.ToString(counts.GetType().GetProperty("BrandsCount").GetValue(counts, null));
            spnCategoriesCount.InnerHtml = Convert.ToString(counts.GetType().GetProperty("CategoriesCount").GetValue(counts, null));

        }
    }
}