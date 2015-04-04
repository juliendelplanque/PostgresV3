query execution
executeTransaction: aBlock

	(PG3CurrentConnection signalFor: self) ifNotNil: [ :connection |
		"We're already in a transaction"
		^aBlock cull: connection ].
	^self withConnectionDo: [ :connection |
		[
			| result |
			connection execute: 'begin'.
			result := [ aBlock cull: connection ]
				on: PG3CurrentConnection 
				do: [ :not | 
					not pool == self
						ifTrue: [ not resume: connection ]
						ifFalse: [ not pass ] ].
			connection isInTransaction ifTrue: [
				connection execute: 'commit' ].
			result ]
				ensure: [ 
					connection ifNotNil: [
						connection isIdle ifFalse: [
							connection execute: 'rollback' ] ] ] ]