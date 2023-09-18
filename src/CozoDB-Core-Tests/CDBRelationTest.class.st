"
A CDBRelationTest is a test class for testing the behavior of CDBRelation
"
Class {
	#name : #CDBRelationTest,
	#superclass : #CDBDatabaseTest,
	#category : #'CozoDB-Core-Tests-Base'
}

{ #category : #tests }
CDBRelationTest >> testInsertIntoRelation [

	| result |
	self session 
		runMutableQuery: ':create superclass {sub, super}';
		runMutableQuery: '?[sub, super] <- [[''UndefinedObject'', ''Object'']] :put superclass {sub, super }';
		runMutableQuery: '?[sub, super] <- [[''TestCase'', ''Object'']] :put superclass {sub, super }'.
	
	result := self session runImmutableQuery: '?[subclass, superclass] := *superclass[subclass, superclass]'.
	
	self 
		assert: result columns size equals: 2;
		assert: result columns first equals: 'subclass';
		assert: result columns second equals: 'superclass'.
	
	"Check rows - remember that it is not the insertion order"	
	self 
		assert: result rows first first equals: 'TestCase';
		assert: result rows first second equals: 'Object';
		assert: result rows second first equals: 'UndefinedObject';
		assert: result rows second second equals: 'Object'
			
	
]
