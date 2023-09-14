"
A CDBSessionTest is a test class for testing the behavior of CDBSession
"
Class {
	#name : #CDBSessionTest,
	#superclass : #CDBDatabaseTest,
	#category : #'CozoDB-Core-Tests-Base'
}

{ #category : #tests }
CDBSessionTest >> testCreateRelation [

	| relations |
	self session runMutableQuery: ':create superclass {subclass, superclass}'.
	relations := self session relations.
	
	self assert: relations size equals: 1.
	self assert: relations first name equals: 'superclass'
]
