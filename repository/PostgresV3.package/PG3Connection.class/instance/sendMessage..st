as yet unclassified
sendMessage: aPG3Message

	| stream bytes |
	bytes := ByteArray new: 8192.
	stream := WriteStream on: bytes from: 1 to: bytes size.
	aPG3Message writeOn: stream.
	socket sendData: stream originalContents count: stream position