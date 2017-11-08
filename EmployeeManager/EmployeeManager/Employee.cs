using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace EmployeeManager
{
    public class Employee
    {
        [Key, Required]
        public int ID { get; set; }

        [StringLength(50)]
        public string LastName { get; set; }

        [StringLength(30)]
        public string FistName { get; set; }

        public int DepID { get; set; }
        
        public virtual Department Department { get; set; }
    }
}
