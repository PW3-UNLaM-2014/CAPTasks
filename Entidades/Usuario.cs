using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
  public  class Usuario
    {
        public int idUsuario { set; get; }
        public string Nombre { set; get; }
        public string Apellido { set; get; }
        public string Email { set; get; }
        public string Contrasenia { set; get; }
        public int Estado { set; get; }
        public string CodigoActivacion { set; get; }
        public DateTime FechaCreacion { set; get; }
        public DateTime FechaActivacion { set; get; }
    }
}
