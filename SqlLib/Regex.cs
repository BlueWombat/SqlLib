using System.Collections;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Text.RegularExpressions;
using Microsoft.SqlServer.Server;
using RegexLib = System.Text.RegularExpressions.Regex;

namespace BlueWombat.SqlLib
{
    public class Regex
    {
        [SqlFunction(Name = "BW_REGEXISMATCH", IsDeterministic = true, SystemDataAccess = SystemDataAccessKind.None, DataAccess = DataAccessKind.None)]
        public static SqlBoolean IsMatch(SqlString expr, SqlString valueToMatch)
        {
            var r = new RegexLib(expr.ToString(), RegexOptions.Singleline);
            return r.IsMatch(valueToMatch.ToString());
        }

        [SqlFunction(Name = "BW_REGEXGETMATCHESANDGROUPS", TableDefinition = "Match nvarchar(max), Group nvarchar(max)", FillRowMethodName = "GetMatchesAndGroups_FillRow",
            IsDeterministic = false, SystemDataAccess = SystemDataAccessKind.None, DataAccess = DataAccessKind.None)]
        public static IEnumerable GetMatchesAndGroups(SqlString expr, SqlString valueToMatch)
        {
            var r = new RegexLib(expr.ToString(), RegexOptions.Singleline);
            return r.Matches(valueToMatch.ToString()).Cast<Match>().SelectMany(m => m.Groups.Cast<Group>().Select(g => new[]
            {
                m.Value,
                g.Value
            }));
        }

        private static void GetMatchesAndGroups_FillRow(object obj, out SqlString match, out SqlString group)
        {
            //var m = obj as dynamic;
            //match = m.Match;
            //group = m.Group;
            var m = obj as string[];
            match = m[0];
            group = m[1];
            //match = null;
            //group = null;
        }
    }
}
