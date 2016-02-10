OCCI Schemas
===========

This repository hosts various schemas for [OCCI](http://occi-wg.org)

# Structure

All schemas are under `schemas` dir.

They are named after url-encoded name of the scheme of the extension.

# Utils

The `encode.sh` utils translate a string into its url-encoded version.
`decode.sh` the inverse

Usage:
```sh
$ ./encode.sh string...
$ ./decode.sh url-encoded-string...
```
