Extension { #name : #CDBSession }

{ #category : #'*CozoDB-Tools-Pharo' }
CDBSession >> inspectionRelations [
	<inspectorPresentationOrder: 1 title: 'Relations'>

	| presenter |
	presenter := SpTablePresenter new
		             addColumn:
			             ((SpStringTableColumn
				               title: 'Relations'
				               evaluated: #name)
				              width: 100;
				              yourself);
		             items: self relations;
		             beResizable;
		             yourself.
	^ presenter
]
