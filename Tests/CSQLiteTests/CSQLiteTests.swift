import Testing
@testable import CSQLite

#if Encryption
let encryption = true
#else
let encryption = false
#endif


@Test func smoke_test() throws {
    var db: OpaquePointer?
    try #require(sqlite3_open_v2(":memory:", &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, nil) == SQLITE_OK)
    #expect(sqlite3_close_v2(db) == SQLITE_OK)
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
}

@Test(.disabled(if: !encryption)) func links_sqlite3mc() throws {
    var db: OpaquePointer?
    try #require(sqlite3_open_v2(":memory:", &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, nil) == SQLITE_OK)

    var stmt: OpaquePointer?
    try #require(sqlite3_prepare_v2(db, "pragma cipher", 13, &stmt, nil) == SQLITE_OK)
    try #require(sqlite3_step(stmt) == SQLITE_ROW)
    let cipher = String(cString: sqlite3_column_text(stmt, 0))
    #expect(cipher == "chacha20")
    #expect(sqlite3_close_v2(db) == SQLITE_OK)
}
