//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace KT0720Trong_63135901.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class SinhVien
    {
        public string MaSV { get; set; }
        public string HoSV { get; set; }
        public string TenSV { get; set; }
        public Nullable<bool> GioiTinh { get; set; }
        public Nullable<System.DateTime> NgaySinh { get; set; }
        public string AnhSV { get; set; }
        public string DiaChi { get; set; }
        public string MaLop { get; set; }
    
        public virtual Lop Lop { get; set; }
    }
}