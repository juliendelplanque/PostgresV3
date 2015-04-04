simple-query-protocol
commandComplete: aPG3CommandCompleteMessage

	commandCompleteHandler ifNotNil: [
		commandCompleteHandler value: aPG3CommandCompleteMessage ]