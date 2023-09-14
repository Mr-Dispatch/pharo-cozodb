"
A CDBDatabaseErrorTest is a test class for testing the behavior of CDBDatabaseError
"
Class {
	#name : #CDBDatabaseErrorTest,
	#superclass : #TestCase,
	#category : #'CozoDB-Core-Tests-Exceptions'
}

{ #category : #tests }
CDBDatabaseErrorTest >> testIsAbstract [

	self assert: CDBDatabaseError isAbstract
]
