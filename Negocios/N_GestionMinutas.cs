using Entidades;
using StrDatosSQL;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace Negocios
{
    public class N_Minuta
    {
        readonly D_SQL_Datos sqlD = new D_SQL_Datos();
        E_Minuta EM = new E_Minuta();

        public string Insertar(E_Minuta pMinuta)
        {
            string R = sqlD.IBM_Entidad<E_Minuta>("IBM_Minutas", pMinuta);
            if (R.Contains("Exito"))
            {
                return "Los datos han sido grabados en el sistema";
            }
            else
            {
                return "Error al grabar los datos en el sistema";
            }
        }

        public string Borrar(int pIdMinuta)
        {
            E_Minuta EM = new E_Minuta();
            EM.Accion = "BORRAR";
            EM.IdMinuta = pIdMinuta;

            string R = sqlD.IBM_Entidad<E_Minuta>("IBM_Minutas", EM);
            if (R.Contains("Exito"))
            {
                return "Se han borrado los datos del sistema";
            }
            else
            {
                return "Error al borrar los datos";
            }
        }
        public string Modificar(E_Minuta pMinuta)
        {
            string R = sqlD.IBM_Entidad<E_Minuta>("IBM_Minutas", pMinuta);
            if (R.Contains("Exito"))
            {
                return "Se han modificado los datos";
            }
            else
            {
                return "Error al modificar los datos";
            }
        }
  
        public DataTable DT_LstMinuta()
        {
            return sqlD.DT_ListadoGeneral("Minuta", "Fecha");
        }
        public List<E_Minuta> LstMinuta()
        {
            return StrDatosSQL.D_ConvierteDatos.ConvertirDTALista<E_Minuta>(DT_LstMinuta());
        }

        public E_Minuta BuscaMinuta(int pCriterio)
        {
            return (from Minuta in LstMinuta() where Minuta.IdMinuta == pCriterio select Minuta).FirstOrDefault();
        }
        public List<E_Minuta> LstBuscarMinuta(string pCriterio)
        {
            return (from Minuta in LstMinuta()
                    where Minuta.Objetivo.ToUpper().Contains(pCriterio.ToUpper()) ||
                          Minuta.Asunto == pCriterio select Minuta).ToList();
        }
    }
}

   
