import SwiftUI

private struct LauncherActionOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherActionOptions = .default
}

extension EnvironmentValues {
	fileprivate(set) var launcherActionOptions: LauncherActionOptions {
		get { self[LauncherActionOptionsKey.self] }
		set { self[LauncherActionOptionsKey.self] = newValue }
	}
}

public extension View {
	/// Set options pertaining to the launcher action area.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``LauncherActionOptions``
	func launcherActionOptions(_ options: LauncherActionOptions) -> some View {
		environment(\.launcherActionOptions, options)
	}
}
