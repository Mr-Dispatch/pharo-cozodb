"
A CDBColumnTest is a test class for testing the behavior of CDBColumn
"
Class {
	#name : #CDBColumnTest,
	#superclass : #TestCase,
	#category : #'CozoDB-Core-Tests-Base'
}

{ #category : #'tests - printing' }
CDBColumnTest >> testPrintString [

	self assert: CDBColumn new printString isEmpty
]

{ #category : #'tests - printing' }
CDBColumnTest >> testPrintStringUsesColumn [

	| column |
	column := CDBColumn new column: 'simple'.
	self assert: column printString equals: 'simple'
]
