import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/recentItemsSearchFilter(_:)``
	@Entry
	fileprivate(set) var recentItemsSearchFilter: RecentItemsSearchFilter = .default
}

// MARK: - Convenience

public extension Scene {
	/// Customize the search filter for the recent items list.
	/// - Parameter predicate: The filter to use for each item.
	nonisolated func recentItemsSearchFilter(
		_ predicate: @escaping @Sendable (String, URL) -> Bool
	) -> some Scene {
		environment(\.recentItemsSearchFilter, RecentItemsSearchFilter(predicate))
	}
}
