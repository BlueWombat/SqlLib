-- ======================================================================================
-- Author:		BlueWombat (http://bluewombat.com)
-- Create date: 25-07-2014
-- Description:	Provides a simple split implementation and thereby pseudo array support
-- ======================================================================================
CREATE FUNCTION [dbo].[BW_STRINGSPLIT]
(	
	@stringToSplit varchar(max),
	@splitOn varchar(max)
)
RETURNS
@result table
(
	value varchar(max)
)
AS
BEGIN
	declare
		@splitOnLen int = len(@splitOn),
		@remainingString varchar(max) = @stringToSplit

	while len(@remainingstring) > 0 and CHARINDEX(@splitOn, @remainingString) > 0
		begin
			declare
				@splitOnIndexStart int = CHARINDEX(@splitOn, @remainingString)
			declare
				@splitOnIndexEnd int = @splitOnIndexStart + @splitOnLen
			declare
				@remainingStringIndexEnd int = len(@remainingString) - @splitOnIndexEnd + 1
		
			insert into @result
			(
				value
			)
			select
				SUBSTRING(@remainingString, 1, @splitOnIndexStart - 1)

			select
				@remainingString = SUBSTRING(@remainingString, @splitOnIndexEnd, @remainingStringIndexEnd)
		end

	insert into @result
	(
		value
	)
	values
	(
		@remainingString
	)

	return
END