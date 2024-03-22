import SwiftUI

private struct LauncherWindowOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherWindowOptions = .default
}

extension EnvironmentValues {
	var launcherWindowOptions: LauncherWindowOptions {
		get { self[LauncherWindowOptionsKey.self] }
		set { self[LauncherWindowOptionsKey.self] = newValue }
	}
}

public extension Scene {
	/// Set options pertaining to ``Launcher``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``LauncherWindowOptions``
	func launcherWindowOptions(_ options: LauncherWindowOptions) -> some Scene {
		environment(\.launcherWindowOptions, options)
	}
}
