Class {
	#name : #CDBBackendTest,
	#superclass : #TestCase,
	#instVars : [
		'session'
	],
	#category : #'CozoDB-Core-Tests-Backends'
}

{ #category : #testing }
CDBBackendTest class >> isAbstract [

	^ self == CDBBackendTest
]

{ #category : #'private - running' }
CDBBackendTest >> createNewSession [

	^ CDBSession openInMemory
]

{ #category : #accessing }
CDBBackendTest >> session [

	^ session
]

{ #category : #accessing }
CDBBackendTest >> session: anObject [

	session := anObject
]

{ #category : #running }
CDBBackendTest >> setUp [

	super setUp.
	self setUpDatabase
]

{ #category : #'private - running' }
CDBBackendTest >> setUpDatabase [

	self setUpSession
]

{ #category : #'private - running' }
CDBBackendTest >> setUpSession [

	self session: self createNewSession
]

{ #category : #running }
CDBBackendTest >> tearDown [

	self tearDownDatabase.
	super tearDown
]

{ #category : #'private - running' }
CDBBackendTest >> tearDownDatabase [

	self tearDownSession
]

{ #category : #'private - running' }
CDBBackendTest >> tearDownSession [

	session close
]

{ #category : #tests }
CDBBackendTest >> test1Equals1 [

	| res |
	res := session runImmutableQuery:
		       'q[a,b] <- [[1,1],[1,2]] ?[a,a] := q[a,a]'.

	self assert: res columns equals: #( 'a' 'a' ).
	self assert: res rows equals: #(#( 1 1 ))
]
