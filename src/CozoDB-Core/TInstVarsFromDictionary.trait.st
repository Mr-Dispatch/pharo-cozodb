Trait {
	#name : #TInstVarsFromDictionary,
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
TInstVarsFromDictionary classSide >> fromDictionary: dict [

	| inst |
	inst := self new.

	self fromDictionaryMappings do: [ :m |
		inst instVarNamed: m value put: (dict at: m key ifAbsent: [ nil ]) ].

	^ inst
]

{ #category : #'instance creation' }
TInstVarsFromDictionary classSide >> fromDictionaryMappings [

	^ self instVarNames collect: [ :n | n -> n ]
]
