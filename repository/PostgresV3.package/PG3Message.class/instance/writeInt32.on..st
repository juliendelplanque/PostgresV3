as yet unclassified
writeInt32: anInteger on: aStream

	aStream
		nextPut: ((anInteger bitShift: -24) bitAnd: 255);
		nextPut: ((anInteger bitShift: -16) bitAnd: 255);
		nextPut: ((anInteger bitShift: -8) bitAnd: 255);
		nextPut: (anInteger bitAnd: 255)
		
		