using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace mvcDangNhap.Models
{
    [Serializable]
    public class CartItem
    {
        
            public product product { set; get; }
            public int Quantity { set; get; }
      
    }
}