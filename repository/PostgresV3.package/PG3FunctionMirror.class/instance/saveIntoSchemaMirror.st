as yet unclassified
saveIntoSchemaMirror

	schemaMirror
		compile: (
			String streamContents: [ :stream |
				self printMethodPatternOn: stream.
				stream cr; cr; tab.
				self
					printPragmaOn: stream;
					printBodyOn: stream ])
		classified: 'functions'