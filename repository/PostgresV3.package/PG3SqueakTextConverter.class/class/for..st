as yet unclassified
for: encodingName

	^self new
		textConverter: (TextConverter newForEncoding: encodingName);
		yourself