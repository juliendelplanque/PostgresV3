as yet unclassified
nextInt32

	| byte result |
	(byte := self next) <= 16r7F "Is the result non-negative?"
		ifTrue: [
			byte <= 16r3F ifTrue: [ "Small"
				^byte * 256 + self next * 256 + self next * 256 + self next ].
			"Large"
			^(LargePositiveInteger basicNew: 4)
				digitAt: 1 put: byte;
				digitAt: 2 put: self next;
				digitAt: 3 put: self next;
				digitAt: 4 put: self next;
				yourself ].
	"Negative"
	byte >= 16rC0 ifTrue: [ "Small"
		^-1 - ((byte * 256 + self next * 256 + self next bitXor: 16rFFFFFF) * 256 + (self next bitXor: 255)) ].
	"Large"	
	result := LargeNegativeInteger basicNew: 4.
	result 
		digitAt: 4 put: (byte bitXor: 255);
		digitAt: 3 put: (self next bitXor: 255);
		digitAt: 2 put: (self next bitXor: 255).
	byte := self next bitXor: 255.
	byte > 0 ifTrue: [ "Save a LargeInteger creation and operation"
		result digitAt: 1 put: byte - 1.
		^result ].
	result digitAt: 1 put: byte.
	^result - 1