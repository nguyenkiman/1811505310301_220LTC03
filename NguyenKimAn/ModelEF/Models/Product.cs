namespace ModelEF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Product")]
    public partial class Product
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public double? UnitCost { get; set; }

        public int? Quantity { get; set; }

        public string Image { get; set; }

        public string Description { get; set; }

        public int? Status { get; set; }

        public int? CategoryId { get; set; }

        public virtual Category Category { get; set; }
    }
}
