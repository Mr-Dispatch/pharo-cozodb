Class {
	#name : #CDBDatabaseTest,
	#superclass : #TestCase,
	#instVars : [
		'session'
	],
	#category : #'CozoDB-Core-Tests-Base'
}

{ #category : #testing }
CDBDatabaseTest class >> isAbstract [

	^ self == CDBDatabaseTest
]

{ #category : #'private - running' }
CDBDatabaseTest >> createNewSession [

	^ CDBSession openInMemory
]

{ #category : #accessing }
CDBDatabaseTest >> session [

	^ session
]

{ #category : #accessing }
CDBDatabaseTest >> session: anObject [

	session := anObject
]

{ #category : #running }
CDBDatabaseTest >> setUp [

	super setUp.
	self setUpDatabase
]

{ #category : #'private - running' }
CDBDatabaseTest >> setUpDatabase [

	self setUpSession
]

{ #category : #'private - running' }
CDBDatabaseTest >> setUpSession [

	self session: self createNewSession
]

{ #category : #running }
CDBDatabaseTest >> tearDown [

	self tearDownDatabase.
	super tearDown
]

{ #category : #'private - running' }
CDBDatabaseTest >> tearDownDatabase [

	self tearDownSession
]

{ #category : #'private - running' }
CDBDatabaseTest >> tearDownSession [

	session close
]
