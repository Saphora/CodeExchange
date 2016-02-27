using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CM.Interfaces
{
    public interface IRepository
    {
        IDataManager DataManager { get; set; }
        T ConvertTo<F,T>(F From, T To);
    }
}
