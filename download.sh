#!/usr/bin/env bash

mkdir tmp
cd tmp
curl -o amalgamation.zip -L https://github.com/utelle/SQLite3MultipleCiphers/releases/download/v2.2.7/sqlite3mc-2.2.7-sqlite-3.51.2-amalgamation.zip
unzip amalgamation.zip

mv sqlite3.h ../Sources/CSQLite/_sqlite/
mv sqlite3.c ../Sources/CSQLite/_sqlite/

mv sqlite3mc_amalgamation.h ../Sources/CSQLite/_sqlite3mc/sqlite3.h
mv sqlite3mc_amalgamation.c ../Sources/CSQLite/_sqlite3mc/

cd ..
rm -r tmp
