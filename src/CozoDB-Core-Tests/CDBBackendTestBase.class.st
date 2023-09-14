Class {
	#name : #CDBBackendTestBase,
	#superclass : #TestCase,
	#instVars : [
		'session'
	],
	#category : #'CozoDB-Core-Tests'
}

{ #category : #testing }
CDBBackendTestBase class >> isAbstract [

	^ {
		  CDBFilesystemBackendTestBase.
		  CDBBackendTestBase } includes: self
]

{ #category : #accessing }
CDBBackendTestBase >> session [

	^ session
]

{ #category : #accessing }
CDBBackendTestBase >> session: anObject [

	session := anObject
]

{ #category : #running }
CDBBackendTestBase >> setUp [

	super setUp.
	session := self setupSession
]

{ #category : #running }
CDBBackendTestBase >> setupSession [

	self subclassResponsibility
]

{ #category : #running }
CDBBackendTestBase >> tearDown [

	session close.
	super tearDown
]

{ #category : #tests }
CDBBackendTestBase >> test1Equals1 [

	| res |
	res := session runImmutableQuery:
		       'q[a,b] <- [[1,1],[1,2]] ?[a,a] := q[a,a]'.

	self assert: res columns equals: #( 'a' 'a' ).
	self assert: res rows equals: #(#( 1 1 ))
]
