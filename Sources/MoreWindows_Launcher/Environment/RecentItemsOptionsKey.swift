#if canImport(AppKit)
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
	func recentItemsOptions(_ options: RecentItemsOptions) -> some Scene {
		environment(\.recentItemsOptions, options)
	}
}
#endif
