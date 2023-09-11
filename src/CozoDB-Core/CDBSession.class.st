Class {
	#name : #CDBSession,
	#superclass : #Object,
	#instVars : [
		'handle',
		'library'
	],
	#category : #'CozoDB-Core'
}

{ #category : #'instance creation' }
CDBSession class >> openEngine: engine onPath: path withOptions: options [

	| lib |
	lib := CDBLibrary uniqueInstance.
	^ self new
		  handle: (lib openEngine: engine onPath: path  withOptions: options);
		  library: lib;
		  yourself
]

{ #category : #'instance creation' }
CDBSession class >> openInMemory [

	^ self openInMemoryWithOptions: ''
]

{ #category : #'instance creation' }
CDBSession class >> openInMemoryWithOptions: options [

	^ self openEngine: #mem onPath: '' withOptions: options
]

{ #category : #'instance creation' }
CDBSession class >> openRocksDBOn: path [

	^ self openRocksDBOn: path withOptions: ''
]

{ #category : #'instance creation' }
CDBSession class >> openRocksDBOn: path withOptions: options [

	^ self openEngine: #rocksdb onPath: path withOptions: options
]

{ #category : #'instance creation' }
CDBSession class >> openSqliteOn: path [

	^ self openSqliteOn: path withOptions: ''
]

{ #category : #'instance creation' }
CDBSession class >> openSqliteOn: path withOptions: options [

	^ self openEngine: #sqlite onPath: path withOptions: options
]

{ #category : #'backup / restore' }
CDBSession >> backupTo: path [

	^ library backupSession: handle toPath: path
]

{ #category : #closing }
CDBSession >> close [

	handle ifNil: [ self error: 'session already closed' ].
	library cozoClose: handle.
	handle := nil
]

{ #category : #'import / export' }
CDBSession >> exportRelations: relations [

	^ library exportRelations: relations onSession: handle
]

{ #category : #accessing }
CDBSession >> handle [

	^ handle
]

{ #category : #accessing }
CDBSession >> handle: anObject [

	handle := anObject
]

{ #category : #'import / export' }
CDBSession >> importBackupFrom: path relations: rels [

	^ library importBackupInto: handle fromPath: path relations: rels
]

{ #category : #'import / export' }
CDBSession >> importRelations: relations [

	^ library importRelations: relations onSession: handle
]

{ #category : #accessing }
CDBSession >> isConnected [

	^ handle notNil
]

{ #category : #accessing }
CDBSession >> library [

	^ library
]

{ #category : #accessing }
CDBSession >> library: anObject [

	library := anObject
]

{ #category : #'backup / restore' }
CDBSession >> restoreFrom: path [

	^ library restoreSession: handle fromPath: path
]

{ #category : #querying }
CDBSession >> runImmutableQuery: query [

	^ self runQuery: query withParameters: nil immutable: true
]

{ #category : #querying }
CDBSession >> runMutableQuery: query [

	^ self runQuery: query withParameters: nil immutable: false
]

{ #category : #querying }
CDBSession >> runQuery: query immutable: immutable [

	^ self runQuery: query withParameters: nil immutable: immutable
]

{ #category : #querying }
CDBSession >> runQuery: query withParameters: parameters immutable: immutable [

	^ CDBResult fromDictionary: (library
			   runQuery: query
			   onSession: handle
			   withParams: parameters
			   immutable: immutable)
]
