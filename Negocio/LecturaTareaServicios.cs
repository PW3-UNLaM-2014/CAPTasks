using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Entidades;
using Datos;

namespace Negocio
{
    public class LecturaTareaServicios
    {
        LecturaTareaDatos ltd = new LecturaTareaDatos();

        public List<LecturaTarea> ListarMisTareas(int idUsuario)
        {
            return ltd.ListaDeMisTareas(idUsuario);
        }

        public List<LecturaTarea> ListarMisTareasPorCarpeta(int idCarpeta)
        {
            return ltd.ListarMisTareasPorCarpeta(idCarpeta);
        }

        public List<LecturaTarea> ListarTodasMisTareas(int idUsuario)
        {
            return ltd.ListaDeTodasMisTareas(idUsuario);
        }

    }
}
