import SwiftUI

private struct RecentItemsOptionsKey: EnvironmentKey {
	static let defaultValue: RecentItemsOptions = .default
}

extension EnvironmentValues {
	var recentItemsOptions: RecentItemsOptions {
		get { self[RecentItemsOptionsKey.self] }
		set { self[RecentItemsOptionsKey.self] = newValue }
	}
}

public extension Scene {
	/// Set options pertaining to the launcher's recent items list.
	/// - Parameter options: The options to set in the environment.
	func recentItemsOptions(_ options: RecentItemsOptions) -> some Scene {
		environment(\.recentItemsOptions, options)
	}
}
