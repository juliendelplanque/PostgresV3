as yet unclassified
cancelRequest

	| message |
	message := PG3CancelRequest for: self.
	PG3Connection new
		arguments: arguments;
		ensureConnection;
		sendMessage: message