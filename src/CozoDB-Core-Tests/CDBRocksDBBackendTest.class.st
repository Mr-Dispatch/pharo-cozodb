Class {
	#name : #CDBRocksDBBackendTest,
	#superclass : #CDBFilesystemBackendTest,
	#category : #'CozoDB-Core-Tests-Backends'
}

{ #category : #'private - running' }
CDBRocksDBBackendTest >> createNewSession [

	^ CDBSession openSqliteOn: databasePath
]
