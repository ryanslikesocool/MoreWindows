/// Options pertaining to the recent items list on the right side of the launcher.
///
/// ## Usage
/// 
/// ```swift
/// Launcher {
/// 	/* ... */
/// }
/// .recentItemsOptions(/* ... */) // <-- here!
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``searchable`` | Displays a search field for recent items. |
/// | ``showIcon`` | Shows the item's file icon. |
/// | ``showURL`` | Shows the item URL. |
/// | ``draggable`` | Allows items in the list to be dragged. |
/// | ``closeWindow`` | Closes the launcher upon selecting an item. |
///
/// - SeeAlso:
///   - ``Launcher``
///   - ``SwiftUI/Scene/recentItemsSearchFilter(_:)
///   - ``SwiftUI/Scene/recentItemsOptions(_:)``
@frozen
public struct RecentItemsOptions: OptionSet {
	public let rawValue: UInt64

	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension RecentItemsOptions: Sendable { }

// MARK: - Equatable

extension RecentItemsOptions: Equatable { }

// MARK: - Hashable

extension RecentItemsOptions: Hashable { }

// MARK: - Constants

public extension RecentItemsOptions {
	/// Displays a search field for recent items.
	static let searchable: Self = Self(rawValue: 1 << 0)

	/// Shows the item's file icon.
	static let showIcon: Self = Self(rawValue: 1 << 1)

	/// Shows the item URL.
	static let showURL: Self = Self(rawValue: 1 << 2)

	/// Allows items in the list to be dragged.
	static let draggable: Self = Self(rawValue: 1 << 3)

	/// Closes the launcher upon selecting an item.
	static let closeWindow: Self = Self(rawValue: 1 << 4)

	/// The default options used.
	static let `default`: Self = .all

	/// No options.
	static let none: Self = []

	/// All available options.
	static let all: Self = [.searchable, .showIcon, .showURL, .draggable, .closeWindow]
}
