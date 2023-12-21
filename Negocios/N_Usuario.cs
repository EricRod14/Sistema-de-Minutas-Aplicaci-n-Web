using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;
using Datos;
using System.Data;
using StrDatosSQL;

namespace Negocios
{
    public class N_Usuario
    {
        ConexionLogin objd = new ConexionLogin();
        readonly D_SQL_Datos sqlD = new D_SQL_Datos();
        E_Usuario EU = new E_Usuario();
        public DataTable N_User(E_Usuario obje)
        {
            return objd.D_user(obje);
        }

        public string Insertar(E_Usuario pUsuario)
        {
            string R = sqlD.IBM_Entidad<E_Usuario>("Usuarios", pUsuario);
            if (R.Contains("Exito"))
            {
                return "1";
            }
            else
            {
                return "2";
            }
        }

        public string Borrar(int pIdUsuario)
        {
            E_Usuario EU = new E_Usuario();
            EU.Accion = "BORRAR";
            EU.IdLogin = pIdUsuario;

            string R = sqlD.IBM_Entidad<E_Usuario>("Usuarios", EU);
            if (R.Contains("Exito"))
            {
                return "Se han borrado los datos del sistema";
            }
            else
            {
                return "Error al borrar los datos";
            }
        }
        public string Modificar(E_Usuario pUsuario)
        {
            string R = sqlD.IBM_Entidad<E_Usuario>("Usuarios", pUsuario);
            if (R.Contains("Exito"))
            {
                return "Se han modificado los datos";
            }
            else
            {
                return "Error al modificar los datos";
            }
        }

        public DataTable DT_LstCorreos()
        {
            return sqlD.DT_ListadoGeneral("Usuario", "Correo");
        }
        public List<E_Usuario> LstCorreos()
        {
            return StrDatosSQL.D_ConvierteDatos.ConvertirDTALista<E_Usuario>(DT_LstCorreos());
        }


        public List<string> LstBuscarCorreos(int Carrera)
        {
            return (from Usuario in LstCorreos()
                    where Usuario.Carrera == Carrera
                    select Usuario.Correo).ToList();

        }


    }
}
