A PG3ResultSet represents the result of a single query. It contains the description of the rows and the rows themselves.

Instance Variables
	rowDescription:		<PG3RowDescription>
	rows:		<SequenceableCollection>

rowDescription
	- this object describes the structure of the rows.

rows
	- the rows returned by the query. It can be empty.
