Class {
	#name : #CDBResultSet,
	#superclass : #CDBResult,
	#instVars : [
		'rows',
		'columns'
	],
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
CDBResultSet class >> fromDictionary: dict [ 

	^ self new
		columns: (dict at: #headers);
		rows: (dict at: #rows);
		yourself
]

{ #category : #accessing }
CDBResultSet >> column: anInteger [

	anInteger > columns size ifTrue: [
		self error: 'Too big column index' ].
	^ self rows collect: [ :row | row at: anInteger ]
]

{ #category : #accessing }
CDBResultSet >> columnNamed: aString [

	^ self column: (columns
			   indexOf: aString
			   ifAbsent: [ self error: 'wrong column name' ])
]

{ #category : #accessing }
CDBResultSet >> columns [

	^ columns
]

{ #category : #accessing }
CDBResultSet >> columns: anObject [

	columns := anObject
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
