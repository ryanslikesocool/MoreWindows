import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/recentItemsSearchFilter(_:)``
	fileprivate(set) var recentItemsSearchFilter: RecentItemsSearchFilter {
		get { self[__Key_recentItemsSearchFilter.self] }
		set { self[__Key_recentItemsSearchFilter.self] = newValue }
	}

	private struct __Key_recentItemsSearchFilter: EnvironmentKey {
		static let defaultValue: RecentItemsSearchFilter = .default
	}
}

// MARK: - Convenience

public extension Scene {
	/// Customize the search filter for the recent items list.
	/// - Parameter predicate: The filter to use for each item.
	func recentItemsSearchFilter(_ predicate: @escaping (String, URL) -> Bool) -> some Scene {
		environment(\.recentItemsSearchFilter, RecentItemsSearchFilter(predicate))
	}
}