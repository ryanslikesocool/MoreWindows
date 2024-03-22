import SwiftUI

private struct LauncherActionOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherActionOptions = .default
}

extension EnvironmentValues {
	var launcherActionOptions: LauncherActionOptions {
		get { self[LauncherActionOptionsKey.self] }
		set { self[LauncherActionOptionsKey.self] = newValue }
	}
}

public extension View {
	/// Set options pertaining to the primary launcher actions.
	/// - Parameter options: The options to set in the environment.
	func launcherActionOptions(_ options: LauncherActionOptions) -> some View {
		environment(\.launcherActionOptions, options)
	}
}
