using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Usuario
    {
        #region Atributos
        public string _Accion;
        public int _IdLogin;
        public String _Correo;
        public String _Password;
        public String _Rol;
        public int _Carrera;
        #endregion

        #region Constructor
        public E_Usuario()
        {
            Accion = string.Empty;
            IdLogin = 0;
            Correo = String.Empty;
            Password = String.Empty;
            Rol = String.Empty;
            Carrera = 0;
        }

        public E_Usuario(string accion, int idLogin, String correo, String password, String rol, int carrera)
        {
            _Accion = accion;
            _IdLogin = idLogin;
            _Correo = correo;
            _Password = password;
            _Rol = rol;
            _Carrera = carrera;
        }
        #endregion

        #region Encapsulamiento

        public string Accion { get => _Accion; set => _Accion = value; }
        public int IdLogin { get => _IdLogin; set => _IdLogin = value; }
        public String Correo { get => _Correo;  set => _Correo = value; }
        public String Password { get => _Password; set => _Password = value; }
        public String Rol { get => _Rol; set => _Rol = value; }
        public int Carrera { get => _Carrera; set => _Carrera = value; }
        #endregion
    }
}
