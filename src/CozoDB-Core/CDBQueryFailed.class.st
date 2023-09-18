"
This error is thrown when a query failed in CozoDB
"
Class {
	#name : #CDBQueryFailed,
	#superclass : #CDBDatabaseError,
	#instVars : [
		'queryResult'
	],
	#category : #'CozoDB-Core-Exceptions'
}

{ #category : #'instance creation' }
CDBQueryFailed class >> queryResult: aResult [

	^ (self new)
			queryResult: aResult;
			yourself
]

{ #category : #accessing }
CDBQueryFailed >> queryResult [

	^ queryResult
]

{ #category : #accessing }
CDBQueryFailed >> queryResult: anObject [

	queryResult := anObject
]
