printing
printOn: aStream

	super printOn: aStream.
	aStream nextPut: $(.
	columnNameDictionary 
		ifNil: [
			1 to: self size do: [ :index |
				index = 1 ifFalse: [ aStream nextPutAll: ', ' ].
				aStream print: (self at: index) ] ]
		ifNotNil: [
			(columnNameDictionary associations
				sort: [ :a :b | a value < b value ])
				do: [ :assoc |
					aStream 
						nextPutAll: assoc key;
						nextPutAll: ': ';
						print: (self at: assoc value) ]
				separatedBy: [ aStream nextPutAll: ', ' ] ].
	aStream nextPut: $)