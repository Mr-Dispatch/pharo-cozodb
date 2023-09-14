Class {
	#name : #CDBFilesystemBackendTest,
	#superclass : #CDBBackendTest,
	#instVars : [
		'databasePath'
	],
	#category : #'CozoDB-Core-Tests-Backends'
}

{ #category : #testing }
CDBFilesystemBackendTest class >> isAbstract [

	^ self == CDBFilesystemBackendTest
]

{ #category : #'private - cleanup' }
CDBFilesystemBackendTest >> cleanupUsedFiles [

	databasePath asFileReference in: [ :path |
		path exists ifTrue: [ path deleteAll ] ]
]

{ #category : #running }
CDBFilesystemBackendTest >> setUp [

	super setUp.
	self setUpDatabasePath
	
	
]

{ #category : #'private - running' }
CDBFilesystemBackendTest >> setUpDatabase [

	self setUpDatabasePath.
	self setUpSession
]

{ #category : #running }
CDBFilesystemBackendTest >> setUpDatabasePath [
	
	databasePath := (FileReference newTempFilePrefix: 'cozodb_test_' suffix: '.cdb') pathString 
]

{ #category : #'private - running' }
CDBFilesystemBackendTest >> tearDownDatabase [

	self tearDownSession.
	self cleanupUsedFiles
]
