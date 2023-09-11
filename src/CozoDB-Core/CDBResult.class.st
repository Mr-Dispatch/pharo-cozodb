Class {
	#name : #CDBResult,
	#superclass : #Object,
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
CDBResult class >> fromDictionary: dict [

	^ ((dict at: #ok)
		   ifTrue: [ CDBResultSet ]
		   ifFalse: [ CDBErrorResult ]) fromDictionary: dict
]

{ #category : #testing }
CDBResult >> isError [

	^ self subclassResponsibility
]
