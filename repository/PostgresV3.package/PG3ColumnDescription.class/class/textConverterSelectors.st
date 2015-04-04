as yet unclassified
textConverterSelectors

	^#(
			(16 #parseBooleanLength:) "bool"
			(17 #parseByteArrayLength:) "bytea"
			(18 #parseCharacterLength:) "char"
			(19 #parseStringLength:) "name"
			(20 #parseIntegerLength:) "int8"
			(21 #parseIntegerLength:) "int2"
			(22 #parseIntegerVectorLength:) "int2vector"
			(23 #parseIntegerLength:) "int4"	
			(24 #parseStringLength:) "regproc"
			(25 #parseStringLength:) "text"
			(26 #parseIntegerLength:) "oid"
			(114 #parseJsonLength:) "json"
			(142 #parseXmlLength:) "xml"
			(143 #parseXmlArrayLength:) "xml[]"
			(199 #parseJsonArrayLength:) "json[]"
			(1043 #parseStringLength:) "character varying"		
			(1042 #parseStringLength:) "char"		
			
			(1082 #parseDateLength:) "date"		
		
			(1114 #parseTimestampWithoutTimezoneLength:) "timestamp"		
			(1184 #parseTimestampWithTimezoneLength:) "timestamptz"

			(1700 #parseScaledDecimalLength:) "numeric"
		
			(700 #parseFloatLength:) "float4"
			(701 #parseFloatLength:) "float8"
				
			(705 #parseStringLength:) "unknown"
		
			(1000 #parseBooleanArrayLength:) "bool[]"
			(1003 #parseStringArrayLength:) "name[]"
			(1005 #parseIntegerArrayLength:) "int2[]"
			(1009 #parseStringArrayLength:) "text[]"
			(1007 #parseIntegerArrayLength:) "int4[]"
			(1014 #parseStringArrayLength:) "character[]"
			(1015 #parseStringArrayLength:) "character varying[]"
			(1016 #parseIntegerArrayLength:) "int2[]"
			(1021 #parseFloatArrayLength:) "float4[]"
			(1022 #parseFloatArrayLength:) "float8[]"			
			(1231 #parseScaledDecimalArrayLength:) "numeric[]"
		
			(1790 #parseStringLength:) "refcursor[]"
		)