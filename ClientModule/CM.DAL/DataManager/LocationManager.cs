//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CM.DAL.DataManager
{
    using System;
    using System.Collections.Generic;
    using System.Data;
    using System.Data.Entity;
    using System.Linq;
    using CM.Interfaces;
    using CM.Shared.Entities;
    using CM.DAL.EntityModel;
    public partial class Location : LocationMetaManager : IDataManager
    {
        private FCDB DB;
              
        public LocationManager()
        {
            DB = new FCDB();
        }
    
        /// <summary>
        /// Adds an Location object to the DbSet of Locations
        /// </summary>
        /// <typeparam name="Location">The Location to be added.</param>
        protected virtual void _Add(Location obj) {
    
                DB.Locations.Add(obj); 
                DB.SaveChanges();
            
        }
    
        /// <summary>
        /// Updates an Location object to the DbSet of Locations
        /// </summary>
        /// <typeparam name="Location">The Location to be updated.</param>
        protected virtual void _Update(Location obj) {
    
                DB.Entry<Location>(obj).State = EntityState.Modified;
                DB.SaveChanges();
            
        }
        
        /// <summary>
        /// Deletes an Location object to the DbSet of Locations
        /// </summary>
        /// <typeparam name="Location">The Location to be deleted.</param>
        protected virtual void _Delete(Location obj) {
    
                DB.Entry<Location>(obj).State = EntityState.Deleted;
                DB.SaveChanges();
            
        }
        
        /// <summary>
        /// Get an list of Locations
        /// </summary>
        /// <returns>List of Locations</returns>
        protected virtual IEnumerable<Location> _GetList() {
            return DB.Locations.Select(s=>s);
        }
    
        /// <summary>
        /// Detaches an Location object from the object state manager.
        /// </summary>
        /// <typeparam name="Location">The Location to be detached.</param>
        public virtual void Detach(Object obj) 
    	{
            DB.Entry<Location>((Location)obj).State = EntityState.Detached;
            DB.SaveChanges();   
        }
        
        /// <summary>
        /// Adds an Location object to the DbSet of Locations
        /// </summary>
        /// <typeparam name="Location">The Location to be added.</param>
        public virtual void Add(Object obj) 
    	{
            _Add((Location)obj);
        }
    
        /// <summary>
        /// Updates an Location object to the DbSet of Locations
        /// </summary>
        /// <typeparam name="Location">The Location to be updated.</param>
        public virtual void Update(Object obj) 
    	{
            _Update((Location)obj);
        }
        
        /// <summary>
        /// Deletes an Location object to the DbSet of Locations
        /// </summary>
        /// <typeparam name="Location">The Location to be deleted.</param>
        public virtual void Delete(Object obj) 
    	{
            _Delete((Location)obj);
        }
        
        /// <summary>
        /// Get an list of Locations
        /// </summary>
        /// <returns>List of Locations</returns>
        public virtual IEnumerable<Location> GetList() 
    	{
            return _GetList();
        }
        
    
    }
}
