﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CM.DAL.EntityModel
{
    using Shared.Entities;
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;

    public partial class EntityModelCS : DbContext
    {
        public EntityModelCS()
            : base("name=EntityModelCS")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public DbSet<ClientMeta> ClientMetas { get; set; }
        public DbSet<BusinessMeta> BusinessContactMetas { get; set; }
        public DbSet<LocationMeta> LocationMetas { get; set; }
        public DbSet<LocationTypeMeta> LocationTypeMetas { get; set; }
    }
}
