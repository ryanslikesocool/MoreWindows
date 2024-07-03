import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``LauncherActionOptions``
	///   - ``SwiftUI/View/launcherActionOptions(_:)``
	fileprivate(set) var launcherActionOptions: LauncherActionOptions {
		get { self[__Key_launcherActionOptions.self] }
		set { self[__Key_launcherActionOptions.self] = newValue }
	}

	private struct __Key_launcherActionOptions: EnvironmentKey {
		static let defaultValue: LauncherActionOptions = .default
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
