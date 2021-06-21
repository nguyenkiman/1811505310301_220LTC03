using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class ProductDAO
    {
        private NguyenKimAnContext dbContext;
        public ProductDAO()
        {
            dbContext = new NguyenKimAnContext();
        }
        public IPagedList<Product> ListWhereAll(string keysearch, int page, int pageSize)
        {
           
            if (!string.IsNullOrEmpty(keysearch))
                return dbContext.Products.OrderBy(x => x.Quantity).ThenByDescending(y => y.UnitCost).Where(x => x.Name.Contains(keysearch)).ToPagedList(page, pageSize);
            return dbContext.Products.OrderBy(x => x.Quantity).ThenByDescending(y => y.UnitCost).ToPagedList(page, pageSize);
        }
        public bool Delete(int id)
        {
            try
            {
                var product = dbContext.UserAccounts.Find(id);
                dbContext.UserAccounts.Remove(product);
                dbContext.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }

        }
    }
}
