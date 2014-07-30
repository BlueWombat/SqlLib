using System;
using System.Data.SqlTypes;
using System.Linq;
using System.Text;
using Microsoft.SqlServer.Server;
using HMACLib = System.Security.Cryptography.HMAC;

namespace BlueWombat.SqlLib
{
    public class HMAC
    {
        [SqlFunction(Name = "BW_HMACHASHSTRING", IsDeterministic = false, SystemDataAccess = SystemDataAccessKind.None, DataAccess = DataAccessKind.None)]
        public static SqlString HashString(SqlString outputFormat, SqlString algo, SqlString salt, SqlString stringToHash)
        {
            var hmac = HMACLib.Create(algo.ToString());
            hmac.Key = Encoding.UTF8.GetBytes(salt.ToString());
            var buffer = hmac.ComputeHash(Encoding.UTF8.GetBytes(stringToHash.ToString()));
            string output;
            switch (outputFormat.ToString().ToLowerInvariant())
            {
                case "hex":
                    output = string.Join("", buffer.Select(b => b.ToString("x2")));
                    break;
                case "base64":
                    output = Convert.ToBase64String(buffer);
                    break;
                default:
                    throw new ArgumentException("Unknown output format");
            }

            return new SqlString(output);
        }
    }
}