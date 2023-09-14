Class {
	#name : #CDBSQLiteBackendTest,
	#superclass : #CDBFilesystemBackendTest,
	#category : #'CozoDB-Core-Tests-Backends'
}

{ #category : #'private - running' }
CDBSQLiteBackendTest >> createNewSession [

	^ CDBSession openRocksDBOn: databasePath
]
