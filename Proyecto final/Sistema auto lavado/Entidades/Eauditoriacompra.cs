﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Entidades
{
    public class Eauditoriacompra
    {
        public int Idcompra { get; set; }
        public EProveedor Proveedor { get; set; }
        public EUsuario Usuario { get; set; }
        public DateTime? FechaFactura { get; set; }
        public string Tipopago { get; set; }
        public decimal? Subtotal { get; set; }
        public decimal? Descuento { get; set; }
        public decimal? TotalCordobas { get; set; }
        public decimal? TotalDolares { get; set; }
        public string Estado { get; set; }
        public List<EdetalleCompra> listadetalle { get; set; }

        public string NombreAuditoria { get; set; }
        public string accion { get; set; }

        public DateTime? fechaCreada { get; set; }
        public DateTime? fechaModificado { get; set; }


        public Eauditoriacompra()
        {
            Usuario = new EUsuario();
            Proveedor = new EProveedor();
            listadetalle = new List<EdetalleCompra>();
        }
    }
}
