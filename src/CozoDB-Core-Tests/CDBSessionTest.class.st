"
A CDBSessionTest is a test class for testing the behavior of CDBSession
"
Class {
	#name : #CDBSessionTest,
	#superclass : #CDBDatabaseTest,
	#category : #'CozoDB-Core-Tests-Base'
}

{ #category : #'tests - relations' }
CDBSessionTest >> testCreateRelation [

	| relations |
	self session runMutableQuery: ':create superclass {subclass, superclass}'.
	relations := self session relations.

	self assert: relations size equals: 1.
	self assert: relations first name equals: 'superclass'
]

{ #category : #tests }
CDBSessionTest >> testIsConnected [

	self assert: self session isConnected
]

{ #category : #'tests - relations' }
CDBSessionTest >> testQueryColumnsOfRelation [

	| columns |
	self session runMutableQuery: ':create relation { columnA, columnB }'.
	columns := self session columns: 'relation'.
	self assert: columns size equals: 2.
	self assert: columns first column equals: 'columnA'.
	self assert: columns second column equals: 'columnB'
]
