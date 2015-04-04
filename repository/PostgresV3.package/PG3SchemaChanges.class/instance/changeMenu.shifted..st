as yet unclassified
changeMenu: aMenu shifted: isShifted

	selected ifNil: [ ^nil ].
	selected isLocalOnly ifFalse: [
		aMenu add: 'download' action: #downloadSelected ].
	selected isRemoteOnly ifFalse: [
		aMenu add: 'upload' action: #uploadSelected ].
	selected isLocalOnly ifFalse: [
		aMenu add: 'delete remote' action: #deleteSelectedFromDatabase ].
	^aMenu