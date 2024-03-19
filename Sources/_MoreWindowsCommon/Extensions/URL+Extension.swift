import Foundation

public extension URL {
	var compressingTildeInPath: String {
		path(percentEncoded: false).replacing(reducedHomeDirectory.path(percentEncoded: false), with: "~")
	}

	/// Reduces the home directory returned from ``URL.homeDirectory`` from within the sandbox.
	var reducedHomeDirectory: URL {
		let path = URL.homeDirectory.path(percentEncoded: false).components(separatedBy: "/")[0 ..< 3].joined(separator: "/")
		return URL(string: path) ?? URL.homeDirectory
	}
}
