accessing
newListenerConnection

	^PG3ListenerConnection new
		arguments: connectionArguments;
		startup;
		yourself	