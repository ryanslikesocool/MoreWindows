import AppKit
import Foundation

package extension URL {
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
						"\(URL.cloudPath)/\(NSApplication.shared.bundleName)/"
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

	/// Is the URL in iCloud?
	var isInCloud: Bool { path(percentEncoded: false).contains(Self.cloudPath) }

	/// Converts the home directory from within the sandbox into a usable format.
	static var homePath: String {
		"/\(URL.homeDirectory.pathComponents[1 ..< 3].joined(separator: "/"))"
	}

	/// The iCloud directory.
	static var cloudPath: String {
		"Library/Mobile Documents/com~apple~CloudDocs"
	}
}
