using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using ModelEF;
using ModelEF.DAO;

namespace TestUngDung.Areas.Admin.Controllers
{
    public class ProductsController : Controller
    {
        private NguyenKimAnContext db = new NguyenKimAnContext();

        // GET: Admin/Products
        public ActionResult Index(string searchString, int page = 1, int pageSize = 5)
        {
            
            var product = new ProductDAO();
            var model = product.ListWhereAll(searchString, page, pageSize);
            ViewBag.SearchString = searchString;
            return View(model);

        }

        // GET: Admin/Products/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            return View(product);
        }

        // GET: Admin/Products/Create
        public ActionResult Create()
        {
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name");
            return View();
        }

        // POST: Admin/Products/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id,Name,UnitCost,Quantity,Image,Description,Status,CategoryId")] Product product, HttpPostedFileBase image)
        {
            if (ModelState.IsValid)
            {
                if (image != null && image.ContentLength > 0)
                {
                    string filename = Path.GetFileName(image.FileName);
                    string path = Server.MapPath("~/images/" + filename);
                    product.Image = "images/" + filename;
                    image.SaveAs(path);
                    product.Status = Common.Contraint.STATUS_ACTIVE;
                }
                db.Products.Add(product);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", product.CategoryId);
            return View(product);
        }

        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", product.CategoryId);
            return View(product);
        }

        // POST: Admin/Products/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id,Name,UnitCost,Quantity,Image,Description,Status,CategoryId")] Product product, HttpPostedFileBase ImageUpload, string Image)
        {
            if (ModelState.IsValid)
            {
                if (ImageUpload != null && ImageUpload.ContentLength > 0)
                {
                    string filename = Path.GetFileName(ImageUpload.FileName);
                    string path = Server.MapPath("~/images/" + filename);
                    product.Image = "images/" + filename;
                    ImageUpload.SaveAs(path);
                }
                else
                {
                    product.Image = Image;
                }
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CategoryId = new SelectList(db.Categories, "Id", "Name", product.CategoryId);
            return View(product);
        }

        // GET: Admin/Products/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Product product = db.Products.Find(id);
            if (product == null)
            {
                return HttpNotFound();
            }
            if (product.Status == Common.Contraint.STATUS_ACTIVE)
            {
                product.Status = Common.Contraint.STATUS_BLOCKED;
                db.Entry(product).State = EntityState.Modified;
            }
            else
            {
                db.Products.Remove(product);
            }
            db.SaveChanges();
            return RedirectToAction("Index");
        }
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
