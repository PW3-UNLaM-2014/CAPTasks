using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using Datos;
using Entidades;

namespace Negocio
{

    public class TareaServicios
    {
        TareaDatos td = new TareaDatos();

        //METODOS:
        public void CrearNuevaTarea(Tarea tarea)
        {
            td.CrearNuevaTarea(tarea);
        }

        public void CompletoLaTarea(int idTarea)
        {
            td.CompletoLaTarea(idTarea);
        }

    }
}
