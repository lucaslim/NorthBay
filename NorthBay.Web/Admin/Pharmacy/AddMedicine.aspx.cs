using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using NorthBay.Logic.Pharmacy;
using NorthBay.Utility;

namespace NorthBay.Web.Admin.Pharmacy
{
    public partial class AddMedicine : Basepage
    {
        private static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            JScript.AddScript("");
            Css.AddCss("");
            lblError.Text = "";

            if (!IsPostBack)
            {
                refreshGridView();
            }
            else
            {
                return;
            }
            SetMedicineCategoryData();
        }


        private void SetMedicineCategoryData()
        {
            var objMedicineCategory = new MedicineCategory();

            ddl_category.DataSource = objMedicineCategory.SelectAll();
            ddl_category.DataTextField = "CategoryName";
            ddl_category.DataValueField = "Id";
            ddl_category.DataBind();
        }



        public void refreshGridView()
        {
            Medicine objMedicine = new Medicine();
            gridView.DataSource = objMedicine.SelectAll();
            gridView.DataBind();
        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var medicine = new Framework.Database.Medicine
            {
                Name = txtName.Text,
                Price = Convert.ToDouble(txtPrice.Text),
                Stock = Convert.ToInt32(txtStock.Text),
                Description = txtDescription.Text,
                CategoryId = TextHelper.ToInteger(ddl_category.SelectedValue) ?? 1,
                Active = TextHelper.ToBool(ddl_active.SelectedValue) ?? false
               
            };

           var medicineObj = new Medicine();
            
            if (!medicineObj.Insert(medicine))
            {

            }
            else
            {
                Redirect("AddMedicine.aspx");
            }
           
            lblError.Text = "Medicine Saved";
            Reset();
            refreshGridView();
        }

        public void Reset()
        {
            txtName.Text = "";
            txtDescription.Text = "";
        }


        protected void GridViewResult_SelectedIndexChanged(object sender, EventArgs e)
        {
            id = Convert.ToInt32(gridView.SelectedValue.ToString());
        }
        protected void GridViewResult_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            MedicineDB db = new MedicineDB();
            int id = Convert.ToInt32(gridView.Rows[e.RowIndex].Cells[1].Text);
            db.DeleteMedById(id);
            Response.Redirect("AddMedicine.aspx");  
        }
        protected void GridViewResult_RowEditing(object sender, GridViewEditEventArgs e)
        {
            btnAdd.Visible = false;
            btnCancel.Visible = true;
            btnUpdate.Visible = true;

            id = Convert.ToInt32(gridView.Rows[e.NewEditIndex].Cells[1].Text);
            txtName.Text = gridView.Rows[e.NewEditIndex].Cells[2].Text.ToString();
            txtDescription.Text = gridView.Rows[e.NewEditIndex].Cells[6].Text.ToString();
            txtPrice.Text = gridView.Rows[e.NewEditIndex].Cells[3].Text.ToString();
            txtStock.Text = gridView.Rows[e.NewEditIndex].Cells[4].Text.ToString();
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            MedicineDB db = new MedicineDB();
            Framework.Database.Medicine med = new Framework.Database.Medicine();
            med.Id = id;
            med.Name = txtName.Text;
            med.Price = Convert.ToDouble(txtPrice.Text);
            med.Stock = Convert.ToInt32(txtStock.Text);
            med.Description = txtDescription.Text;
            med.CategoryId = Convert.ToInt32(ddl_category.SelectedValue);
            db.UpdateMedicine(med);
            Response.Redirect("AddMedicine.aspx");

        }
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Reset();
        }
    }
}