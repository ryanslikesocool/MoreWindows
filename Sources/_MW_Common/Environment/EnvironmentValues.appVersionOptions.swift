import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/View/appVersionOptions(_:)``
	///   - ``SwiftUI/Scene/appVersionOptions(_:)``
	@Entry
	fileprivate(set) var appVersionOptions: AppVersionOptions = .default
}

// MARK: - Convenience

public extension View {
	/// Set options pertaining to ``AppVersionView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppVersionOptions``
	///   - ``AppVersionView``
	nonisolated func appVersionOptions(_ options: AppVersionOptions) -> some View {
		environment(\.appVersionOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppVersionView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppVersionOptions``
	///   - ``AppVersionView``
	nonisolated func appVersionOptions(_ options: AppVersionOptions) -> some Scene {
		environment(\.appVersionOptions, options)
	}
}
