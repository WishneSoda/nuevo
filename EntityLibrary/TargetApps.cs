//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace EntityLibrary
{
    using System;
    using System.Collections.Generic;
    
    public partial class TargetApps
    {
        public int ID { get; set; }
        public string Name { get; set; }
        public string TargetUrl { get; set; }
        public Nullable<int> TimeInterval { get; set; }
        public string IntervalType { get; set; }
        public Nullable<int> UserLoginID { get; set; }
    
        public virtual UserLogin UserLogin { get; set; }
    }
}
