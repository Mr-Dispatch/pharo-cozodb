"
I wrap CozoDB column info metadata.
"
Class {
	#name : #CDBColumn,
	#superclass : #CDBFromDictionaryObjectBase,
	#instVars : [
		'isKey',
		'hasDefault',
		'column',
		'index',
		'type'
	],
	#category : #'CozoDB-Core-Base'
}

{ #category : #'instance creation' }
CDBColumn class >> fromDictionaryMappings [

	^ {
		  (#is_key -> #isKey).
		  (#has_default -> #hasDefault).
		  (#column -> #column).
		  (#index -> #index).
		  (#type -> #type) }
]

{ #category : #accessing }
CDBColumn >> column [

	^ column
]

{ #category : #accessing }
CDBColumn >> column: anObject [

	column := anObject
]

{ #category : #accessing }
CDBColumn >> hasDefault [

	^ hasDefault
]

{ #category : #accessing }
CDBColumn >> hasDefault: anObject [

	hasDefault := anObject
]

{ #category : #accessing }
CDBColumn >> index [

	^ index
]

{ #category : #accessing }
CDBColumn >> index: anObject [

	index := anObject
]

{ #category : #initialization }
CDBColumn >> initialize [

	super initialize.
	self column: ''
]

{ #category : #accessing }
CDBColumn >> isKey [

	^ isKey
]

{ #category : #accessing }
CDBColumn >> isKey: anObject [

	isKey := anObject
]

{ #category : #printing }
CDBColumn >> printOn: aStream [

	aStream nextPutAll: self column
]

{ #category : #accessing }
CDBColumn >> type [

	^ type
]

{ #category : #accessing }
CDBColumn >> type: anObject [

	type := anObject
]
