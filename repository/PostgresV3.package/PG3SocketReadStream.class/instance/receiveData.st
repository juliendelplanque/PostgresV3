as yet unclassified
receiveData

	socket waitForData.
	offset := offset + readLimit.
	readLimit := socket receiveSomeDataInto: buffer startingAt: 1.
	position := 0