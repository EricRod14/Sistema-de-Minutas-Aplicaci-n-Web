using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class E_Minuta
    {
        #region Atributos
        private string _Accion; // Para insertar, borrar, modificar...
        private int _IdMinuta;
        private string _Objetivo; // Objetivo/Tema de la minuta
        private string _Lugar;  // Lugar donde se realiza la reunion
        private string _Asunto; // Asuntos a tratar
        private string _Participante; 
        private string _Participante2;
        private string _Participante3;
        private string _Tarea;
        private string _Tarea2;
        private string _Tarea3;
        private string _Responsable;
        private string _Responsable2;
        private string _Responsable3;
        private DateTime _Fecha;  // Fecha del dia;

        #endregion

        #region Constructor
        public E_Minuta()
        {
            Accion = string.Empty;
            IdMinuta = 0;
            Objetivo = string.Empty;
            Lugar = string.Empty;
            Asunto = string.Empty;
            Participante = string.Empty;
            Participante2 = string.Empty;
            Participante3 = string.Empty;
            Tarea = string.Empty;
            Tarea2 = string.Empty;
            Tarea3 = string.Empty;
            Responsable = string.Empty;
            Responsable2 = string.Empty;
            Responsable3 = string.Empty;
            Fecha = DateTime.Today;
        }

        public E_Minuta(string accion, int idMinuta, string objetivo, string lugar, string asunto, string participante, string participante2, string participante3, string tarea, string tarea2, string tarea3, string responsable, string responsable2, string responsable3, DateTime fecha)
        {
            _Accion = accion;
            _IdMinuta = idMinuta;
            _Objetivo = objetivo;
            _Lugar = lugar;
            _Asunto = asunto;
            _Participante = participante;
            _Participante2 = participante2;
            _Participante3 = participante3;
            _Tarea = tarea;
            _Tarea2 = tarea2;
            _Tarea3 = tarea3;
            _Responsable = responsable;
            _Responsable2 = responsable2;
            _Responsable3 = responsable3;
            _Fecha = fecha;
        }

        #endregion

        #region Encapsulamiento
    public string Accion { get => _Accion; set => _Accion = value; }
    public int IdMinuta { get => _IdMinuta; set => _IdMinuta = value; }
    public string Objetivo { get => _Objetivo; set => _Objetivo = value; }
    public string Lugar { get => _Lugar; set => _Lugar = value; }
    public string Asunto { get => _Asunto; set => _Asunto = value; }
    public string Participante { get => _Participante; set => _Participante = value; }
    public string Participante2 { get => _Participante2; set => _Participante2 = value; }
    public string Participante3 { get => _Participante3; set => _Participante3 = value; }
    public string Tarea { get => _Tarea; set => _Tarea = value; }
    public string Tarea2 { get => _Tarea2; set => _Tarea2 = value; }
    public string Tarea3 { get => _Tarea3; set => _Tarea3 = value; }
    public string Responsable { get => _Responsable; set => _Responsable = value; }
    public string Responsable2 { get => _Responsable2; set => _Responsable2 = value; }
    public string Responsable3 { get => _Responsable3; set => _Responsable3 = value; }
    public DateTime Fecha { get => _Fecha; set => _Fecha = value; }

        #endregion

    }

}

