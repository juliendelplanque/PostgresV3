A PG3Row is an Array-like object which represents a row returned by a query. It can be accessed by index (via #at: and #at:put:) or by the name of the column sent to it as a unary message, if columnNameDictionary is not nil, the name of the column is a valid unary selector and the selector is not defined by Object or ProtoObject (the only exception is #name, which can be used as a column name). If the column name is not a valid unary selector or the selector is implemented by a superclass (Object or ProtoObject), then #atName: #atName:ifAbsent: and #atName:put: can be used to access the slots by name.

Instance Variables
	columnNameDictionary:		<IdentityDictionary>

columnNameDictionary
	- the IdentityDictionary which maps column names to indices, it's size should be the same as the PG3Row's size, it's keys should be symbols representing the column names and it's values should be integers between 1 the size of the row. All integers between 1 and row size should be present as a value.