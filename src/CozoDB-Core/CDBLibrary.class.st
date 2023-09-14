"
I wrap all of the CozoDB C library functions, and introduce some convenience Smalltalk-side wrappers.
"
Class {
	#name : #CDBLibrary,
	#superclass : #FFILibrary,
	#category : #'CozoDB-Core-Library'
}

{ #category : #'accessing - wrapped' }
CDBLibrary >> backupSession: id toPath: path [

	^ self handleCozoString:
		  (self cozoBackup: id toPath: path asString)
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoBackup: id toPath: path [

  ^ self ffiCall: #(char *cozo_backup(int32 id, char* path))
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoClose: sessionId [

	^ self ffiCall: #(bool cozo_close_db(int32 sessionId)) 
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoExportRelations: rels onSession: id [

  ^ self ffiCall: #(void *cozo_export_relations(int32 id, char* rels))
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoFree: cozoString [

	self ffiCall: #( void cozo_free_str(char* cozoString) )
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoImportFromBackup: id options: options [

  ^ self ffiCall: #(char *cozo_import_from_backup(int32 id, char* options))
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoImportRelations: rels onSession: id [

  ^ self ffiCall: #(void *cozo_import_relations(int32 id, char* rels))
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoOpenEngine: engine path: path options: options id: id [

  ^ self ffiCall: #(void * cozo_open_db(char *engine, char *path, char* options, int32* id))
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoRestore: id fromPath: path [

  ^ self ffiCall: #(char *cozo_restore(int32 id, char* path))
]

{ #category : #'accessing - ffi' }
CDBLibrary >> cozoRunQuery: query onSession: id withParams: params immutable: immutable [

	^ self ffiCall: #(void* cozo_run_query(int32 id, char* query, char* params, bool immutable))
]

{ #category : #'accessing - wrapped' }
CDBLibrary >> exportRelations: rels onSession: id [

	^ self handleCozoString:
		  (self cozoExportRelations: rels asString onSession: id)
]

{ #category : #'ffi helpers' }
CDBLibrary >> handleCozoString: cozoStr [
	" convert returned char* to smalltalk string, and call cozo cleanup function"

	| ret |
	cozoStr isNull ifTrue: [ ^ nil ].

	ret := cozoStr utf8StringFromCString.
	self cozoFree: cozoStr.

	^ ret
]

{ #category : #'ffi helpers' }
CDBLibrary >> handleJsonCozoString: str [

	^ NeoJSONReader fromString: (self handleCozoString: str)
]

{ #category : #'accessing - wrapped' }
CDBLibrary >> importBackupInto: id fromPath: path relations: rels [

	^ self cozoImportFromBackup: id options: (STON toJsonString: {
				   (#path -> path).
				   (#relations -> rels) } asDictionary)
]

{ #category : #'accessing - wrapped' }
CDBLibrary >> importRelations: rels onSession: id [

	^ self handleCozoString:
		  (self cozoImportRelations: rels asString onSession: id)
]

{ #category : #'accessing - platform' }
CDBLibrary >> macLibraryName [ 

	^ 'libcozo_c.so'
]

{ #category : #'accessing - wrapped' }
CDBLibrary >> openEngine: engine onPath: path withOptions: options [
	"open cozodb session. either returns session handle, or signals an error"

	| err id ret |
	id := FFIUInt32 newBuffer
		      pinInMemory;
		      yourself.
	err := self
		       cozoOpenEngine: engine
		       path: path
		       options: (options ifNil: [ '' ])
		       id: id.
	err isNull ifFalse: [ self error: (self handleCozoString: err) ].
	ret := id int32AtOffset: 0.
	^ ret
]

{ #category : #'accessing - wrapped' }
CDBLibrary >> restoreSession: id fromPath: path [

	^ self handleCozoString:
		  (self cozoRestore: id fromPath: path asString)
]

{ #category : #'accessing - wrapped' }
CDBLibrary >> runQuery: query onSession: id withParams: params immutable: immutable [
	"runs a cozodb query on a session"

	| params2 |
	params2 := params ifNil: [ Dictionary new ].
	params2 isDictionary ifFalse: [
		self error: 'params must be a Dictionary' ].

	^ self handleJsonCozoString: (self
			   cozoRunQuery: query
			   onSession: id
			   withParams: (NeoJSONWriter toString: params2)
			   immutable: immutable)
]

{ #category : #'accessing - platform' }
CDBLibrary >> unixLibraryName [

	^ 'libcozo_c.so'
]

{ #category : #'accessing - platform' }
CDBLibrary >> win32LibraryName [
	^ 'libcozo_c.dll'
]
