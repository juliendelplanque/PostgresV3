as yet unclassified
initializeDispatcherArray
	" self initializeDispatcherArray "

	DispatcherArray := Array new: 256.
	self allSubclassesDo: [ :subclass |
		subclass basicNew in: [ :instance |
			((subclass methodDictionary includesKey: #typeByte) and: [ 
				instance isResponse ]) ifTrue: [
					DispatcherArray at: instance typeByte put: subclass ] ] ]