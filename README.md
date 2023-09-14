# pharo-cozodb

**A [CozoDB](https://www.cozodb.org) wrapper for [Pharo](https://www.pharo.org) Smalltalk**

[![Unit Tests](https://github.com/astares/pharo-cozodb/workflows/Build/badge.svg?branch=development)](https://github.com/astares/pharo-cozodb/actions?query=workflow%3ABuild)
[![Coverage Status](https://codecov.io/github/astares/pharo-cozodb/coverage.svg?branch=development)](https://codecov.io/gh/astares/pharo-cozodb/branch/development)

[![Pharo 11](https://img.shields.io/badge/Pharo-11-%23aac9ff.svg)](https://pharo.org/download)

## CozoDB 

CozoDB is 
- a blending of Relational, Graph & Vector database
- performant, emeddable (not necessarilly embedded)
  - the C lib version / the Pharo wrappers come with (built-in) SQLite, RocksDB and memory back-ends
- with Datalog as a query language (concise queries)
- transactional, with time-travelling capabilities
- https://github.com/cozodb/cozo

Tested (developed) on Win10 & Ubuntu 23.04, fully wrapping the (very minimalistic) C API. More examples / tests incoming.

## Dependencies

- [NeoJSON](https://github.com/svenvc/NeoJSON) (via Pharo Baseline)
- CozoDB C library
  - from latest stable release [https://github.com/cozodb/cozo/releases](https://github.com/cozodb/cozo/releases)
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

# Examples

A simple transient query
```Smalltalk
session := CDBSession openInMemory.
result := session runImmutableQuery: '?[column, another] <- [[4,"a"],[5,"b"],[6,"c"]]'.
(result columnNamed: #another) inspect.
session close.
```

Creating a relation, putting in some data and querying again
```Smalltalk
session := CDBSession openInMemory.

"Create a relation and insert some data"
session 
  runMutableQuery: ':create superclass {sub, super}';
	runMutableQuery: '?[sub, super] <- [[''UndefinedObject'', ''Object'']] :put superclass {sub, super }';
	runMutableQuery: '?[sub, super] <- [[''TestCase'', ''Object'']] :put superclass {sub, super }'.

"Query the relation (table)"	
result := self session runImmutableQuery: '?[subclass, superclass] := *superclass[subclass, superclass]'.
result inspect

esssion close.
```
