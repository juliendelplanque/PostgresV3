listen-notify-subprotocol
createListenerProcess

	listenerProcess ifNotNil: [ 
		^self ].
	listenerProcess := [ self listenerProcess ] newProcess.
	listenerProcess resume