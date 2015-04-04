running
setUp

	stream := PG3SocketReadStream new
		textConverter: PG3NullTextConverter new;
		yourself