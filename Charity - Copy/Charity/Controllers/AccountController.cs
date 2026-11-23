using System;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using Charity.Models;
using Charity.Services;

namespace Charity.Controllers
{
    public class AccountController : Controller
    {
        private CharityDBEntities database = new CharityDBEntities();

        // GET: Account
        public ActionResult Index()
        {
            return View();
        }

        // GET: Account/Login
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        // POST: Account/Login
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Login(string Email, string Password)
        {
            if (string.IsNullOrWhiteSpace(Email) ||
                string.IsNullOrWhiteSpace(Password))
            {
                ViewBag.Error = "Vui lòng nhập email và mật khẩu.";
                return View();
            }

            Email = Email.Trim();
            var user = database.Users.FirstOrDefault(u => u.Email == Email);

            if (user == null || !PasswordHelper.Verify(Password, user.PasswordHash))
            {
                ViewBag.Error = "Email hoặc mật khẩu không đúng.";
                return View();
            }

            // Tài khoản cũ còn mật khẩu rõ: băm luôn
            if (!PasswordHelper.IsHashed(user.PasswordHash))
            {
                user.PasswordHash = PasswordHelper.Hash(Password);
                database.SaveChanges();
            }

            FormsAuthentication.SetAuthCookie(user.Email, false);

            Session["UserId"] = user.Id;
            Session["FullName"] = user.FullName;
            Session["Role"] = user.Role;

            if (user.Role == "Admin")
            {
                return RedirectToAction("Index", "Admin");
            }

            return RedirectToAction("Index", "Home");
        }

        // GET: Account/Register
        [HttpGet]
        public ActionResult Register()
        {
            return View();
        }

        // POST: Account/Register
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Register(
            string FullName,
            string Email,
            string Password,
            string ConfirmPassword,
            string PhoneNumber)
        {
            if (string.IsNullOrWhiteSpace(FullName) ||
                string.IsNullOrWhiteSpace(Email) ||
                string.IsNullOrWhiteSpace(Password))
            {
                ViewBag.Error = "Vui lòng nhập đầy đủ họ tên, email và mật khẩu.";
                return View();
            }

            if (Password.Length < 8)
            {
                ViewBag.Error = "Mật khẩu phải từ 8 ký tự trở lên.";
                return View();
            }

            if (Password != ConfirmPassword)
            {
                ViewBag.Error = "Mật khẩu xác nhận không khớp.";
                return View();
            }

            Email = Email.Trim();

            if (database.Users.Any(u => u.Email == Email))
            {
                ViewBag.Error = "Email này đã được đăng ký.";
                return View();
            }

            var user = new User
            {
                FullName = FullName.Trim(),
                Email = Email,
                PasswordHash = PasswordHelper.Hash(Password),
                PhoneNumber = PhoneNumber,
                Role = "User",
                CreatedAt = DateTime.Now
            };

            database.Users.Add(user);
            database.SaveChanges();

            TempData["Success"] = "Đăng ký thành công. Bạn hãy đăng nhập.";
            return RedirectToAction("Login");
        }

        // GET: Account/Logout
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();

            return RedirectToAction("Index", "Home");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                database.Dispose();
            }

            base.Dispose(disposing);
        }
    }
}