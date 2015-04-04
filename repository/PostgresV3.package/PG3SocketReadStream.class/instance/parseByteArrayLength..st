parsing
parseByteArrayLength: length

	| writeStream i |
	writeStream := WriteStream on: (ByteArray new: length).
	i := 1.
	[ i <= length ] whileTrue: [
		| byte1 |
		(byte1 := self next) = 92 "$\ asciiValue " 
			ifTrue: [
				| byte2 |
				(byte2 := self next) = 92 "$\ asciiValue "
					ifTrue: [ 
						writeStream nextPut: 92.
						i := i + 2 ]
					ifFalse: [ 
						writeStream nextPut: (((byte2 - 48) * 8) + self next - 48) * 8 + self next - 48.
						i := i + 4 ] ]
			ifFalse: [
				writeStream nextPut: byte1.
				i := i + 1 ] ].
	writeStream position = length
		ifTrue: [ ^writeStream originalContents ]
		ifFalse: [ ^writeStream contents ]