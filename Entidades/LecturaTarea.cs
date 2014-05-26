using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Entidades
{
    public class LecturaTarea
    {
        public int IdTarea { set; get; }
        public int IdUsuario { set; get; }
        public string Carpeta { set; get; }
        public string Tarea { set; get; }
        public string Descripcion { set; get; }
        public DateTime Fecha { set; get; }
        public string Prioridad { set; get; }
        public string Estado { set; get; }

        public LecturaTarea()
        {
        }

        public LecturaTarea(DataRow dr)
        {
            if (dr != null)
            {
                if (dr["IdTarea"] != null)
                {
                    this.IdTarea = Convert.ToInt32(dr["IdTarea"]);
                }
                if (dr["IdUsuario"] != null)
                {
                    this.IdUsuario = Convert.ToInt32(dr["IdUsuario"]);
                }
                if (dr["NombreCarpeta"] != null)
                {
                    this.Carpeta = dr["NombreCarpeta"].ToString();
                }
                if (dr["NombreTarea"] != null)
                {
                    this.Tarea = dr["NombreTarea"].ToString();
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
                    this.Prioridad = dr["Prioridad"].ToString();
                }
                if (dr["Estado"] != null)
                {
                    this.Estado = dr["Estado"].ToString();
                }
            }
        }

    }
}
