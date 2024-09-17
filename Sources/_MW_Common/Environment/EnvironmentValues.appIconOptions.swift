import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/View/appIconOptions(_:)``
	///   - ``SwiftUI/Scene/appIconOptions(_:)``
	fileprivate(set) var appIconOptions: AppIconOptions {
		get { self[__Key_appIconOptions.self] }
		set { self[__Key_appIconOptions.self] = newValue }
	}

	private enum __Key_appIconOptions: EnvironmentKey {
		static let defaultValue: AppIconOptions = .default
	}
}

// MARK: - Convenience

public extension View {
	/// Set options pertaining to ``AppIconView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppIconOptions``
	///   - ``AppIconView``
	func appIconOptions(_ options: AppIconOptions) -> some View {
		environment(\.appIconOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppIconView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppIconOptions``
	///   - ``AppIconView``
	func appIconOptions(_ options: AppIconOptions) -> some Scene {
		environment(\.appIconOptions, options)
	}
}