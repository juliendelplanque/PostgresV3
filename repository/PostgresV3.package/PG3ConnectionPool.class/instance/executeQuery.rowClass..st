query execution
executeQuery: queryString rowClass: aClass

	| currentConnection |
	currentConnection := PG3CurrentConnection signalFor: self.
	^currentConnection 
		ifNil: [ 
			self withConnectionDo: [ :conn |
				conn execute: queryString rowClass: aClass ] ]
		ifNotNil: [
			currentConnection execute: queryString rowClass: aClass ]