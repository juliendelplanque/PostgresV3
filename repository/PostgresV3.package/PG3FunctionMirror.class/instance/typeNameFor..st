as yet unclassified
typeNameFor: aString

	^((#(
		('int4' 'integer')
		('_int4' 'integer[]')
		('int2' 'smallint')
		('_int2' 'smallint[]')
		('int8' 'bigint')
		('_int8' 'bigint[]')
		('_text' 'text[]')) 
			detect: [ :each | each first = aString ] 
			ifNone: nil) ifNil: [ ^aString ]) second