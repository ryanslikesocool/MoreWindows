import SwiftUI

extension EnvironmentValues {
	/// ## See Also
	/// - ``RecentItemsOptions``
	/// - ``SwiftUI/Scene/recentItemsOptions(_:)``
	@Entry
	fileprivate(set) var recentItemsOptions: RecentItemsOptions = .default
}

// MARK: - Convenience

public extension Scene {
	/// Set options pertaining to the launcher's recent items list.
	///
	/// ## See Also
	/// - ``RecentItemsOptions``
	// - ``SwiftUICore/EnvironmentValues/recentItemsOptions``
	///
	/// - Parameter options: The options to set in the environment.
	nonisolated func recentItemsOptions(_ options: RecentItemsOptions) -> some Scene {
		environment(\.recentItemsOptions, options)
	}
}
