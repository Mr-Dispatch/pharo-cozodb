Class {
	#name : #CDBInMemoryBackendTest,
	#superclass : #CDBBackendTestBase,
	#category : #'CozoDB-Core-Tests'
}

{ #category : #running }
CDBInMemoryBackendTest >> setupSession [

	^ CDBSession openInMemory
]
