as yet unclassified
readFrom: stream

	columnDescriptions := Array new: stream nextInt16.
	1 to: columnDescriptions size do: [ :index |
		columnDescriptions at: index put: (
			PG3ColumnDescription new
				name: stream nextString;
				tableId: stream nextInt32;
				columnId: stream nextInt16;
				typeId: stream nextInt32;
				typeSize: stream nextInt16;
				typeModifier: stream nextInt32;
				formatCode: stream nextInt16;
				yourself) ]