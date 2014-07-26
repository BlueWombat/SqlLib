DROP FUNCTION BW_HMACHASHSTRING
go
-- =================================================================================================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 25-07-2014
-- Description:	Lets you calculate HMACs, supported algorithms are 'HMACMD5', 'HMACSHA1', 'HMACSHA256', 'HMACSHA384', 'HMACSHA512'
-- =================================================================================================================================
CREATE FUNCTION BW_HMACHASHSTRING
(
	@algo nvarchar(10),
	@salt nvarchar(max),
	@stringToHash nvarchar(max)
)
RETURNS nvarchar(max)
AS EXTERNAL NAME [BlueWombat.SqlLib].[BlueWombat.SqlLib.HMAC].HashString

go
DROP FUNCTION BW_REGEXISMATCH
go
-- =======================================================================================================================================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 25-07-2014
-- Description:	Lets you test a string with a regular expression, and conclude wether it matches the pattern. This is configured for case sensitive single line matching
-- =======================================================================================================================================================================
CREATE FUNCTION BW_REGEXISMATCH
(
	@expr nvarchar(max),
	@stringToMatch nvarchar(max)
)
RETURNS bit
AS EXTERNAL NAME [BlueWombat.SqlLib].[BlueWombat.SqlLib.Regex].IsMatch
go
DROP FUNCTION BW_REGEXREPLACE
go
-- =======================================================================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 26-07-2014
-- Description:	Lets you make replacements on the string you're matching your regular expression against
-- =======================================================================================================
CREATE FUNCTION BW_REGEXREPLACE
(
	@expr nvarchar(max),
	@stringToMatch nvarchar(max),
	@replacement nvarchar(max)
)
RETURNS nvarchar(max)
AS EXTERNAL NAME [BlueWombat.SqlLib].[BlueWombat.SqlLib.Regex].Replace
go
DROP FUNCTION BW_REGEXGETMATCHESANDGROUPS
go
-- ==================================================================================================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 25-07-2014
-- Description:	Retrieves all amtches and the groups of each match found when running the specified regex against the input string
-- ==================================================================================================================================
CREATE FUNCTION BW_REGEXGETMATCHESANDGROUPS
(
	@expr nvarchar(max),
	@stringToMatch nvarchar(max)
)
RETURNS table
(
	[Match] nvarchar(max),
	[Group] nvarchar(max)
)
AS EXTERNAL NAME [BlueWombat.SqlLib].[BlueWombat.SqlLib.Regex].GetMatchesAndGroups