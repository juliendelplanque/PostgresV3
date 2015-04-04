I hold the arguments of a connection which are used when the connection is being established.

Instance Variables
	automaticStringConversion:		<Boolean>
	connectTimeout:		<Integer>
	databaseName:		<String>
	hostname:		<String>
	password:		<String>
	port:		<Integer>
	username:		<String>

automaticStringConversion
	- if true, then automatically create and install a TextConverter object based on the 'server_encoding' parameter sent by the server, otherwise don't perform character encoding/decoding. Default is true.

connectTimeout
	- the number of milliseconds to wait for a connection to be created. Default 5000 (5 seconds).

databaseName
	- the name of the database to connect to

hostname
	- the name of the host to connect to

password
	- the password of the account to be used

port
	- the port of the server to connect to. Default 5432.

username
	- the username of the account to be used
	
	
Usage examples:
===========

Setting all arguments:
arguments := PG3ConnectionArguments new
	hostname: 'localhost';
	databaseName: 'db2;
	username: 'user';
	password: 'secret';
	automaticStringConversion: false;
	connectTimeout: 1000;
	yourself
	
The easiest way to create a connection setting only the necessary arguments:
connection := PG3ConnectionArguments new
	hostname: 'localhost';
	databaseName: 'db2;
	username: 'squeaker';
	password: 'secret';
	newConnection.
	