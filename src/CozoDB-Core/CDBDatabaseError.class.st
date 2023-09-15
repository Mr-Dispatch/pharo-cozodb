"
Abstract superclass for error in CozoDB
"
Class {
	#name : #CDBDatabaseError,
	#superclass : #Error,
	#category : #'CozoDB-Core-Exceptions'
}

{ #category : #testing }
CDBDatabaseError class >> isAbstract [

	^ self == CDBDatabaseError
]
