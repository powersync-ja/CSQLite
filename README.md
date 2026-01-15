[SQLite](https://sqlite.org/index.html) and [SQLite3MultipleCiphers](https://github.com/utelle/SQLite3MultipleCiphers),
packaged for the Swift package manager.

## Releasing

This package is consumed by our Swift SDK with a SwiftPM git dependency.
By convention, we release this package after updating SQLite and creating a tag named after the SQLite version
(e.g. `3.51.2`, without a `v` prefix).

The easiest way to release this package is to create a release and tag on GitHub, with a description linking
to the SQLite and SQLite3 Multiple Ciphers sources:

```
This release mirrors [SQLite 3.51.2](https://sqlite.org/releaselog/3_51_2.html) and [SQLite3MultipleCiphers 2.2.7](https://github.com/utelle/SQLite3MultipleCiphers/releases/tag/v2.2.7).
```

No further pre-release checks or builds are required for this package.

## Acknowledgements

This project was heavily inspired by [@sbooth's work](https://github.com/sbooth/CSQLite/tree/main).
The main difference is that this package uses reasonable options without package traits, as well as
providing a target for SQLite3MultipleCiphers.
