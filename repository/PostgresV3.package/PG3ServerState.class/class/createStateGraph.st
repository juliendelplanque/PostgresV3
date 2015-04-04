as yet unclassified
createStateGraph

	| states |
	states := IdentityDictionary new.
	[ self stateGraphDescription ]
		on: Notification
		do: [ :notification | notification resume: states ].
	^states