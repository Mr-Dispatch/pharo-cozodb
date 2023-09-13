"
I wrap CozoDB stored relation metadata.
"
Class {
	#name : #CDBRelation,
	#superclass : #CDBFromDictionaryObjectBase,
	#instVars : [
		'name',
		'arity',
		'description',
		'keys',
		'nonKeys',
		'putTriggers',
		'replaceTriggers',
		'rmTriggers',
		'accessLevel'
	],
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
CDBRelation class >> fromDictionaryMappings [

	^ {
		  (#n_non_keys -> #nonKeys).
		  (#n_put_triggers -> #putTriggers).
		  (#n_keys -> #keys).
		  (#description -> #description).
		  (#n_replace_triggers -> #replaceTriggers).
		  (#arity -> #arity).
		  (#access_level -> #accessLevel).
		  (#n_rm_triggers -> #rmTriggers).
		  (#name -> #name) }
]

{ #category : #accessing }
CDBRelation >> accessLevel [

	^ accessLevel
]

{ #category : #accessing }
CDBRelation >> accessLevel: anObject [

	accessLevel := anObject
]

{ #category : #accessing }
CDBRelation >> arity [

	^ arity
]

{ #category : #accessing }
CDBRelation >> arity: anObject [

	arity := anObject
]

{ #category : #accessing }
CDBRelation >> columnsOn: aCDBSession [

	^ aCDBSession columns: self name
]

{ #category : #accessing }
CDBRelation >> description [

	^ description
]

{ #category : #accessing }
CDBRelation >> description: anObject [

	description := anObject
]

{ #category : #accessing }
CDBRelation >> keys [

	^ keys
]

{ #category : #accessing }
CDBRelation >> keys: anObject [

	keys := anObject
]

{ #category : #accessing }
CDBRelation >> name [

	^ name
]

{ #category : #accessing }
CDBRelation >> name: anObject [

	name := anObject
]

{ #category : #accessing }
CDBRelation >> nonKeys [

	^ nonKeys
]

{ #category : #accessing }
CDBRelation >> nonKeys: anObject [

	nonKeys := anObject
]

{ #category : #accessing }
CDBRelation >> putTriggers [

	^ putTriggers
]

{ #category : #accessing }
CDBRelation >> putTriggers: anObject [

	putTriggers := anObject
]

{ #category : #accessing }
CDBRelation >> replaceTriggers [

	^ replaceTriggers
]

{ #category : #accessing }
CDBRelation >> replaceTriggers: anObject [

	replaceTriggers := anObject
]

{ #category : #accessing }
CDBRelation >> rmTriggers [

	^ rmTriggers
]

{ #category : #accessing }
CDBRelation >> rmTriggers: anObject [

	rmTriggers := anObject
]
