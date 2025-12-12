import Testing
@testable import CSQLite

@Test func smoke_test() throws {
    var db: OpaquePointer?
    #expect(sqlite3_open_v2(":memory:", &db, SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE, nil) == SQLITE_OK)
    #expect(sqlite3_close_v2(db) == SQLITE_OK)
    // Write your test here and use APIs like `#expect(...)` to check expected conditions.
}
