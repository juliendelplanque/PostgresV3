connection creation
newConnection
	"Create and return a new connection with these arguments."

	^PG3Connection new
		arguments: self;
		yourself