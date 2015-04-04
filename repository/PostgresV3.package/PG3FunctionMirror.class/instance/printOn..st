as yet unclassified
printOn: stream

	stream 
		nextPutAll: 'create or replace function ';
		nextPutAll: schema;
		nextPut: $.;
		nextPutAll: name;
		nextPut: $(.
	arguments doWithIndex: [ :each :index | 
		index even
			ifTrue: [ stream nextPutAll: each ]  
			ifFalse: [
				index = 1 ifFalse: [ stream nextPutAll: ', ' ].
				stream 
					nextPutAll: each;
					space ] ].
	stream 
		nextPut: $);
		nextPutAll: ' returns ';
		nextPutAll: returnType;
		nextPutAll: ' as $$';
		nextPutAll: body;
		nextPutAll: '$$ ';
		nextPutAll: 'language ';
		print: language;
		space;
		nextPutAll: volatility asUppercase;
		nextPut: $;