using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;

namespace WedBanHang.Areas.Admin.Controllers
{
    public class ADOrderController : Controller
    {
        // GET: Admin/ADCart
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();

        public ActionResult Index()
        {
            var lstOrder = objWedsidebanhangEntities.Orders.ToList();
            return View(lstOrder);
        }
        public ActionResult Details(int Id)
        {
            var lstOrder = objWedsidebanhangEntities.Orders.Where(n => n.Id == Id).FirstOrDefault();
            return View(lstOrder);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Order lstOrder)
        {

            objWedsidebanhangEntities.Orders.Add(lstOrder);
            objWedsidebanhangEntities.SaveChanges();
            return RedirectToAction("Index");

        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var lstOrder = objWedsidebanhangEntities.Orders.Where(n => n.Id == id).FirstOrDefault();
            return View(lstOrder);
        }

        [HttpPost]
        public ActionResult Delete(Order objod)
        {
            try

            {
                var lstOrder = objWedsidebanhangEntities.Orders.Where(n => n.Id == objod.Id).FirstOrDefault();
                objWedsidebanhangEntities.Orders.Remove(lstOrder);
                objWedsidebanhangEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }

        }
        [HttpGet]
        public ActionResult Edit(int id)
        {
            var lstOrder = objWedsidebanhangEntities.Orders.Where(n => n.Id == id).FirstOrDefault();
            return View(lstOrder);
        }
        [HttpPost]
        public ActionResult Edit(int id, Order lstOrder)
        {

            objWedsidebanhangEntities.Entry(lstOrder).State = System.Data.Entity.EntityState.Modified;
            objWedsidebanhangEntities.SaveChanges();
            return RedirectToAction("Index");

        }
    }
}