as yet unclassified
printMethodPatternOn: stream

	| method |
	method := (schemaMirror methodForFunction: self) ifNil: [ 
		^self printSynthetizedMethodPatterOn: stream ].
	method selector isUnary ifTrue: [ 
		^stream nextPutAll: method selector ].
	method selector isInfix ifTrue: [ self error: 'Binary selectors not supported.' ].
	method selector keywords 
		with: (method methodNode tempNames first: method selector keywords size)
		do: [ :keyword :tempName | 
			stream 
				nextPutAll: keyword;
				space;
				nextPutAll: tempName;
				space ]