#!/usr/bin/env bash

# Downloading sqlite3mc
mkdir tmp
cd tmp
curl -o amalgamation.zip -L https://github.com/utelle/SQLite3MultipleCiphers/releases/download/v2.5.1/sqlite3mc-2.5.1-sqlite-3.53.4-amalgamation.zip
unzip amalgamation.zip

mv sqlite3.h ../Sources/CSQLite/_sqlite/
mv sqlite3.c ../Sources/CSQLite/_sqlite/

mv sqlite3mc_amalgamation.h ../Sources/CSQLite/_sqlite3mc/sqlite3.h
mv sqlite3mc_amalgamation.c ../Sources/CSQLite/_sqlite3mc/

cd ..
rm -r tmp

# Downloading sqlite3
mkdir tmp
cd tmp
curl -o sqlite3.zip -L https://sqlite.org/2026/sqlite-amalgamation-3530400.zip
unzip sqlite3.zip

mv sqlite-amalgamation-3530400/sqlite3.h ../Sources/CSQLite/_sqlite/
mv sqlite-amalgamation-3530400/sqlite3.c ../Sources/CSQLite/_sqlite/

cd ..
rm -r tmp
