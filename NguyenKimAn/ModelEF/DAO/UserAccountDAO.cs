using PagedList;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ModelEF.DAO
{
    public class UserAccountDAO
    {
        private NguyenKimAnContext dbContext = new NguyenKimAnContext();
        public UserAccountDAO()
        {
        }
        public int Login(string user, string pass)
        {
            var result = dbContext.UserAccounts.Where(z => z.Status == 1).SingleOrDefault(x => x.UserName.Equals(user) && x.Passwords.Equals(pass));
            if (result == null)
            {
                return 0;
            }
            else
            {
                return 1;
            }
        }
        public IEnumerable<UserAccount> ListWhereAll(string keysearch, int page, int pageSize)
        {
            if (!string.IsNullOrEmpty(keysearch))
                return dbContext.UserAccounts.OrderByDescending(x => x.Status).Where(x => x.UserName.Contains(keysearch)).ToPagedList(page, pageSize);
            return dbContext.UserAccounts.OrderByDescending(x => x.Status).ToPagedList(page, pageSize);
        }
        
        
    }
}
