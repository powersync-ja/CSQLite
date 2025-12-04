#!/usr/bin/env bash

mkdir tmp
cd tmp
curl -o amalgamation.zip -L https://github.com/utelle/SQLite3MultipleCiphers/releases/download/v2.2.6/sqlite3mc-2.2.6-sqlite-3.51.1-amalgamation.zip
unzip amalgamation.zip

mv sqlite3.h sqlite3ext.h ../Sources/CSQLite/include/
mv sqlite3.c ../Sources/CSQLite/

mv sqlite3mc_amalgamation.h ../Sources/CSQLite3MultipleCiphers/include/sqlite3.h
mv sqlite3mc_amalgamation.c ../Sources/CSQLite3MultipleCiphers/

cd ..
rm -r tmp
