using Charity.Models;
using Charity.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using System.Data.Entity;

namespace Charity.Controllers
{
    public class CampaignController : Controller
    {
        private CharityDBEntities db = new CharityDBEntities();

        // /Campaign?keyword=lũ&status=ongoing
        // /Campaign?keyword=lũ&status=ongoing&page=2
        public ActionResult Index(string keyword, string status, int page = 1)
        {
            var service = new CampaignService(db);
            var list = service.Search(keyword, status);

            ViewBag.Keyword = keyword;
            ViewBag.Status = status;

            if (page < 1) page = 1;

            // 8 chiến dịch mỗi trang (2 hàng x 4 thẻ)
            return View(list.OrderBy(c => c.Id).ToPagedList(page, 8));
        }

        public ActionResult Details(int id)
        {
            var service = new CampaignService(db);
            var campaign = service.GetById(id);
            if (campaign == null) return HttpNotFound();
            ViewBag.Donors = db.Donations
    .Include(d => d.User)
    .Where(d => d.CampaignId == id && d.Status == 1)
    .OrderByDescending(d => d.DonatedAt)
    .Take(10)
    .ToList();
            return View(campaign);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing) db.Dispose();
            base.Dispose(disposing);
        }
    }
}