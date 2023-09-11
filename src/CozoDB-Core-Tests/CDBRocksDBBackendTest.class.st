Class {
	#name : #CDBRocksDBBackendTest,
	#superclass : #CDBFilesystemBackendTestBase,
	#category : #'CozoDB-Core-Tests'
}

{ #category : #running }
CDBRocksDBBackendTest >> setupSession [

	^ CDBSession openSqliteOn: dbPath
]
