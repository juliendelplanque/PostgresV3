listen-notify-subprotocol
unlisten: aString

	(actions includesKey: aString) ifFalse: [
		^self ].
	self killListenerProcess.
	super execute: 'unlisten ', aString.
	actions removeKey: aString.
	actions ifNotEmpty: [ self createListenerProcess ]