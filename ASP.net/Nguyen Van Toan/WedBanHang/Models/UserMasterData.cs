﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WedBanHang.Models
{
    public partial class UserMasterData
    {
        public int Id { get; set; }
        public string Firstname { get; set; }
        public string LastName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public Nullable<bool> IsAdmin { get; set; }
    }
}