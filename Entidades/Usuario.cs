using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;

namespace Entidades
{
    public class Usuario
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

        public Usuario(DataRow dr) 
        {
            if (dr != null)
            {
                if (dr["idUsuario"] != null)
                {
                    this.idUsuario = Convert.ToInt32(dr["idUsuario"]);
                }
                if (dr["Nombre"] != null)
                {
                    this.Nombre = dr["Nombre"].ToString();
                }
                if (dr["Apellido"] != null)
                {
                    this.Apellido = dr["Apellido"].ToString();
                }
                if (dr["Email"] != null)
                {
                    this.Email = dr["Email"].ToString();
                }
                if (dr["Contrasenia"] != null)
                {
                    this.Contrasenia = dr["Contrasenia"].ToString();
                }
                if (dr["Estado"] != null)
                {
                    this.Estado = Convert.ToInt32(dr["Estado"]);
                }
                if (dr["CodigoActivacion"] != null)
                {
                    this.CodigoActivacion = dr["CodigoActivacion"].ToString();
                }
                if (dr["FechaCreacion"] != null)
                {
                    this.FechaCreacion = Convert.ToDateTime(dr["FechaCreacion"]);
                }
                if (dr["FechaActivacion"] != null)
                {
                    this.FechaActivacion = Convert.ToDateTime(dr["FechaActivacion"]);
                }
            }
        }

        public Usuario()
        {
            // TODO: Complete member initialization
        }
    }
}
