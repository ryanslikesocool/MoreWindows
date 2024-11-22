import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/View/appIconOptions(_:)``
	///   - ``SwiftUI/Scene/appIconOptions(_:)``
	@Entry
	fileprivate(set) var appIconOptions: AppIconOptions = .default
}

// MARK: - Convenience

public extension View {
	/// Set options pertaining to ``AppIconView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppIconOptions``
	///   - ``AppIconView``
	nonisolated func appIconOptions(_ options: AppIconOptions) -> some View {
		environment(\.appIconOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppIconView``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AppIconOptions``
	///   - ``AppIconView``
	nonisolated func appIconOptions(_ options: AppIconOptions) -> some Scene {
		environment(\.appIconOptions, options)
	}
}
