Extension { #name : #CDBResultSet }

{ #category : #'*CozoDB-Tools-Pharo' }
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
