import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``RecentItemsOptions``
	///   - ``SwiftUI/Scene/recentItemsOptions(_:)``
	@Entry
	fileprivate(set) var recentItemsOptions: RecentItemsOptions = .default
}

// MARK: - Convenience

public extension Scene {
	/// Set options pertaining to the launcher's recent items list.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``RecentItemsOptions``
	nonisolated func recentItemsOptions(_ options: RecentItemsOptions) -> some Scene {
		environment(\.recentItemsOptions, options)
	}
}
