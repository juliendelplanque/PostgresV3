as yet unclassified
on: aPG3MessageClass do: aBlock goto: aSymbol

	transitions at: aPG3MessageClass put: { (self state: aSymbol). aBlock }