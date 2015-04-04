as yet unclassified
initializeAuthenticationDispatcher
	" self initializeAuthenticationDispatcher "

	AuthenticationDispatcher := Array new: 10.
	self allSubclassesDo: [ :subclass |
		AuthenticationDispatcher at: subclass subType + 1 put: subclass ]