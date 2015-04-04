startup-protocol
md5HashMessage: aString

	^Smalltalk globals
		at: #MD5
		ifPresent: [ :md5 | (md5 hashMessage: aString) hex asLowercase ]
		ifAbsent: [ WebUtils md5Digest: aString ]