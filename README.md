# PostgresV3

A Pharo driver for PostreSQL using version 3.0 of the protocol.
It is based on Levente Uzonyi's [PostgresV3 package](http://www.squeaksource.com/PostgresV3.html).


## Installation and project start

1. Download the latest [Pharo 4 image](http://files.pharo.org/image/40/latest.zip) from the CI server.
2. Copy/paste the `.image` and `.changes` as `pharo.image` and `pharo.changes`.
3. Fetch the latest changes from Git.
3. Run `$ app install` to load the smalltalk code into the image.
4. Run `$ app start` to start the configured image.

## Development

When you're done, commit your changes with Monticello in the filetree repository lying in `repository/`. Switch back to the command line and commit your changes with Git.

## Usage

Example usage:

	connectionArgs := PG3ConnectionArguments new
		hostname: 'localhost';
		username: 'fstephany';
		password: '';
		port: 5432;
		databaseName: 'creative-mons'.
	
	pg := connectionArgs newConnection.
	pg startup.
	resultSets := pg execute: 'SELECT* FROM entries'.
	resultSet := resultSets first.
	resultSet rowsWithColumnNameDictionary.




