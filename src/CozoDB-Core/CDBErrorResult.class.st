"
I wrap a CozoDB error response.
"
Class {
	#name : #CDBErrorResult,
	#superclass : #CDBResult,
	#instVars : [
		'causes',
		'code',
		'severity',
		'display',
		'labels',
		'help',
		'related',
		'filename'
	],
	#category : #'CozoDB-Core-Base'
}

{ #category : #accessing }
CDBErrorResult >> causes [

	^ causes
]

{ #category : #accessing }
CDBErrorResult >> causes: anObject [

	causes := anObject
]

{ #category : #accessing }
CDBErrorResult >> code [

	^ code
]

{ #category : #accessing }
CDBErrorResult >> code: anObject [

	code := anObject
]

{ #category : #accessing }
CDBErrorResult >> display [

	^ display
]

{ #category : #accessing }
CDBErrorResult >> display: anObject [

	display := anObject
]

{ #category : #accessing }
CDBErrorResult >> filename [

	^ filename
]

{ #category : #accessing }
CDBErrorResult >> filename: anObject [

	filename := anObject
]

{ #category : #accessing }
CDBErrorResult >> help [

	^ help
]

{ #category : #accessing }
CDBErrorResult >> help: anObject [

	help := anObject
]

{ #category : #controlling }
CDBErrorResult >> ifError: aBlock [

	^ aBlock cull: self
]

{ #category : #controlling }
CDBErrorResult >> ifError: anErrorBlock ifNotError: aBlock [

	^ anErrorBlock cull: self
]

{ #category : #controlling }
CDBErrorResult >> ifNotError: aBlock [

	^ nil
]

{ #category : #testing }
CDBErrorResult >> isError [

	^ true
]

{ #category : #accessing }
CDBErrorResult >> labels [

	^ labels
]

{ #category : #accessing }
CDBErrorResult >> labels: anObject [

	labels := anObject
]

{ #category : #accessing }
CDBErrorResult >> related [

	^ related
]

{ #category : #accessing }
CDBErrorResult >> related: anObject [

	related := anObject
]

{ #category : #accessing }
CDBErrorResult >> severity [

	^ severity
]

{ #category : #accessing }
CDBErrorResult >> severity: anObject [

	severity := anObject
]
