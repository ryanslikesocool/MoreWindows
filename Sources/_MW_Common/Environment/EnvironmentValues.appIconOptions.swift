import SwiftUI

extension EnvironmentValues {
	/// ## See Also
	/// - ``SwiftUICore/View/appIconOptions(_:)``
	/// - ``SwiftUI/Scene/appIconOptions(_:)``
	@Entry
	fileprivate(set) var appIconOptions: AppIconOptions = .default
}

// MARK: - Convenience

public extension View {
	/// Set options pertaining to ``AppIconView``.
	///
	/// ## See Also
	/// - ``AppIconOptions``
	/// - ``AppIconView``
	///
	/// - Parameter options: The options to set in the environment.
	nonisolated func appIconOptions(_ options: AppIconOptions) -> some View {
		environment(\.appIconOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppIconView``.
	///
	/// ## See Also
	/// - ``AppIconOptions``
	/// - ``AppIconView``
	///
	/// - Parameter options: The options to set in the environment.
	nonisolated func appIconOptions(_ options: AppIconOptions) -> some Scene {
		environment(\.appIconOptions, options)
	}
}
