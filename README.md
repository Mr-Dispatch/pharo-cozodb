# pharo-cozodb
**A CozoDB wrapper for Pharo Smalltalk**

CozoDB is:

- a blending of Relational, Graph & Vector database
- performant, emeddable (not necessarilly embedded)
  - the C lib version / the Pharo wrappers come with (built-in) SQLite, RocksDB and memory back-ends
- with Datalog as a query language (concise queries)
- transactional, with time-travelling capabilities
- https://github.com/cozodb/cozo

Tested (developed) on Win10 & Ubuntu 23.04, fully wrapping the (very minimalistic) C API. More examples / tests incoming.

Dependencies:

- NeoJSON (via Pharo Baseline)
- CozoDB C library
  - from latest stable release (https://github.com/cozodb/cozo/releases)
  - choose one of the `libcozo_c-<version>-<architecture>-<operating system>-<compiler>.<extension>.zip` archives
    - Windows DLLs compiled by `msvc` are ~10M smaller compared to `gnu` ones
  - rename the library to `libcozo_c.<extension>` and stick it somewhere PharoVM will find it (ie. in the correct VM directory)

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
