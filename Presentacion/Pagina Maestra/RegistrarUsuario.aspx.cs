using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;
namespace Presentacion.Pagina_Maestra
{
    public partial class RegistrarUsuario : System.Web.UI.Page
    {
        public static string ClrExito = "bg-success";
        public static string ClrPeligro = "bg-danger";
        public static string ClrInformacion = "bg-info";
        public static string ClrPrecaucion = "bg-warning";
        public static string ClrPrimario = "bg-primary";
        public static string ClrGeneral = "bg-dark";

        public static string BtnExito = "btn btn-md btn-success ";
        public static string BtnPeligro = "btn btn-md btn-dangr ";
        public static string BtnInformacion = "btn btn-md btn-info ";
        public static string BtnPrecaucion = "btn btn-md btn-warning";
        public static string BtnPrimario = "btn btn-md-primary;";
        public static string BtnGeneral = "btn btn-md-dark";
        N_Usuario NU = new N_Usuario();
        protected void Page_Load(object sender, EventArgs e)
        {
            LblMensaje.Visible = false;
        }

        protected void BtnInsertar_Click(object sender, EventArgs e)
        {
            string accion = "INSERTAR";
            E_Usuario EU = new E_Usuario
            {
                Accion = accion,
                IdLogin = 0,
                Correo = TbCorreo.Text,
                Password = TbClave.Text,
                Rol = Convert.ToString(DpRol.SelectedValue),
                Carrera = Convert.ToInt32(DpCarrera.SelectedValue)
            };
            string R = NU.Insertar(EU);
            LblMensaje.Text = R;
            if (LblMensaje.Text == "1")
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalExito').modal();", true);

            }
            else
            {
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalError').modal();", true);

            }
        }

        //protected void AtributosHeaderCard(string Msg, string Color)
        //{
        //    CardHeader.Attributes.Clear();
        //    CardHeader.Attributes.Add("class", "card-header text-center " + Color);
        //    lblAccion.Text = Msg;
        //}

        //protected void ObjetoEntidad_ControlesWebForm(int pIdUsuario)
        //{
        //    E_Usuario EU = NU.LstBuscarCorreos(pIdUsuario);
        //    if (NU != null)
        //    {
        //        TbObjetivo.Text = EM.Objetivo;
        //        TbLugar.Text = EM.Lugar;
        //        TbAsunto.Text = EM.Asunto;
        //        TbParticipante.Text = EM.Participante;
        //        TbParticipante2.Text = EM.Participante2;
        //        TbParticipante3.Text = EM.Participante3;
        //        TbTarea.Text = EM.Tarea;
        //        TbTarea2.Text = EM.Tarea2;
        //        TbTarea3.Text = EM.Tarea3;
        //        TbResponsable.Text = EM.Responsable;
        //        TbResponsable2.Text = EM.Responsable2;
        //        TbResponsable3.Text = EM.Responsable3;
        //        TbFecha.Text = Convert.ToString(EM.Fecha.ToShortDateString());
        //    }
        //}

        //protected void GrvMinuta_RowEditing(object sender, GridViewEditEventArgs e)
        //{
        //    AtributosHeaderCard("Modificar datos de la minuta", ClrPrimario);
        //    hfIdUsuario.Value = GrvUsuario.DataKeys[e.NewEditIndex].Value.ToString();
        //    e.Cancel = true;
        //    ObjetoEntidad_ControlesWebForm(Convert.ToInt16(hfIdUsuario.Value));
        //    PnlCapturaDatos.Visible = true;
        //    pnlBuscar.Visible = false;
        //    BtnModificar.Visible = true;
        //    GrvUsuario.Visible = false;
        //    BtnRegresar.Visible = true;

        //}

        //protected void GrvMinuta_RowDeleting(object sender, GridViewDeleteEventArgs e)
        //{
        //    AtributosHeaderCard("Borrar minuta", ClrPeligro);
        //    hfIdUsuario.Value = GrvUsuario.DataKeys[e.RowIndex].Value.ToString();
        //    e.Cancel = true;
        //    ObjetoEntidad_ControlesWebForm(Convert.ToInt16(hfIdUsuario.Value));
        //    PnlCapturaDatos.Visible = true;
        //    BtnBorrar.Visible = true;
        //    BtnRegresar.Visible = true;
        //    BtnAgregar.Visible = false;
        //    BtnRecargar.Visible = false;
        //    LblMensaje.Visible = false;
        //    GrvMinuta.Visible = false;
        //    TbObjetivo.ReadOnly = true;
        //    TbFecha.ReadOnly = true;
        //    TbLugar.ReadOnly = true;
        //    TbTarea.ReadOnly = true;
        //    TbTarea2.ReadOnly = true;
        //    TbTarea3.ReadOnly = true;
        //    TbAsunto.ReadOnly = true;
        //    TbParticipante.ReadOnly = true;
        //    TbParticipante2.ReadOnly = true;
        //    TbParticipante3.ReadOnly = true;
        //    TbResponsable.ReadOnly = true;
        //    TbResponsable2.ReadOnly = true;
        //    TbResponsable3.ReadOnly = true;
        //    RfvAsunto.Visible = false;
        //    RfvFecha.Visible = false;
        //    RfvLugar.Visible = false;
        //    RfvObjetivo.Visible = false;
        //    RfvParticipante.Visible = false;
        //    RfvParticipante2.Visible = false;
        //    RfvResponsable.Visible = false;
        //    RfvTarea.Visible = false;
        //    BtnPDF.Visible = false;
        //    BtnLista.Visible = false;

        //}

        protected void SqlDataSource1_Selecting1(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("IBM_Minuta.aspx");

        }
    }
    }
