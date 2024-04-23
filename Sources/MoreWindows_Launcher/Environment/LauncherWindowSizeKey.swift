import SwiftUI

private struct LauncherWindowSizeKey: EnvironmentKey {
	static let defaultValue: LauncherWindowSize = .default
}

extension EnvironmentValues {
	fileprivate(set) var launcherWindowSize: LauncherWindowSize {
		get { self[LauncherWindowSizeKey.self] }
		set { self[LauncherWindowSizeKey.self] = newValue }
	}
}

public extension Scene {
	/// Set the size of the launcher window.
	/// - Parameters:
	///   - welcomeAreaWidth: The total width of the "welcome" area, containing app information and launcher actions.
	///   - recentItemsAreaWidth: The total width of the "recent items" area, containing items associated with the app that have been recently opened.
	///   - height: The total height of the window.
	func launcherWindowSize(welcomeAreaWidth: Double? = nil, recentItemsAreaWidth: Double? = nil, height: Double? = nil) -> some Scene {
		environment(
			\.launcherWindowSize,
			LauncherWindowSize(
				welcomeAreaWidth: welcomeAreaWidth ?? LauncherWindowSize.default.welcomeAreaWidth,
				recentItemsAreaWidth: recentItemsAreaWidth ?? LauncherWindowSize.default.recentItemsAreaWidth,
				height: height ?? LauncherWindowSize.default.height
			)
		)
	}
}
