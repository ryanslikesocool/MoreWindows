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
				"_MoreWindowsAbout",
				"_MoreWindowsLauncher",
			]
		),

		.target(
			name: "_MoreWindowsAbout",
			dependencies: [
				"_MoreWindowsCommon",
			]
		),

		.target(
			name: "_MoreWindowsLauncher",
			dependencies: [
				"_MoreWindowsCommon",
			]
		),

		.target(name: "_MoreWindowsCommon"),
	]
)
