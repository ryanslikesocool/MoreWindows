#if canImport(AppKit)
public struct LauncherOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension LauncherOptions {
	/// Displays the app icon.
	static let showIcon: Self = Self(rawValue: 1 << 0)

	/// Displays the app name.
	static let showName: Self = Self(rawValue: 1 << 1)

	/// Displays the current app version.
	static let showVersion: Self = Self(rawValue: 1 << 2)

	/// Adds a list with recent documents.
	static let showRecentDocuments: Self = Self(rawValue: 1 << 3)

	/// Adds a menu item to open the launcher.
	static let addMenuItem: Self = Self(rawValue: 1 << 4)

	/// The default options.
	static let `default`: Self = .all

	/// Only options pertaining to the "welcome" area of the launcher.
	static let welcomeOnly: Self = [.showIcon, .showName, .showVersion]

	static let none: Self = []
	static let all: Self = [.showIcon, .showName, .showVersion, .showRecentDocuments, .addMenuItem]
}
#endif
