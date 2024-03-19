public struct RecentItemsOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

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

	/// Closes the launcher when selecting an item.
	static let closeWindow: Self = Self(rawValue: 1 << 4)

	static let `default`: Self = .all

	static let all: Self = [.searchable, .showIcon, .showURL, .draggable, .closeWindow]
}
