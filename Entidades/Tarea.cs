using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

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

        public Tarea()
        {
        }

        public Tarea(DataRow dr)
        {
            if (dr != null)
            {
                if (dr["IdCarpeta"] != null)
                {
                    this.IdCarpeta = Convert.ToInt32(dr["IdCarpeta"]);
                }
                if (dr["IdUsuario"] != null)
                {
                    this.IdUsuario = Convert.ToInt32(dr["IdUsuario"]);
                }
                if (dr["Nombre"] != null)
                {
                    this.Nombre = dr["Nombre"].ToString();
                }
                if (dr["Descripcion"] != null)
                {
                    this.Descripcion = dr["Descripcion"].ToString();
                }
                if (dr["FechaFin"] != null)
                {
                    this.Fecha = Convert.ToDateTime(dr["FechaFin"]);
                }
                if (dr["Prioridad"] != null)
                {
                    this.Prioridad = Convert.ToInt32(dr["Prioridad"]);
                }
                if (dr["Estado"] != null)
                {
                    this.Estado = Convert.ToInt32(dr["Estado"]);
                }
            }
        }
    }
}
