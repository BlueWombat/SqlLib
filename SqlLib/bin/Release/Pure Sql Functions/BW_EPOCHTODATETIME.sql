SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =======================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 27-07-2014
-- Description:	Converts a UNIX EPOCH object to datetime
-- =======================================================
ALTER FUNCTION [dbo].[BW_EPOCHTODATETIME]
(
	@epochToConvert bigint
)
RETURNS datetime
AS
BEGIN
	return DATEADD(second, @epochToConvert, '1970-01-01 00:00:00')
END