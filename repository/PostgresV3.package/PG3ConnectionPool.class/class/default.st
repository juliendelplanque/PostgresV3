as yet unclassified
default

	^instance ifNil: [
		instance := self new
			connectionArguments: self defaultConnectionArguments;
			yourself ]