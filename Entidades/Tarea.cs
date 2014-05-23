using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Tarea
    {
        public int IdCarpeta { set; get; }
        public int IdUsuario { set; get; }
        public string Nombre { set; get; }
        public string Descripcion { set; get; }
        public DateTime Fecha { set; get; }
        public int Prioridad { set; get; }
        public int Estado { set; get; }
    }
}
