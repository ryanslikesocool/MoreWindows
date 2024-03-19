// swift-tools-version: 5.9

import PackageDescription

let package = Package(
	name: "MoreWindows",
	defaultLocalization: "en",
	platforms: [
		.macOS(.v13),
		.iOS(.v16),
	],
	products: [
		.library(
			name: "MoreWindows",
			targets: [
				"MoreWindows_About",
				"MoreWindows_Launcher",
				"MoreWindows_Settings",
			]
		),
	],
	dependencies: [
		.package(url: "https://github.com/ryanslikesocool/MoreViews.git", branch: "main"),
	],
	targets: [
		.target(
			name: "MoreWindows_Launcher",
			dependencies: [
				"MoreViews",
			]
		),

		.target(
			name: "MoreWindows_Settings",
			dependencies: [
				"MoreViews",
			]
		),

		.target(
			name: "MoreWindows_About",
			dependencies: [
				"MoreViews",
			]
		),
	]
)
