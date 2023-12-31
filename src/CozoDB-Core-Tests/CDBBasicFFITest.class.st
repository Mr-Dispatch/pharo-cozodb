Class {
	#name : #CDBBasicFFITest,
	#superclass : #TestCase,
	#category : #'CozoDB-Core-Tests-FFI'
}

{ #category : #tests }
CDBBasicFFITest >> testDoubleCloseRaises [

	| session |
	session := CDBSession openInMemory.
	session close.
	self
		should: [ session close ]
		raise: Error
		description: 'session already closed'
]

{ #category : #tests }
CDBBasicFFITest >> testInMemorySessionConnectDisconnect [

	| session |
	session := CDBSession openInMemory.
	self assert: session close equals: true. "cozo really closed the descriptor"
	self assert: session handle equals: nil
]
