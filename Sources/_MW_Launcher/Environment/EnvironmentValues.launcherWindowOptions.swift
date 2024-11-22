import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``LauncherWindowOptions``
	///   - ``SwiftUI/Scene/launcherWindowOptions(_:)``
	@Entry
	fileprivate(set) var launcherWindowOptions: LauncherWindowOptions = .default
}

// MARK: - Convenience

public extension Scene {
	/// Set options pertaining to ``Launcher``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``LauncherWindowOptions``
	nonisolated func launcherWindowOptions(_ options: LauncherWindowOptions) -> some Scene {
		environment(\.launcherWindowOptions, options)
	}
}
