using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Customer
    {
        public string Id { get; set; }
        public string Pass { get; set; }

        public string Name { get; set; }

        public string Address { get; set; }

        public string Email { get; set; }

        public string Phone { get; set; }

        public string Status { get; set; }

        public int Cumulative  { get; set; }

        public Customer(string id, string pass, string name, string address, string email, string phone, string status, int cumulative)
        {
            this.Id = id;
            this.Pass = pass;
            this.Name = name;
            this.Address = address;
            this.Email = email;
            this.Phone = phone;
            this.Status = status;
            this.Cumulative = cumulative;
        }
    }
}
