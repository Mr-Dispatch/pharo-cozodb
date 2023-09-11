# pharo-cozodb
**A CozoDB wrapper for Pharo Smalltalk**

CozoDB is:
- emeddable (not necessarilly embedded) database
  - the C lib version / the Pharo wrappers come with SQLite, RocksDB and memory back-ends
- with Datalog as a query language (concise queries)
- with time-travelling capabilities
- https://github.com/cozodb/cozo

In working state, fully wrapping the (very minimalistic) C API. Examples / Tests incoming.

Dependencies:
- NeoJSON (via Pharo Baseline)
- CozoDB C library
  - On Windows, from latest stable release (https://github.com/cozodb/cozo/releases)
  - choose one of the `libcozo_c-<version>-<architecture>-pc-windows-<compiler>.dll.zip` archives
    - DLLs produced by `msvc` are ~10M smaller compared to `gnu` ones
  - rename the .dll to libcozo_c.dll and stick it somewhere PharoVM will find it (on PATH, in the VM directory)

Load with:

```Smalltalk
Metacello new
  repository: 'github://Mr-Dispatch/pharo-cozodb/src';
  baseline: 'CozoDB';
  load.
```

Small example:
```Smalltalk
s := CDBSession openInMemory.
res := s runImmutableQuery: '?[column, another] <- [[4,"a"],[5,"b"],[6,"c"]]'.
(res columnNamed: #another) inspect.
s close.
```
