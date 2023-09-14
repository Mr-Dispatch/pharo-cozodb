Class {
	#name : #CDBFilesystemBackendTestBase,
	#superclass : #CDBBackendTestBase,
	#instVars : [
		'dbPath'
	],
	#category : #'CozoDB-Core-Tests'
}

{ #category : #running }
CDBFilesystemBackendTestBase >> setUp [

	super setUp.
	self setupDbPath
	
	
]

{ #category : #running }
CDBFilesystemBackendTestBase >> setupDbPath [
	
	dbPath := (FileReference newTempFilePrefix: 'cozodb_test_' suffix: '.cdb') pathString 
]

{ #category : #running }
CDBFilesystemBackendTestBase >> tearDown [

	dbPath asFileReference in: [ :path |
		path exists ifTrue: [ path deleteAll ] ].
	super tearDown	
]
