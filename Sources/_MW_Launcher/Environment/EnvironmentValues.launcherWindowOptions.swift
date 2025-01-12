import SwiftUI

extension EnvironmentValues {
	/// ## See Also
	/// - ``LauncherWindowOptions``
	/// - ``SwiftUI/Scene/launcherWindowOptions(_:)``
	@Entry
	fileprivate(set) var launcherWindowOptions: LauncherWindowOptions = .default
}

// MARK: - Convenience

public extension Scene {
	/// Set options pertaining to ``Launcher``.
	///
	/// ## See Also
	/// - ``LauncherWindowOptions``
	// - ``SwiftUICore/EnvironmentValues/launcherWindowOptions``
	///
	/// - Parameter options: The options to set in the environment.
	nonisolated func launcherWindowOptions(_ options: LauncherWindowOptions) -> some Scene {
		environment(\.launcherWindowOptions, options)
	}
}
