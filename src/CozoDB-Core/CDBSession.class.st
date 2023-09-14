"
I wrap a CozoDB session (an Integer handle, nice and accessible, sequential => easily forgeable; cool if you forget to close a session as well as if you/someone inject somecode/somevalue).

I provide means to establish CozoDB sessions (class side, instance-creation category).

I also provide interface (delagate to CDBLibrary instance) for interacting with CozoDB session (instance side methods).

A lot of my methods correspond to CozoDB functionality, so library call -> C function name -> CozoDB docs / C lib header file, unless the lazy, no-good author of this library migrated the relevant info.
"
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
	"attempt to close the session, return whether it succeeded.
    the session handle gets invalidated anyways, as if it wasn't
    closed, it was invalid anyways."

	| ret |
	handle ifNil: [ self error: 'session already closed' ].
	ret := library cozoClose: handle.
	handle := nil.
	^ ret
]

{ #category : #'query metadata' }
CDBSession >> columns: aString [
	"queries metadata about columns of a stored relation"

	^ (self runImmutableQuery: '::columns ', aString) fromRowDictsAs: CDBColumn
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

{ #category : #'query metadata' }
CDBSession >> relations [
	"queries metadata about all stored relations"

	^ (self runImmutableQuery: '::relations') fromRowDictsAs: CDBRelation
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
CDBSession >> runImmutableQuery: query withParameters: params [

	^ self runQuery: query withParameters: params immutable: true
]

{ #category : #querying }
CDBSession >> runMutableQuery: query [

	^ self runQuery: query withParameters: nil immutable: false
]

{ #category : #querying }
CDBSession >> runMutableQuery: query withParameters: params [

	^ self runQuery: query withParameters: params immutable: false
]

{ #category : #querying }
CDBSession >> runQuery: query immutable: immutable [

	^ self runQuery: query withParameters: nil immutable: immutable
]

{ #category : #querying }
CDBSession >> runQuery: query withParameters: parameters immutable: immutable [

	^ CDBResult fromResponse: (library
			   runQuery: query
			   onSession: handle
			   withParams: parameters
			   immutable: immutable)
]
