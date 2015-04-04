explorer
explorerContents

	^Smalltalk at: #ObjectExplorerWrapper ifPresent: [ :objectExplorerWrapper |
		| instVarNames |
		instVarNames := self class allInstVarNames.
		Array new: self size + instVarNames size streamContents: [ :stream |
			instVarNames withIndexDo: [ :name :index | 
				| value |
				value := self instVarAt: index.
				stream nextPut: (
					objectExplorerWrapper
						with: value
						name: name
						model: value) ].
			columnNameDictionary 
				ifNil: [
					1 to: self size do: [ :index |
						stream nextPut: (objectExplorerWrapper
							with: (self at: index)
							name: index printString
							model: self) ] ]
				ifNotNil: [
					stream nextPutAll: (
						(columnNameDictionary associations
							sort: [ :a :b | a value < b value ])
							replace: [ :assoc |
								objectExplorerWrapper
									with: (self at: assoc value)
									name: assoc key, (' (', assoc value asString, ')')
									model: self ]) ] ] ]