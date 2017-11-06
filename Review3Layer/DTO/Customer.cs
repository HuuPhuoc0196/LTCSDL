using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DTO
{
    public class Customer
    {
        public string id { get; set; }
        public string pass { get; set; }
        public string name { get; set; }
        public string address { get; set; }
        public string email { get; set; }
        public string phone { get; set; }
        public string status { get; set; }
        public int accumulation { get; set; }

        public Customer(string id, string pass, string name, string address, string email, string phone, string status, int accumulation)
        {
            this.id = id;
            this.pass = pass;
            this.name = name;
            this.address = address;
            this.email = email;
            this.phone = phone;
            this.status = status;
            this.accumulation = accumulation;
        }

    }
}
