using PagedList;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;
using static WedBanHang.Common;

namespace WedBanHang.Areas.Admin.Controllers
{
    public class ADBrandController : Controller
    {
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();
        // GET: Admin/ADBrand
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstBrand = new List<Brand>();
            if (SearchString != null)
            {
                page = 1;
            }
            else
            {
                SearchString = currentFilter;
            }
            if (!string.IsNullOrEmpty(SearchString))
            {
                lstBrand = objWedsidebanhangEntities.Brands.Where(n => n.Name.Contains(SearchString)).ToList();
            }
            else
            {
                lstBrand = objWedsidebanhangEntities.Brands.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            lstBrand = lstBrand.OrderByDescending(n => n.Id).ToList();
            return View(lstBrand.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Details(int Id)
        {
            var lstBrand = objWedsidebanhangEntities.Brands.Where(n => n.Id == Id).FirstOrDefault();
            return View(lstBrand);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Brand lstBrand)
        {
            try
            {
                if (lstBrand.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(lstBrand.ImageUpload.FileName);
                    string extension = Path.GetExtension(lstBrand.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    lstBrand.Avatar = fileName;
                    lstBrand.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWedsidebanhangEntities.Brands.Add(lstBrand);
                objWedsidebanhangEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }
        [HttpGet]
        public ActionResult Delete(int id)
        {
            var objBrand = objWedsidebanhangEntities.Brands.Where(n => n.Id == id).FirstOrDefault();
            return View(objBrand);
        }

        [HttpPost]
        public ActionResult Delete(Product objBra)
        {
            try

            {
                var objBrand = objWedsidebanhangEntities.Brands.Where(n => n.Id == objBra.Id).FirstOrDefault();
                objWedsidebanhangEntities.Brands.Remove(objBrand);
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
            var objBrand = objWedsidebanhangEntities.Brands.Where(n => n.Id == id).FirstOrDefault();
            return View(objBrand);
        }
        [HttpPost]
        public ActionResult Edit(int id, Brand objBrand)
        {
            try
            {
                if (objBrand.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objBrand.ImageUpload.FileName);
                    string extension = Path.GetExtension(objBrand.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objBrand.Avatar = fileName;
                    objBrand.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWedsidebanhangEntities.Entry(objBrand).State = System.Data.Entity.EntityState.Modified;
                objWedsidebanhangEntities.SaveChanges();
                return RedirectToAction("Index");
            }
            catch (Exception)
            {
                return RedirectToAction("Index");
            }
        }

    }
}