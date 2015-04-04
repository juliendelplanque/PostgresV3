as yet unclassified
readFrom: stream

	processId := stream nextInt32.
	conditionName := stream nextString.
	payload := stream nextString