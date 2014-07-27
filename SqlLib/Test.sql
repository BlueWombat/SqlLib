select
	dbo.BW_CALCAGE('1989-08-22') as [CalcAge Test],
	dbo.BW_HMACHASHSTRING('hmacsha512', 'testKey', 'testVal') as [HMAC HashString Test],
	dbo.BW_REGEXISMATCH('^This', 'This should match just fine :-)') as [Regex IsMatch Test],
	dbo.BW_REGEXREPLACE('(?<attr>src|href)="(?<value>[^"]*)"', '<p>Test<img src="/folder/image.png" /></p>', '${attr}="http://test.com${value}"') as [Regex Replace Test]

select * from dbo.BW_STRINGSPLIT('value 1|split|value 2|split|value 3|split|value 4', '|split|')

select * from dbo.BW_REGEXGETMATCHESANDGROUPS('need to (capture)', 'I have this text where I need to capture something. but the word caputre is mentioned twice!')

declare
	@date datetime = '2013-01-24 08:36:50.667',
	@epoch bigint = 0
	
select @epoch = dbo.BW_DATETIMETOEPOCH(@date)

select @epoch

select dbo.BW_EPOCHTODATETIME(@epoch)