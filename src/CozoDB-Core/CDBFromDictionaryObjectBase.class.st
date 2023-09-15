"
Abstract base class that - for now - just imports the TInstVarsFromDictionary trait.
"
Class {
	#name : #CDBFromDictionaryObjectBase,
	#superclass : #Object,
	#traits : 'TInstVarsFromDictionary',
	#classTraits : 'TInstVarsFromDictionary classTrait',
	#category : #'CozoDB-Core-Base'
}

{ #category : #testing }
CDBFromDictionaryObjectBase class >> isAbstract [

	^ self = CDBFromDictionaryObjectBase
]
