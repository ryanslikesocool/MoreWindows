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
	///
	/// - SeeAlso:
	///   - ``LauncherWindowOptions``
	///
	/// - Parameter options: The options to set in the environment.
	nonisolated func launcherWindowOptions(_ options: LauncherWindowOptions) -> some Scene {
		environment(\.launcherWindowOptions, options)
	}
}
