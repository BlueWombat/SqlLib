-- ===============================================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 25-07-2014
-- Description:	A nice little helper method to calculate age based on birth date
-- ===============================================================================
CREATE FUNCTION [dbo].[BW_CALCAGE]
(
	@birthDate datetime
)
RETURNS int
AS
BEGIN
	declare
		@today datetime = GETDATE()
	declare 
		@yearsOld int = DATEDIFF(year, @birthDate, @today)

	select
		@yearsOld = case
						when @today >= DATETIMEFROMPARTS(YEAR(@today), MONTH(@birthDate), DAY(@birthDate), 0, 0, 0, 0) then
							@yearsOld
						else
							@yearsOld - 1
						end
	return
		case
			when @yearsOld < 0 then
				0
			else
				@yearsOld
			end
END