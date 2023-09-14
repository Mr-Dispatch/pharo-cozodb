"
I wrap a successful CozoDB result (an array of rows + their respective column names).
"
Class {
	#name : #CDBResultSet,
	#superclass : #CDBResult,
	#instVars : [
		'rows',
		'columns'
	],
	#category : #'CozoDB-Core-Base'
}

{ #category : #'instance creation' }
CDBResultSet class >> fromDictionaryMappings [

	^ {
		  (#headers -> #columns).
		  (#rows -> #rows) }
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

{ #category : #converting }
CDBResultSet >> fromRowDict: anInteger as: aClass [

	^ aClass fromDictionary: (self rowDict: anInteger)
]

{ #category : #converting }
CDBResultSet >> fromRowDictsAs: aClass [

	^ self rowDicts collect: [ :d | aClass fromDictionary: d ]
]

{ #category : #controlling }
CDBResultSet >> ifError: aBlock [

	^ nil
]

{ #category : #controlling }
CDBResultSet >> ifError: anErrorBlock ifNotError: aBlock [

	^ aBlock cull: self
]

{ #category : #controlling }
CDBResultSet >> ifNotError: aBlock [

	^ aBlock cull: self
]

{ #category : #testing }
CDBResultSet >> inspectionRows [
	<inspectorPresentationOrder: 0 title: 'Rows'>

	| specTable |
	specTable := SpTablePresenter new.
	specTable addColumn: (SpIndexTableColumn new
		title: '#';
		width: 30;
		yourself).

	1 to: self rows size do: [ :index |
		specTable addColumn: (SpStringTableColumn new
			title: (self columns at: index) asString;
			evaluated: [ :each | each at: index ]) ].

	specTable items: ((1 to: self rows size) collect: [ :index | self rows at: index ]).
	^ specTable
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
CDBResultSet >> rowDict: anInteger [

	^ (columns with: (rows at: anInteger) collect: [ :c :r | c -> r ])
		  asDictionary
]

{ #category : #accessing }
CDBResultSet >> rowDicts [

	^ rows collect: [ :row |
		  (columns with: row collect: [ :c :r | c -> r ]) asDictionary ]
]

{ #category : #accessing }
CDBResultSet >> rows [

	^ rows
]

{ #category : #accessing }
CDBResultSet >> rows: anObject [

	rows := anObject
]

{ #category : #helpers }
CDBResultSet >> suggestMappings [
	"helper method, returns array with an instance variables names and associations from snake-case names to camel-case names"

	| mappings |
	mappings := (columns collect: [ :k |
		             | parts |
		             parts := k splitOn: $_.

		             k -> (parts first
		              ,
		              ('' join:
			               (parts allButFirst collect: [ :p | p capitalized ]))) ])
		            asDictionary.
	^ Array
		  with: (' ' join: mappings values)
		  with: (String crlf join: (mappings associations collect: [ :a |
					    String streamContents: [ :strm |
						    strm
							    nextPut: $#;
							    nextPutAll: a key;
							    nextPutAll: ' -> #';
							    nextPutAll: a value;
							    nextPut: $. ] ]))
]
