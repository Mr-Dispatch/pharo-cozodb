Class {
	#name : #CDBResultSet,
	#superclass : #CDBResult,
	#instVars : [
		'headers',
		'rows'
	],
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
CDBResultSet class >> fromDictionary: dict [ 

	^ self new
		headers: (dict at: #headers);
		rows: (dict at: #rows);
		yourself
]

{ #category : #accessing }
CDBResultSet >> column: anInteger [

	anInteger > headers size ifTrue: [
		self error: 'Too big column index' ].
	^ self rows collect: [ :row | row at: anInteger ]
]

{ #category : #accessing }
CDBResultSet >> columnNamed: aString [

	^ self column: (headers
			   indexOf: aString
			   ifAbsent: [ self error: 'wrong column name' ])
]

{ #category : #accessing }
CDBResultSet >> headers [

	^ headers
]

{ #category : #accessing }
CDBResultSet >> headers: anObject [

	headers := anObject
]

{ #category : #testing }
CDBResultSet >> isError [

	^ false
]

{ #category : #accessing }
CDBResultSet >> row: anInteger [

	^ self rows at: anInteger
]

{ #category : #accessing }
CDBResultSet >> rows [

	^ rows
]

{ #category : #accessing }
CDBResultSet >> rows: anObject [

	rows := anObject
]
