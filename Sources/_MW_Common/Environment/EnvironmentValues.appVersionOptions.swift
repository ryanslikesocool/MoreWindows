import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/View/appVersionOptions(_:)``
	///   - ``SwiftUI/Scene/appVersionOptions(_:)``
	fileprivate(set) var appVersionOptions: AppVersionOptions {
		get { self[__Key_appVersionOptions.self] }
		set { self[__Key_appVersionOptions.self] = newValue }
	}

	private enum __Key_appVersionOptions: EnvironmentKey {
		static let defaultValue: AppVersionOptions = .default
	}
}

// MARK: - Convenience

public extension View {
	/// Set options pertaining to ``AppVersionView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppVersionOptions``
	///   - ``AppVersionView``
	func appVersionOptions(_ options: AppVersionOptions) -> some View {
		environment(\.appVersionOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppVersionView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppVersionOptions``
	///   - ``AppVersionView``
	func appVersionOptions(_ options: AppVersionOptions) -> some Scene {
		environment(\.appVersionOptions, options)
	}
}