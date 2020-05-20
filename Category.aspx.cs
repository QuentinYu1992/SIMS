using InventoryStore.DL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Runtime.CompilerServices;

public partial class Category : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static dynamic GetCategorys()
    {
        InventoryBL bl = new InventoryBL();
        var result = bl.GetCategories();
        return result;
    }

    [WebMethod]
    public static bool SaveCategory(string id, string name, string status)
    {
        InventoryBL bl = new InventoryBL();
        tbl_Categories Category = new tbl_Categories()
        {
            Category_Id = Convert.ToInt32(id),
            Category_Name = name,
            Category_Status = status == "1" ? true : false
        };
        if (!bl.ValidateCategory(Category))
        {
            bool result = bl.SaveCategory(Category);
            return result;
        }
        return false;
    }

    [WebMethod]
    public static bool DeleteCategory(string id)
    {
        InventoryBL bl = new InventoryBL();
        bool result = bl.DeleteCategory(Convert.ToInt32(id));
        return result;
    }
}