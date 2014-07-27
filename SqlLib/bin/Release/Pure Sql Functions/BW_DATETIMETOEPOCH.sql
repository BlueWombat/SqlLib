SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 27-07-2014
-- Description:	Converts a datetime object to UNIX EPOCH
-- =======================================================
CREATE FUNCTION [dbo].[BW_DATETIMETOEPOCH]
(
	@dateToConvert datetime
)
RETURNS bigint
AS
BEGIN
	return DATEDIFF(second, '1970-01-01 00:00:00.0Z', @dateToConvert)
END