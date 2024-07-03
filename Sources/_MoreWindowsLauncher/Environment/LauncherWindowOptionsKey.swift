import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``LauncherWindowOptions``
	///   - ``SwiftUI/Scene/launcherWindowOptions(_:)``
	fileprivate(set) var launcherWindowOptions: LauncherWindowOptions {
		get { self[__Key_launcherWindowOptions.self] }
		set { self[__Key_launcherWindowOptions.self] = newValue }
	}

	private struct __Key_launcherWindowOptions: EnvironmentKey {
		static let defaultValue: LauncherWindowOptions = .default
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
