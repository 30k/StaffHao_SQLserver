using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Configuration;

namespace StaffHao_SQLserver
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {        
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string imgName = FileUpload1.FileName;
            string lastName = imgName.Substring(imgName.LastIndexOf(".") + 1);
            if (lastName.ToLower() == "jpg" || lastName.ToLower() == "bmp" || lastName.ToLower() == "gif")
            {
                string savePath = Server.MapPath("~/Picutres/partner") + imgName;
                FileUpload1.PostedFile.SaveAs(savePath);
                string sqlInsert = "insert into test(image) values('" + imgName + "')";
                OleDbConnection conn = new OleDbConnection(ConfigurationManager.ConnectionStrings["ConnectionStringHAO"].ToString());
                conn.Open();
                OleDbCommand cmd = new OleDbCommand(sqlInsert, conn);
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }

    }
}