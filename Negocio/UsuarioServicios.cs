﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Datos;
using Entidades;
using System.Data;

namespace Negocio
{
   
    public class UsuarioServicios
    {
        UsuarioDatos ud = new UsuarioDatos();
        //Metodos
        public void CrearNuevoUsuario(Usuario usuario)
        {
            ud.CrearNuevoUsuario(usuario);
        }
    }
}
