import SwiftUI

extension EnvironmentValues {
	/// ## See Also:
	/// - ``SwiftUI/Scene/launcherWindowSize(welcomeAreaWidth:recentItemsAreaWidth:height:)``
	@Entry
	fileprivate(set) var launcherWindowSize: LauncherWindowSize = .default
}

// MARK: - Convenience

public extension Scene {
	/// Set the size of the launcher window.
	///
	/// ## See Also
	// - ``SwiftUICore/EnvironmentValues/launcherWindowSize``
	///
	/// - Parameters:
	///   - welcomeAreaWidth: The total width of the "welcome" area, containing app information and launcher actions.
	///   - recentItemsAreaWidth: The total width of the "recent items" area, containing items associated with the app that have been recently opened.
	///   - height: The total height of the window.
	nonisolated func launcherWindowSize(
		welcomeAreaWidth: Double? = nil,
		recentItemsAreaWidth: Double? = nil,
		height: Double? = nil
	) -> some Scene {
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
