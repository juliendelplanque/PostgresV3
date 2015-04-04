as yet unclassified
update

	| rows newAll newObjectById |	
	nextUpdate := Time totalSeconds + self updateSeconds.
	rows := self db perform: self getAllSelector.
	newObjectById := Dictionary new: rows size.
	newAll := rows collect: [ :each |
		newObjectById at: each id put: (self from: each) ].
	objectById := newObjectById.
	all := newAll