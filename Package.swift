// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Note: Keep in sync with https://github.com/powersync-ja/powersync-kotlin/blob/main/plugins/build-plugin/src/main/kotlin/com/powersync/compile/ClangCompile.kt
let compileTimeOptions: [CSetting] = [
    .define("HAVE_GETHOSTUUID", to: "0"),
    .define("SQLITE_ENABLE_DBSTAT_VTAB"),
    .define("SQLITE_ENABLE_FTS5"),
    .define("SQLITE_ENABLE_SNAPSHOT"),
    .define("SQLITE_ENABLE_SESSION"),
    .define("SQLITE_ENABLE_PREUPDATE_HOOK")
]

let package = Package(
    name: "CSQLite",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "CSQLite",
            targets: ["CSQLite"]
        ),
        .library(
            name: "CSQLite3MultipleCiphers",
            targets: ["CSQLite3MultipleCiphers"],
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "CSQLite",
            cSettings: compileTimeOptions,
            linkerSettings: [
                .linkedLibrary("m")
            ]
        ),
        .target(
            name: "CSQLite3MultipleCiphers",
            cSettings: compileTimeOptions,
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
