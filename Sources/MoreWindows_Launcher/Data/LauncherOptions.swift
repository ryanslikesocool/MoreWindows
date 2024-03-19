#if canImport(AppKit)
@available(macOS 14, *)
public struct LauncherOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

@available(macOS 14, *)
public extension LauncherOptions {
	/// Displays the app icon.
	static let icon: Self = Self(rawValue: 1 << 0)

	/// Displays the app name.
	static let name: Self = Self(rawValue: 1 << 2)

	/// Displays the current app version.
	static let version: Self = Self(rawValue: 1 << 3)

	/// Adds a list with recent documents.
	static let recentDocuments: Self = Self(rawValue: 1 << 4)

	/// Adds a search field for the recent documents list.  This requires that ``recentDocuments`` is enabled.
	static let searchRecentDocuments: Self = Self(rawValue: 1 << 5)

	/// Adds a menu item to open the launcher.
	static let menuItem: Self = Self(rawValue: 1 << 6)

	/// The default options.
	static let `default`: Self = [.icon, .name, .version, .recentDocuments, .searchRecentDocuments, .menuItem]

	static let none: Self = []
	static let all: Self = [.icon, .name, .version, .recentDocuments, .searchRecentDocuments, .menuItem]
}
#endif
