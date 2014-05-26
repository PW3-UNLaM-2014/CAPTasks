using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Entidades
{
    public class Carpeta
    {
        public int IdUsuario { set; get; }
        public int IdCarpeta { get; set; }
        public string Nombre { set; get; }
        public string Descripcion { set; get; }

        public Carpeta(DataRow dr)
        {
            if (dr != null)
            {
                if (dr["IdUsuario"] != null)
                {
                    this.IdUsuario = Convert.ToInt32(dr["IdUsuario"]);
                }
                if (dr["IdCarpeta"] != null)
                {
                    this.IdUsuario = Convert.ToInt32(dr["IdCarpeta"]);
                }
                if (dr["Nombre"] != null)
                {
                    this.Nombre = dr["Nombre"].ToString();
                }
                if (dr["Descripcion"] != null)
                {
                    this.Descripcion = dr["Descripcion"].ToString();
                }
            }
        }

        public Carpeta()
        {

        }
    }
}
