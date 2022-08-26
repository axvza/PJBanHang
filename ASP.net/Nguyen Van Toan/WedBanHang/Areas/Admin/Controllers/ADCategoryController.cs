using PagedList;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;

namespace WedBanHang.Areas.Admin.Controllers
{
    public class ADCategoryController : Controller
    {
        // GET: Admin/ADCategory
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();
      
        public ActionResult Index(string currentFilter, string SearchString, int? page)
        {
            var lstCategory = new List<Category>();
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
                lstCategory = objWedsidebanhangEntities.Categories.Where(n => n.Name.Contains(SearchString)).ToList();
            }
            else
            {
                lstCategory = objWedsidebanhangEntities.Categories.ToList();

            }
            ViewBag.CurrentFilter = SearchString;
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            lstCategory = lstCategory.OrderByDescending(n => n.Id).ToList();
            return View(lstCategory.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult Details(int Id)
        {
            var lstCategory = objWedsidebanhangEntities.Categories.Where(n => n.Id == Id).FirstOrDefault();
            return View(lstCategory);
        }
        [HttpGet]
        public ActionResult Create()
        {
            return View();
        }
        [ValidateInput(false)]
        [HttpPost]
        public ActionResult Create(Category lstCategory)
        {
            try
            {
                if (lstCategory.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(lstCategory.ImageUpload.FileName);
                    string extension = Path.GetExtension(lstCategory.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    lstCategory.Avatar = fileName;
                    lstCategory.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWedsidebanhangEntities.Categories.Add(lstCategory);
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
            var lstCategory = objWedsidebanhangEntities.Categories.Where(n => n.Id == id).FirstOrDefault();
            return View(lstCategory);
        }

        [HttpPost]
        public ActionResult Delete(Product objca)
        {
            try

            {
                var lstCategory = objWedsidebanhangEntities.Categories.Where(n => n.Id == objca.Id).FirstOrDefault();
                objWedsidebanhangEntities.Categories.Remove(lstCategory);
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
            var lstCategory = objWedsidebanhangEntities.Categories.Where(n => n.Id == id).FirstOrDefault();
            return View(lstCategory);
        }
        [HttpPost]
        public ActionResult Edit(int id, Category objCategory)
        {
            try
            {
                if (objCategory.ImageUpload != null)
                {
                    string fileName = Path.GetFileNameWithoutExtension(objCategory.ImageUpload.FileName);
                    string extension = Path.GetExtension(objCategory.ImageUpload.FileName);
                    fileName = fileName + "_" + long.Parse(DateTime.Now.ToString("yyyyMMddhhmmss")) + extension;
                    objCategory.Avatar = fileName;
                    objCategory.ImageUpload.SaveAs(Path.Combine(Server.MapPath("~/Content/images/"), fileName));
                }
                objWedsidebanhangEntities.Entry(objCategory).State = System.Data.Entity.EntityState.Modified;
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