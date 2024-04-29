// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "MoreWindows",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v13),
	],
	products: [
		.library(
			name: "MoreWindows",
			targets: ["MoreWindows"]
		),
	],
	targets: [
		.target(
			name: "MoreWindows",
			dependencies: [
				"_MoreWindows_About",
				"_MoreWindows_Launcher",
			]
		),

		.target(
			name: "_MoreWindows_About",
			dependencies: [
				"_MoreWindowsCommon",
			]
		),

		.target(
			name: "_MoreWindows_Launcher",
			dependencies: [
				"_MoreWindowsCommon",
			]
		),

		.target(name: "_MoreWindowsCommon"),
	]
)
