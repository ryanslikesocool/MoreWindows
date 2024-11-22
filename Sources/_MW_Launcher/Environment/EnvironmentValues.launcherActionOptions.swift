import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``LauncherActionOptions``
	///   - ``SwiftUI/View/launcherActionOptions(_:)``
	@Entry
	fileprivate(set) var launcherActionOptions: LauncherActionOptions = .default
}

// MARK: - Convenience

public extension View {
	/// Set options pertaining to the launcher action area.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``LauncherActionOptions``
	nonisolated func launcherActionOptions(_ options: LauncherActionOptions) -> some View {
		environment(\.launcherActionOptions, options)
	}
}
