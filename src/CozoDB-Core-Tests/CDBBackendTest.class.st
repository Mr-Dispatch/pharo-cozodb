Class {
	#name : #CDBBackendTest,
	#superclass : #CDBDatabaseTest,
	#category : #'CozoDB-Core-Tests-Backends'
}

{ #category : #testing }
CDBBackendTest class >> isAbstract [

	^ self == CDBBackendTest
]

{ #category : #tests }
CDBBackendTest >> test1Equals1 [

	| res |
	res := session runImmutableQuery:
		       'q[a,b] <- [[1,1],[1,2]] ?[a,a] := q[a,a]'.

	self assert: res columns equals: #( 'a' 'a' ).
	self assert: res rows equals: #(#( 1 1 ))
]

{ #category : #tests }
CDBBackendTest >> testIsConnected [

	self assert: session isConnected
]
