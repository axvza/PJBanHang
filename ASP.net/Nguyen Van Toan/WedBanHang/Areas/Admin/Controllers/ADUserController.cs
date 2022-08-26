using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;

namespace WedBanHang.Areas.Admin.Controllers
{
    public class ADUserController : Controller
    {
        // GET: Admin/ADUser
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();

        public ActionResult Index()
        {
            var lstUser = objWedsidebanhangEntities.Users.ToList();
            return View(lstUser);
        }
        public ActionResult Details(int Id)
        {
            var lstUser = objWedsidebanhangEntities.Users.Where(n => n.Id == Id).FirstOrDefault();
            return View(lstUser);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(User lstUser)
        {
           
                objWedsidebanhangEntities.Users.Add(lstUser);
                objWedsidebanhangEntities.SaveChanges();
                return RedirectToAction("Index");
          
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var lstUser = objWedsidebanhangEntities.Users.Where(n => n.Id == id).FirstOrDefault();
            return View(lstUser);
        }

        [HttpPost]
        public ActionResult Delete(User objus)
        {
            try

            {
                var lstUser = objWedsidebanhangEntities.Users.Where(n => n.Id == objus.Id).FirstOrDefault();
                objWedsidebanhangEntities.Users.Remove(lstUser);
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
            var lstUser = objWedsidebanhangEntities.Users.Where(n => n.Id == id).FirstOrDefault();
            return View(lstUser);
        }
        [HttpPost]
        public ActionResult Edit(int id, User objUser)
        {
            
                objWedsidebanhangEntities.Entry(objUser).State = System.Data.Entity.EntityState.Modified;
                objWedsidebanhangEntities.SaveChanges();
                return RedirectToAction("Index");
            
        }
    }
}