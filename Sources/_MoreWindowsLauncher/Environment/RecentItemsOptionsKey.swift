import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``RecentItemsOptions``
	///   - ``SwiftUI/Scene/recentItemsOptions(_:)``
	fileprivate(set) var recentItemsOptions: RecentItemsOptions {
		get { self[__Key_recentItemsOptions.self] }
		set { self[__Key_recentItemsOptions.self] = newValue }
	}

	private struct __Key_recentItemsOptions: EnvironmentKey {
		static let defaultValue: RecentItemsOptions = .default
	}
}

public extension Scene {
	/// Set options pertaining to the launcher's recent items list.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``RecentItemsOptions``
	func recentItemsOptions(_ options: RecentItemsOptions) -> some Scene {
		environment(\.recentItemsOptions, options)
	}
}
