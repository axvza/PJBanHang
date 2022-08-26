using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using WedBanHang.Context;

namespace WedBanHang.Models
{
    public class HomeModel
    {
        public List<Product> ListProduct { get; set; }
        public List<Category> ListCategory { get; set; }
    }
}