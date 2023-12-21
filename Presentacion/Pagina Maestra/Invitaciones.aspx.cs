using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Net;
using System.Net.Mail;
using Entidades;
using System.Data;
using StrDatosSQL;
using Datos;
using System.Data.SqlClient;
using Negocios;

namespace Presentacion.Pagina_Maestra
{
    public partial class Invitaciones : System.Web.UI.Page
    {
        E_Usuario EU = new E_Usuario();
        N_Usuario NU = new N_Usuario();

        protected void Page_Load(object sender, EventArgs e)
        {
            lblMsg.Visible = false;
        }

        public string EnviaEmail(string pLugar, string pCopia, string pSubjet, string pMensaje, int IdCarrera)
        {
            const string Usuario = "eric.rodriguez24@uabc.edu.mx";
            const string PassWord = "alberto1";
            const string Nombre = "Sistema de Minutas";
            try
            {
                MailMessage Email = new MailMessage();
                Email.SubjectEncoding = Encoding.UTF8;
                Email.BodyEncoding = Encoding.UTF8;
                Email.From = new MailAddress(Usuario, Nombre);
                List<string> LstCorreos = NU.LstBuscarCorreos(IdCarrera);
                if (LstCorreos.Count == 0)
                {
                    return "0";
                }
                else
                {
                    foreach (string Correos in LstCorreos)
                    {
                        Email.To.Add(Correos);
                        Email.Subject = pSubjet;
                        Email.Body = pMensaje;
                        Email.Body = pLugar;
                    }
                    if (pCopia != string.Empty)
                    {

                        MailAddress Bcopy = new MailAddress(pCopia);
                        Email.Bcc.Add("eric.rodriguez24@uabc.edu.mx");
                    }

                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    SmtpServer.Port = 587; //SMTP de GMAIL
                    SmtpServer.UseDefaultCredentials = false;
                    SmtpServer.Credentials = new NetworkCredential(Usuario, PassWord);    //Correo emisor
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(Email);
                }
                    return "1";


            }
            catch (SmtpException ex)
            {
                return "Error:" + ex.Message;
            }
        }

        protected void BtnEnviar_Click(object sender, EventArgs e)
        {
            lblMsg.Text = EnviaEmail(TbLugar.Text,TbCopia.Text, TbFecha.Text, TbObjetivo.Text, Convert.ToInt32(DdlCarrera.SelectedValue));
            if (lblMsg.Text == "0")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalNoCorreos').modal();", true);
            }
            else
            {

                if (lblMsg.Text == "1")
                {
                    ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalEnvio').modal();", true);
                }
                else
                {
                    if(lblMsg.Text == "2")
                    {
                        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalError').modal();", true);
                    }
                }
            }
        }
        protected void TbCorreos_TextChanged(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}