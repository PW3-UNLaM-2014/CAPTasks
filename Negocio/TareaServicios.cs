using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;
using Entidades;
using System.Data;

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


    }
}
