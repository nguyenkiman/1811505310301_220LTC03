namespace ModelEF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("UserAccount")]
    public partial class UserAccount
    {
        public int Id { get; set; }

        [StringLength(50)]
        public string UserName { get; set; }

        public string Passwords { get; set; }

        public int? Status { get; set; }
    }
}
