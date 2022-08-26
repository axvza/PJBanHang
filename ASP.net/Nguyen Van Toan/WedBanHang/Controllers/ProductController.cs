using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;

namespace WedBanHang.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();
        public ActionResult Detail(int Id)
        {
            var objProduct = objWedsidebanhangEntities.Products.Where(n => n.Id == Id).FirstOrDefault();
            return View(objProduct);
        }
    }
}