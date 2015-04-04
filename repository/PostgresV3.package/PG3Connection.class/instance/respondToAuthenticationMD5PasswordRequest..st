startup-protocol
respondToAuthenticationMD5PasswordRequest: message

	self sendMessage: (
		PG3PasswordMessage new
			password: 'md5', (
				self md5HashMessage: (
					(self md5HashMessage: (
						arguments password, arguments username)), 
					message salt asString));
			yourself)