using ModelEF.DAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using TestUngDung.Areas.Admin.Data;
using TestUngDung.Common;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class LoginController : Controller
    {
        // GET: Admin/Login
        public ActionResult Index(LoginModel user)
        {
            if (ModelState.IsValid)
            {
                var dao = new UserAccountDAO();
                var result = dao.Login(user.UserName, user.PassWord );
                if (result == 1)
                {
                    ModelState.AddModelError("", "Đăng nhập thành công");
                    Session.Add(Contraint.USER_SESSION, user);
                    return RedirectToAction("Index", "UserAccounts");
                }
                else
                {
                    ModelState.AddModelError("", "Đăng nhập không thành công");
                }
            }
            return View("Index");
        }
    }
}