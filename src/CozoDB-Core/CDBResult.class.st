"
Abstract base class for CozoDB responses (errors, or returned rows).
"
Class {
	#name : #CDBResult,
	#superclass : #Object,
	#traits : 'TInstVarsFromDictionary',
	#classTraits : 'TInstVarsFromDictionary classTrait',
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
CDBResult class >> fromDictionary: dict [

	^ ((dict at: #ok)
		   ifTrue: [ CDBResultSet ]
		   ifFalse: [ CDBErrorResult ]) fromDictionary: dict
]

{ #category : #controlling }
CDBResult >> ifError: aBlock [

	self subclassResponsibility
]

{ #category : #controlling }
CDBResult >> ifError: anErrorBlock ifNotError: aBlock [

	self subclassResponsibility
]

{ #category : #controlling }
CDBResult >> ifNotError: aBlock [

	self subclassResponsibility
]

{ #category : #testing }
CDBResult >> isError [

	^ self subclassResponsibility
]
