// swift-tools-version: 6.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CSQLite",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CSQLite",
            targets: ["CSQLite"]
        ),
    ],
    traits: [
        .trait(name: "Encryption"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CSQLite",
            exclude: ["_sqlite", "_sqlite3mc"],
            cSettings: [
                // Note: Keep in sync with https://github.com/powersync-ja/powersync-kotlin/blob/main/plugins/build-plugin/src/main/kotlin/com/powersync/compile/ClangCompile.kt
                .define("HAVE_GETHOSTUUID", to: "0"),
                .define("SQLITE_ENABLE_DBSTAT_VTAB"),
                .define("SQLITE_ENABLE_FTS5"),
                .define("SQLITE_ENABLE_SNAPSHOT"),
                .define("SQLITE_ENABLE_SESSION"),
                .define("SQLITE_ENABLE_PREUPDATE_HOOK"),
                
                .define("USE_SQLITE3MC", .when(traits: ["Encryption"]))
            ],
            linkerSettings: [
                .linkedLibrary("m")
            ]
        ),
        .testTarget(
            name: "CSQLiteTests",
            dependencies: ["CSQLite"]
        ),
    ]
)
