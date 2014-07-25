using System.Data.SqlTypes;
using System.Text;
using Microsoft.SqlServer.Server;
using HMACLib = System.Security.Cryptography.HMAC;

namespace BlueWombat.SqlLib
{
    public class HMAC
    {
        [SqlFunction(Name = "BW_HMACHASHSTRING", IsDeterministic = false, SystemDataAccess = SystemDataAccessKind.None, DataAccess = DataAccessKind.None)]
        public static SqlString HashString(SqlString algo, SqlString salt, SqlString stringToHash)
        {
            var hmac = HMACLib.Create(algo.ToString());
            hmac.Key = Encoding.UTF8.GetBytes(salt.ToString());
            var buffer = hmac.ComputeHash(Encoding.UTF8.GetBytes(stringToHash.ToString()));
            string output = "";
            foreach (var b in buffer)
                output += b.ToString("x2");

            return new SqlString(output);
        }
    }
}