using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocios;

namespace Presentacion.GestionMinutas
{
    public partial class IBM_Minuta : System.Web.UI.Page
    {
        N_Minuta NM = new N_Minuta();
        protected void Page_Load(object sender, EventArgs e)
        {
            VisualizarGrvMinuta(NM.LstMinuta());
        }

        protected void VisualizarGrvMinuta(List<E_Minuta> pLstMinuta)
        {
            GrvMinuta.DataSource = pLstMinuta;
            GrvMinuta.DataBind();
        }


        protected void BtnInsertar_Click(object sender, EventArgs e)
        {
       
            string accion = "INSERTAR";
            int ID = 0;
            E_Minuta EM = new E_Minuta
            {
                Accion = accion,
                IdMinuta = ID,
                Lugar = TbLugar.Text,
                Fecha = TbFecha.Text,
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
                Responsable3 = TbResponsable3.Text,

            };

        }
    }
}