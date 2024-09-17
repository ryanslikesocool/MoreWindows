/// Options pertaining to ``Launcher``.
///
/// ## Usage
/// ```swift
/// Launcher {
/// 	/* ... */
/// }
/// .launcherWindowOptions(/* ... */)  // <-- here!
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``showIcon`` | Displays the app icon. |
/// | ``showName`` | Displays the app name. |
/// | ``showVersion`` | Displays the current app version. |
/// | ``showRecentDocuments`` | Adds a list with recent documents. |
/// | ``addMenuItem`` | Adds a menu item to open the launcher. |
///
/// - SeeAlso:
///   - ``Launcher``
///   - ``SwiftUI/Scene/launcherWindowOptions(_:)``
@frozen
public struct LauncherWindowOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension LauncherWindowOptions: Sendable { }

// MARK: - Equatable

extension LauncherWindowOptions: Equatable { }

// MARK: - Hashable

extension LauncherWindowOptions: Hashable { }

// MARK: - Constants

public extension LauncherWindowOptions {
	/// Displays the app icon.
	static let showIcon: Self = Self(rawValue: 1 << 0)

	/// Displays the app name.
	static let showName: Self = Self(rawValue: 1 << 1)

	/// Displays the current app version.
	static let showVersion: Self = Self(rawValue: 1 << 2)

	/// Adds a list with recent documents.
	/// - SeeAlso:
	///   - ``RecentItemsOptions``
	static let showRecentDocuments: Self = Self(rawValue: 1 << 3)

	/// Adds a menu item to open the launcher.
	static let addMenuItem: Self = Self(rawValue: 1 << 4)

	/// Only options pertaining to the "welcome" area of the launcher.
	static let welcome: Self = [.showIcon, .showName, .showVersion]

	/// The default options used.
	static let `default`: Self = .all

	/// No options.
	static let none: Self = []

	/// All available options.
	static let all: Self = [.showIcon, .showName, .showVersion, .showRecentDocuments, .addMenuItem]
}