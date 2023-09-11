Class {
	#name : #CDBSQLiteBackendTest,
	#superclass : #CDBFilesystemBackendTestBase,
	#category : #'CozoDB-Core-Tests'
}

{ #category : #running }
CDBSQLiteBackendTest >> setupSession [

	^ CDBSession openRocksDBOn: dbPath
]
