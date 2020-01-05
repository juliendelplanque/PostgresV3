I am signalled when no connection can be retrieved while in #getConnection. This can have two reasons:
1. the maximum number of connections has been reached (see PG3ConnectionPoolArguments)
2. all connections were busy when performing the first check but there was at least 1 free connection after returning from waiting in the monitor queue.