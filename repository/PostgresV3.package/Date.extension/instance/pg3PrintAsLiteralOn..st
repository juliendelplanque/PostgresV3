*PostgresV3-Core
pg3PrintAsLiteralOn: stream

	self dayMonthYearDo: [ :day :month :year |
		stream 
			nextPut: $';
			print: year;
			nextPut: $-;
			print: month;
			nextPut: $-;
			print: day;
			nextPutAll: '''::date' ]