using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Datos;

namespace Negocio
{
    public class CarpetaServicios
    {
        CarpetaDatos cd = new CarpetaDatos();

        public void CrearNuevaCarpeta(int id, string nombre, string descripcion)
        {
            cd.CrearNuevaCarpeta(id,nombre,descripcion);
        }
        
        public List<Carpeta> ListarCarpetas(int idUsuario)
        {
            return cd.ListarCarpetas(idUsuario);
        }

        public List<Tarea> ListarTareas(int idUsuario, int idCarpeta)
        {
            return cd.ListarTarea(idUsuario, idCarpeta);
        }
    }
}
