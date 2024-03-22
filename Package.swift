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
				"MoreWindows_About",
				"MoreWindows_Launcher",
			]
		),
		
		.target(
			name: "MoreWindows_About",
			dependencies: [
				"_MoreWindowsCommon",
			]
		),

		.target(
			name: "MoreWindows_Launcher",
			dependencies: [
				"_MoreWindowsCommon",
			]
		),

		.target(name: "_MoreWindowsCommon"),
	]
)
