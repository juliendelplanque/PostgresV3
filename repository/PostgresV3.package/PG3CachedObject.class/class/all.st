as yet unclassified
all
	
	self shouldUpdate ifFalse: [ ^all ].
	self 
		update;
		flushCachedVariables;
		postUpdate.	
	^all