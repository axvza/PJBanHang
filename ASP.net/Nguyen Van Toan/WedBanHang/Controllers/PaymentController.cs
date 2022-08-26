using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WedBanHang.Context;
using WedBanHang.Models;

namespace WedBanHang.Controllers
{
    
    public class PaymentController : Controller
    {
        WedsidebanhangEntities objWedsidebanhangEntities = new WedsidebanhangEntities();
        // GET: Payment
        public ActionResult Index()
        {
            if (Session["idUser"] == null)
            {
                return RedirectToAction("Login", "Home");
            }
            else
            {
                var lstCart = (List<CartModel>)Session["cart"];
                Order objorder = new Order();
                objorder.Name = "DonHang" + DateTime.Now.ToString("yyyyMMddHHmmss");
                objorder.UserId = int.Parse(Session["idUser"].ToString());
                
                objorder.CreatedOnUtc = DateTime.Now;
                objorder.Status = 1;
                objWedsidebanhangEntities.Orders.Add(objorder);

                objWedsidebanhangEntities.SaveChanges();
                int intOrderId = objorder.Id;
                List<OrderDetail> lstorderDetails = new List<OrderDetail>();
                foreach(var item in lstCart)
                {
                    OrderDetail obj = new OrderDetail();
                    obj.Quantity = item.Quantity;
                    obj.OrderId = intOrderId;
                    obj.ProductId = item.product.Id;
                    lstorderDetails.Add(obj);
                }
                objWedsidebanhangEntities.OrderDetail.AddRange(lstorderDetails);
                objWedsidebanhangEntities.SaveChanges();
            }
            return View();
        }
    }
}