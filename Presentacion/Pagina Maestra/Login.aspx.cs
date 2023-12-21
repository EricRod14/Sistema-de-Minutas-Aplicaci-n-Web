using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

namespace Presentacion
{
    public partial class Login : System.Web.UI.Page
    {
        E_Usuario objeuser = new E_Usuario();
        N_Usuario objnuser = new N_Usuario();

        public static string Rol;

        void Logeo()
        {
            DataTable dt = new DataTable();
            objeuser.Correo = tbCorreo.Text;
            objeuser.Password = tbClave.Text;

            dt = objnuser.N_User(objeuser);

            if (dt.Rows.Count>0)
            {

                Rol = dt.Rows[0][0].ToString();
                Response.Redirect("IBM_Minuta.aspx");
               
            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalError').modal();", true);
            }

        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BtnIngresar_Click(object sender, EventArgs e)
        {
           Logeo();
          
        }

        protected void tbClave_TextChanged(object sender, EventArgs e)
        {

        }
    }
}