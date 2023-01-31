using System;
using System.Collections.Generic;

namespace Young_Artists_Customers.Models
{
    public partial class EvaluationForm
    {
        public int Id { get; set; }
        public int? CommodityId { get; set; }
        public int? NumberId { get; set; }
        public string? Narrative { get; set; }
        public string? EvaluationTime { get; set; }
        public bool? Isstate { get; set; }
    }
}
