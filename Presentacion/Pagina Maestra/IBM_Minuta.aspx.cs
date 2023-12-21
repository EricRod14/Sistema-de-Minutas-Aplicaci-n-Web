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
    public partial class ModuloMinuta : System.Web.UI.Page
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
        N_Minuta NM = new N_Minuta();
        E_Minuta EM = new E_Minuta();
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Login.Rol == "1") // Administrador
            {
                PnlCapturaDatos.Visible = false;
                BtnBorrar.Visible = false;
                BtnModificar.Visible = false;
                BtnInsertar.Visible = false;
                BtnRegresar.Visible = false;
                LblRol.Text = "Bienvenido Administrador";
                GrvProfe.Visible = false;
            }
            if(Login.Rol == "2") // Secretario
            {
                PnlCapturaDatos.Visible = false;
                BtnBorrar.Visible = false;
                BtnModificar.Visible = false;
                BtnInsertar.Visible = false;
                BtnRegresar.Visible = false;
                BtnUsuario.Visible = false;
                LblRol.Text = "Bienvenido Secretario";

            }
            if (Login.Rol == "3") // Profesor
            {
                GrvProfe.Visible = false;
                PnlCapturaDatos.Visible = false;
                BtnAgregar.Visible = false;
                BtnBorrar.Visible = false;
                BtnUsuario.Visible = false;
                BtnInsertar.Visible = false;
                BtnInvitacion.Visible = false;
                BtnModificar.Visible = false;
                BtnInsertar.Visible = false;
                BtnRegresar.Visible = false;
                LblRol.Text = "Bienvenido Profesor";

            }
            VisualizarGrvMinuta(NM.LstMinuta());
            TbObjetivo.ReadOnly = false; 
            TbFecha.ReadOnly = false;
            TbLugar.ReadOnly = false;
            TbTarea.ReadOnly = false; 
            TbTarea2.ReadOnly = false;
            TbTarea3.ReadOnly = false;
            TbAsunto.ReadOnly = false;
            TbParticipante.ReadOnly = false;
            TbParticipante2.ReadOnly = false;
            TbParticipante3.ReadOnly = false;
            TbResponsable.ReadOnly = false;
            TbResponsable2.ReadOnly = false;
            TbResponsable3.ReadOnly = false;
            GrvMinuta.Visible = false;

        }

        protected void ControlesOFF()
        {
            PnlCapturaDatos.Visible = false;
            BtnBorrar.Visible = false;
            BtnModificar.Visible = false;
            BtnInsertar.Visible = false;
            BtnRegresar.Visible = false;


        }

        protected void AtributosHeaderCard(string Msg, string Color)
        {
            ControlesOFF();
            CardHeader.Attributes.Clear();
            CardHeader.Attributes.Add("class", "card-header text-center " + Color);
            lblAccion.Text = Msg;
        }


        protected void VisualizarGrvMinuta(List<E_Minuta> pLstMinuta)
        {
            if (Login.Rol != "3")
            {
                GrvMinuta.DataSource = pLstMinuta;
                GrvMinuta.DataBind();
                LblMensaje.Visible = true;
            }
            else
            {
                GrvProfe.DataSource = pLstMinuta;
                GrvProfe.DataBind();
                LblMensaje.Visible = true;
            }
        }


        protected void BtnInsertar_Click(object sender, EventArgs e)
        {
            GrvMinuta.Visible = true;
            BtnAgregar.Visible = true;
            BtnRegresar.Visible = true;
            pnlBuscar.Visible = true;
            BtnLista.Visible = true;
            BtnRecargar.Visible = true;
            BtnUsuario.Visible = true;
            //BtnPDF.Visible = true;
            BtnLista.Visible = true;
            string accion = "INSERTAR";
            E_Minuta EM = new E_Minuta
            {
                Accion = accion,
                IdMinuta = 0,
                Lugar = TbLugar.Text,
                Fecha = Convert.ToDateTime(TbFecha.Text),    
                Objetivo = TbObjetivo.Text,
                Asunto = TbAsunto.Text,
                Participante = TbParticipante.Text,
                Participante2 = TbParticipante2.Text,
                Participante3 = TbParticipante3.Text,
                Tarea = TbTarea.Text,
                Tarea2 = TbTarea2.Text,
                Tarea3 = TbTarea3.Text,
                Responsable = TbResponsable.Text,
                Responsable2 = TbResponsable2.Text,
                Responsable3 = TbResponsable3.Text
            };
            string R = NM.Insertar(EM);
            LblMensaje.Text = R;
            GrvMinuta.Visible = false;
            if (LblMensaje.Text == "1")
            {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalModificar').modal();", true);
            }
            
        }

        protected void GrvMinuta_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ObjetoEntidad_ControlesWebForm(int pIdMinuta)
        {
            E_Minuta EM = NM.BuscaMinuta(pIdMinuta);
            if (EM != null)
            {
                hfIdMinuta.Value = Convert.ToString(EM.IdMinuta);
                TbObjetivo.Text = EM.Objetivo;
                TbLugar.Text = EM.Lugar;
                TbAsunto.Text = EM.Asunto;
                TbParticipante.Text = EM.Participante;
                TbParticipante2.Text = EM.Participante2;
                TbParticipante3.Text = EM.Participante3;
                TbTarea.Text = EM.Tarea;
                TbTarea2.Text = EM.Tarea2;
                TbTarea3.Text = EM.Tarea3;
                TbResponsable.Text = EM.Responsable;
                TbResponsable2.Text = EM.Responsable2;
                TbResponsable3.Text = EM.Responsable3;
                TbFecha.Text = Convert.ToString(EM.Fecha.ToShortDateString());

            }
        }

        protected void GrvMinuta_RowEditing(object sender, GridViewEditEventArgs e)
        {
            AtributosHeaderCard("Modificar datos de la minuta", ClrPrimario);
            hfIdMinuta.Value = GrvMinuta.DataKeys[e.NewEditIndex].Value.ToString();
            e.Cancel = true;
            ObjetoEntidad_ControlesWebForm(Convert.ToInt16(hfIdMinuta.Value));
            PnlCapturaDatos.Visible = true;
            pnlBuscar.Visible = false;
            BtnModificar.Visible = true;
            BtnUsuario.Visible = false;
            BtnInvitacion.Visible = false;
            GrvMinuta.Visible = false;
            BtnRegresar.Visible = true;
            BtnAgregar.Visible = false;
            BtnRecargar.Visible = false;
            LblMensaje.Visible = false;
            RfvAsunto.Visible = false;
            RfvFecha.Visible = false;
            BtnUsuario.Visible = false;
            RfvLugar.Visible = false;
            RfvObjetivo.Visible = false;
            RfvParticipante.Visible = false;
            RfvParticipante2.Visible = false;
            RfvResponsable.Visible = false;
            RfvTarea.Visible = false;
            //BtnPDF.Visible = false;
            BtnLista.Visible = false;

        }

        protected void GrvMinuta_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            AtributosHeaderCard("Borrar minuta", ClrPeligro);
            hfIdMinuta.Value = GrvMinuta.DataKeys[e.RowIndex].Value.ToString();
            e.Cancel = true;
            ObjetoEntidad_ControlesWebForm(Convert.ToInt16(hfIdMinuta.Value));
            PnlCapturaDatos.Visible = true;
            pnlBuscar.Visible = false;
            BtnInvitacion.Visible = false;
            BtnBorrar.Visible = true;
            BtnUsuario.Visible = false;
            BtnRegresar.Visible = true;
            BtnAgregar.Visible = false;
            BtnRecargar.Visible = false;
            LblMensaje.Visible = false;
            GrvMinuta.Visible = false;
            TbObjetivo.ReadOnly = true;
            TbFecha.ReadOnly = true;
            TbLugar.ReadOnly = true;
            TbTarea.ReadOnly = true;
            TbTarea2.ReadOnly = true;
            TbTarea3.ReadOnly = true; 
            TbAsunto.ReadOnly = true;
            TbParticipante.ReadOnly = true;
            TbParticipante2.ReadOnly = true;
            TbParticipante3.ReadOnly = true;
            TbResponsable.ReadOnly = true;
            TbResponsable2.ReadOnly = true;
            TbResponsable3.ReadOnly = true;
            RfvAsunto.Visible = false;
            RfvFecha.Visible = false;
            RfvLugar.Visible = false;
            RfvObjetivo.Visible = false;
            RfvParticipante.Visible = false;
            RfvParticipante2.Visible = false;
            RfvResponsable.Visible = false;
            RfvTarea.Visible = false;
            //BtnPDF.Visible = false;
            BtnLista.Visible = false;

        }


        protected void BtnModificar_Click(object sender, EventArgs e)
        {
            PnlCapturaDatos.Visible = true;
            BtnRegresar.Visible = true;
            BtnRecargar.Visible = false;
            LblMensaje.Visible = false;
            BtnModificar.Visible = true;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalModificar').modal();", true);


        }

        protected void BtnModify_Click(object sender, EventArgs e)
        {
            E_Minuta EM = new E_Minuta("MODIFICAR", Convert.ToInt32(hfIdMinuta.Value), TbObjetivo.Text, TbLugar.Text, TbAsunto.Text, TbParticipante.Text, TbParticipante2.Text, TbParticipante3.Text, TbTarea.Text, TbTarea2.Text, TbTarea3.Text, TbResponsable.Text, TbResponsable2.Text, TbResponsable3.Text, Convert.ToDateTime(TbFecha.Text));
            string R = NM.Modificar(EM);
            GrvMinuta.Visible = true;
            BtnRegresar.Visible = true;
            BtnRecargar.Visible = true;
            BtnUsuario.Visible = true;
            BtnLista.Visible = true;
            BtnInvitacion.Visible = true;
            BtnAgregar.Visible = true;
            pnlBuscar.Visible = true;
            LblMensaje.Text = R;
            GrvMinuta.Visible = false;

        }

        protected void BtnBorrar_Click(object sender, EventArgs e)
        {
            ObjetoEntidad_ControlesWebForm(Convert.ToInt16(hfIdMinuta.Value));
            PnlCapturaDatos.Visible = true;
            BtnBorrar.Visible = true;
            BtnRegresar.Visible = true;
            LblMensaje.Visible = false;
            BtnInvitacion.Visible = false;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "#myModal", "$('#ModalBorrar').modal();", true);
            GrvMinuta.Visible = false;

        }
        protected void BtnView_Click(object sender, EventArgs e)
        {
            PnlCapturaDatos.Visible = true;
            BtnRegresar.Visible = true;
            LblMensaje.Visible = false;
            GrvMinuta.Visible = false;


        }

        protected void BtnDelete_Click(object sender, EventArgs e)
        {
            string R = NM.Borrar(Convert.ToInt32(hfIdMinuta.Value));
            GrvMinuta.Visible = true;
            BtnRegresar.Visible = true;
            BtnAgregar.Visible = true;
            BtnRecargar.Visible = true;
            pnlBuscar.Visible = true;
            BtnLista.Visible = true;
            BtnInvitacion.Visible = true;
            BtnUsuario.Visible = true;
            LblMensaje.Text = R;
            GrvMinuta.Visible = false;

        }

        protected void BtnAgregar_Click(object sender, EventArgs e)
        {
            AtributosHeaderCard("Capturar datos", ClrExito);
            GrvMinuta.Visible = false;
            pnlBuscar.Visible = false;
            PnlCapturaDatos.Visible = true;
            BtnRecargar.Visible = false;
            BtnInsertar.Visible = true;
            BtnAgregar.Visible = false;
            LblMensaje.Visible = false;
            BtnRegresar.Visible = true;
            BtnUsuario.Visible = false;
            BtnLista.Visible = false;
            BtnInvitacion.Visible = false;
            TbObjetivo.Text = string.Empty;
            TbFecha.Text = string.Empty;
            TbLugar.Text = string.Empty;
            TbTarea.Text = string.Empty;
            TbTarea2.Text = string.Empty;
            TbTarea3.Text = string.Empty;
            TbAsunto.Text = string.Empty;
            TbParticipante.Text = string.Empty;
            TbParticipante2.Text = string.Empty;
            TbParticipante3.Text = string.Empty;
            TbResponsable.Text = string.Empty;
            TbResponsable2.Text = string.Empty;
            TbResponsable3.Text = string.Empty;


        }

        protected void BtnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("IBM_Minuta.aspx");

        }

        protected void BtnBuscar_Click(object sender, EventArgs e)
        {
            List<E_Minuta> LstMinuta = NM.LstBuscarMinuta(TbBuscar.Text);

            if (LstMinuta.Count == 0)
                LblMensaje.Text = "Dato no encontrado";
                BtnAgregar.Visible = false;
                BtnRecargar.Visible = true;
            if (LstMinuta.Count == 1)
            {
                if (Login.Rol != "3"){
                    ObjetoEntidad_ControlesWebForm(LstMinuta[0].IdMinuta);
                    AtributosHeaderCard("Minuta encontrada", ClrInformacion);               
                    PnlCapturaDatos.Visible = true;
                BtnRegresar.Visible = true;
                BtnBorrar.Visible = true;
                BtnModificar.Visible = true;
                GrvMinuta.Visible = false;
                 BtnInvitacion.Visible = false;
                    pnlBuscar.Visible = false;
                PnlTabla.Visible = false;
           
                }
                else
                {
                    BtnLista.Visible = false;
                    BtnInsertar.Visible = false;
                    ObjetoEntidad_ControlesWebForm(LstMinuta[0].IdMinuta);
                    AtributosHeaderCard("Minuta encontrada", ClrInformacion);
                    PnlCapturaDatos.Visible = true;
                    BtnRegresar.Visible = true;
                    BtnBorrar.Visible = false;
                    BtnModificar.Visible = false;
                    GrvMinuta.Visible = false;
                    BtnInvitacion.Visible = false;
                    GrvProfe.Visible = false;
                    pnlBuscar.Visible = false;
                    PnlTabla.Visible = false;
                    BtnAgregar.Visible = false;
                    BtnRecargar.Visible = false;
                    TbObjetivo.ReadOnly = true;
                    TbFecha.ReadOnly = true;
                    TbLugar.ReadOnly = true;
                    TbTarea.ReadOnly = true;
                    TbTarea2.ReadOnly = true;
                    TbTarea3.ReadOnly = true;
                    TbAsunto.ReadOnly = true;
                    TbParticipante.ReadOnly = true;
                    TbParticipante2.ReadOnly = true;
                    TbParticipante3.ReadOnly = true;
                    TbResponsable.ReadOnly = true;
                    TbResponsable2.ReadOnly = true;
                    TbResponsable3.ReadOnly = true;

                }

            }
            else
                VisualizarGrvMinuta(LstMinuta);
                GrvMinuta.Visible = true;
                pnlBuscar.Visible = true;
                TbBuscar.Visible = true;
        }
        protected void TbBuscar_TextChanged(object sender, EventArgs e)
        {
            BtnRegresar.Visible = true;
            LblMensaje.Visible = false;
            TbBuscar.Visible = false;
            pnlBuscar.Visible = false;
        }

        protected void TbResponsable2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void BtnLista_Click(object sender, EventArgs e)
        {
            if (Login.Rol != "3")
            {        
                GrvMinuta.Visible = true;
            }
            else
            {
                GrvProfe.Visible = true;
            }

            LblMensaje.Visible = false;
        }

        protected void BtnPDF_Click(object sender, EventArgs e)
        {

        }

        protected void BtnUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("RegistrarUsuario.aspx");

        }

        protected void GrvProfe_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            AtributosHeaderCard("Minuta", ClrInformacion);
            hfIdMinuta.Value = GrvProfe.DataKeys[e.RowIndex].Value.ToString();
            e.Cancel = true;
            ObjetoEntidad_ControlesWebForm(Convert.ToInt16(hfIdMinuta.Value));
            PnlCapturaDatos.Visible = true;
            pnlBuscar.Visible = false;
            BtnBorrar.Visible = false;
            BtnUsuario.Visible = false;
            BtnRegresar.Visible = true;
            BtnAgregar.Visible = false;
            BtnRecargar.Visible = false;
            LblMensaje.Visible = false;
            GrvMinuta.Visible = false;
            TbObjetivo.ReadOnly = true;
            TbFecha.ReadOnly = true;
            TbLugar.ReadOnly = true;
            TbTarea.ReadOnly = true;
            TbTarea2.ReadOnly = true;
            TbTarea3.ReadOnly = true;
            TbAsunto.ReadOnly = true;
            TbParticipante.ReadOnly = true;
            TbParticipante2.ReadOnly = true;
            TbParticipante3.ReadOnly = true;
            TbResponsable.ReadOnly = true;
            TbResponsable2.ReadOnly = true;
            TbResponsable3.ReadOnly = true;
            RfvAsunto.Visible = false;
            RfvFecha.Visible = false;
            RfvLugar.Visible = false;
            RfvObjetivo.Visible = false;
            RfvParticipante.Visible = false;
            RfvParticipante2.Visible = false;
            RfvResponsable.Visible = false;
            RfvTarea.Visible = false;
            //BtnPDF.Visible = false;
            BtnLista.Visible = false;
        }

        protected void BtnInvitacion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Invitaciones.aspx");
        }
    }
}