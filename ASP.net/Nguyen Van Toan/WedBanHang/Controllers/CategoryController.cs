using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;

namespace WedBanHang.Controllers
{
    public class CategoryController : Controller
    {
        // GET: Category
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();
        public ActionResult Index()
        {
            var lstCategory = objWedsidebanhangEntities.Categories.ToList() ;
            return View(lstCategory);
        }
        public ActionResult ProductCategory(int Id)
        {
            var listProduct = objWedsidebanhangEntities.Products.Where(n => n.CategoryId == Id).ToList() ;
            return View(listProduct);
        }
    }
}