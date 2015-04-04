parsing
parseIntegerVectorLength: length

	| writeStream i |
	writeStream := WriteStream on: (Array new: length).
	i := 1.
	[ i <= length ] whileTrue: [
		| negative number byte |
		(negative := (number := self next - 48) = -3) "$-"
			ifTrue: [ number := 0 ].
		i := i + 1.
		[ i > length or: [ i := i + 1. (byte := self next) = 32 ] ] whileFalse: [
			number := number * 10 + byte - 48 ].
		writeStream nextPut: (negative 
			ifTrue: [ number negated ]
			ifFalse: [ number ]) ].
	^writeStream contents