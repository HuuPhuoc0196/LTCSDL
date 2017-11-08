using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;

namespace DTO
{
    public class Department
    {
        [Key, Required]
        public int ID { get; set; }

        [StringLength(50)]
        public string Name { get; set; }

        public virtual List<Employee> Employees { get; set; }
    }
}
