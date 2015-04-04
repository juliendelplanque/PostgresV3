as yet unclassified
state: aSymbol

	^self states at: aSymbol ifAbsent: [
		| newState |
		newState := self states at: aSymbol put: (
			self new
				name: aSymbol;
				yourself).
		newState
			on: PG3NoticeResponse
			connectionDo: #receiveNotice:
			goto: aSymbol;
			on: PG3ParameterStatus 
			connectionDo: #addParameterStatus:
			goto: aSymbol;
			on: PG3NotificationResponse  
			connectionDo:  #receiveNotification:
			goto: aSymbol;
			yourself ].