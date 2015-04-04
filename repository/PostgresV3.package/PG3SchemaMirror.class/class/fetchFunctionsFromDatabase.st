synchronization
fetchFunctionsFromDatabase

	| rs |
	rs := self pool withConnectionDo: [ :connection | 
		connection execute: '
select 
	pgn.nspname as "schema", 
	pgp.proname as "name",
	pgp.prosrc as "body",
	pgp.proargnames as "argumentNames",
	(select array_accum(
		case 
			when n.oid < 100 then t.typname
			else n.nspname || ''.'' || t.typname
		end) 
	 from 
		generate_series(array_lower(pgp.proargtypes, 1), array_upper(pgp.proargtypes, 1)) as s(a)
		join pg_type t on t.oid = pgp.proargtypes[s.a]
		join pg_namespace n on n.oid = t.typnamespace) as "argumentTypes",
	case 
		when pgretn.oid < 100 then pgrett.typname 
		else pgretn.nspname || ''.'' || pgrett.typname 
	end as "returnType",
	case pgp.provolatile 
		when ''v'' then ''volatile''
		when ''s'' then ''stable''
		when ''i'' then ''immutable''
	end as "volatility"
from 
	pg_proc pgp
	join pg_namespace pgn on pgn.oid = pgp.pronamespace
	join pg_type pgrett on pgrett.oid = pgp.prorettype
	join pg_namespace pgretn on pgretn.oid = pgrett.typnamespace
where pgn.nspname = ', self schema asPG3SqlLiteral ].
	^rs first rowsWithColumnNameDictionary collect: [ :each | 
		PG3FunctionMirror fromRow: each in: self ]