using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entidades;

namespace Datos
{
    public class ConexionLogin
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConexionBD"].ConnectionString);

        public DataTable D_user(E_Usuario obje)
        {
            SqlCommand cmd = new SqlCommand("sp_logueo_ez", cn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Correo", obje.Correo);
            cmd.Parameters.AddWithValue("@Clave", obje.Password);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            return dt;
        }
    }
}
