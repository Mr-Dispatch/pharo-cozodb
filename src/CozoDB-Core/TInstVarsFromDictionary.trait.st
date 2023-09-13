"
Trait enabling initialization of a class instance from a Dictionary.

If custom mappings are desired, supply your own fromDictionaryMappings class-side method, as the default implementation expects one-to-one mapping.
"
Trait {
	#name : #TInstVarsFromDictionary,
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
TInstVarsFromDictionary classSide >> fromDictionary: dict [
	" Creates a new instance and initializies instance variables
	according to mapping returned by fromDictionaryMappings method"

	| inst |
	inst := self new.

	self fromDictionaryMappings do: [ :dictToIvar |
		inst
			instVarNamed: dictToIvar value
			put: (dict at: dictToIvar key ifAbsent: [ nil ]) ].
	^ inst
]

{ #category : #'instance creation' }
TInstVarsFromDictionary classSide >> fromDictionaryMappings [
	"should return a SequenceableCollection of
    'dictionary key name' -> 'instance variable name' pairs"

	^ self instVarNames collect: [ :n | n -> n ]
]
