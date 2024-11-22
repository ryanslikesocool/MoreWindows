// swift-tools-version: 6.0

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
				"_MW_About",
				"_MW_Launcher",
			]
		),

		.target(
			name: "_MW_About",
			dependencies: [
				"_MW_Common",
			]
		),

		.target(
			name: "_MW_Launcher",
			dependencies: [
				"_MW_Common",
			]
		),

		.target(
			name: "_MW_Common"
		),
	]
)
