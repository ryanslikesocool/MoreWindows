import Foundation

public extension URL {
	func path(percentEncoded: Bool = false, options: PathReductionOption...) -> String {
		path(percentEncoded: percentEncoded, options: options)
	}

	func path(percentEncoded: Bool = false, options: some Sequence<PathReductionOption>) -> String {
		var result: String = path(percentEncoded: percentEncoded)

		for option in options {
			switch option {
				case let .home(mode):
					let pattern: String = URL.homePath
					let insert: String = switch mode {
						case .abbreviate: "~"
						case .remove: ""
					}
					result.replace(pattern, with: insert)
				case let .cloud(mode, removeAppName):
					let pattern: String = if removeAppName {
						"\(URL.cloudPath)/\(AppInformation.appName)/"
					} else {
						URL.cloudPath
					}
					let insert: String = switch mode {
						case .abbreviate: "iCloud"
						case .remove: ""
					}
					result.replace(pattern, with: insert)
			}
		}

		return result
	}

//	func reducePath(useTilde: Bool = true, useAppNameInCloud: Bool, useCloud: Bool = true) -> String {
//		path(percentEncoded: false)
//			.replacing(URL.cloudPath, with: useCloud ? "iCloud/" : "")
//			.replacing(URL.homePath, with: useTilde ? "~" : "")
//	}

	var isInCloud: Bool { path(percentEncoded: false).contains(Self.cloudPath) }

	/// Reduces the home directory from within the sandbox into a usable format.
	static var homePath: String {
		"/\(URL.homeDirectory.pathComponents[1 ..< 3].joined(separator: "/"))"
	}

	/// The iCloud directory.
	static var cloudPath: String {
		"Library/Mobile Documents/com~apple~CloudDocs"
	}
}

public enum PathReductionOption {
	/// The user's home directory.
	case home(mode: PathReductionMode)

	/// The user's iCloud directory.
	case cloud(mode: PathReductionMode, removeAppName: Bool)
}

public enum PathReductionMode {
	/// Abbreviate the pattern
	case abbreviate
	/// Remove the pattern.
	case remove
}
