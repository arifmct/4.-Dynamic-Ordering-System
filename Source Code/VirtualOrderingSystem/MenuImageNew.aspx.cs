using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace VirtualOrderingSystem
{
    public partial class MenuImageNew : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ddlMenu.Enabled = false;
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            lblEImage.Text = "";
            lblEMenu.Text = "";
            lblETitle.Text = "";
            int er = 0;

            if(txtTitle.Text == "")
            {
                er++;
                lblETitle.Text = "Required";
            }
            else if(txtTitle.Text.Length > 200)
            {
                er++;
                lblETitle.Text = "Max 200 Character";
            }

            if(ddlMenu.SelectedValue.ToString() == "0")
            {
                er++;
                lblEMenu.Text = "Select One";
            }

            string img = System.IO.Path.GetFileName(fleImage.FileName);
            string ext = System.IO.Path.GetExtension(fleImage.FileName).ToLower();

            if(img == null || img == "")
            {
                er++;
                lblEImage.Text = "Required";
            }
            else if(!(ext == ".jpg" || ext == ".png" || ext == ".gif"))
            {
                er++;
                lblEImage.Text = "Only JPG, PNG, GIF Supported";
            }

            if (er > 0)
                return;

            SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);
            cn.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = "insert into MenuImages(MenuId, Title, Description, Image) values(@MenuId, @Title, @Description, @Image) select @@identity";

            cmd.Parameters.AddWithValue("@MenuId", ddlMenu.SelectedValue);
            cmd.Parameters.AddWithValue("@Title", txtTitle.Text);
            cmd.Parameters.AddWithValue("@Description", txtDescription.Text);
            cmd.Parameters.AddWithValue("@Image", img);

            try
            {
                int id = Convert.ToInt32(cmd.ExecuteScalar());
                fleImage.SaveAs(Server.MapPath("Uploads/MenuImages/"+ id.ToString() +"_" + img));
                lblMessage.Text = "Menu Image Saved";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                txtDescription.Text = "";
                txtTitle.Text = "";
                ddlMenu.SelectedIndex = 0;
            }
            catch(Exception ex)
            {
                lblMessage.Text = ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }


        }

        protected void txtTitle_TextChanged(object sender, EventArgs e)
        {
            if(txtTitle.Text.Length > 0)
            {
                ddlMenu.Enabled = true;
            }
            else
            {
                ddlMenu.Enabled = false;
            }
        }
    }
}