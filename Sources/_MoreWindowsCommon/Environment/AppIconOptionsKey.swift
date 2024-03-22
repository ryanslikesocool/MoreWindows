import SwiftUI

private struct AppIconOptionsKey: EnvironmentKey {
	static let defaultValue: AppIconOptions = .default
}

extension EnvironmentValues {
	var appIconOptions: AppIconOptions {
		get { self[AppIconOptionsKey.self] }
		set { self[AppIconOptionsKey.self] = newValue }
	}
}

public extension View {
	/// Set options pertaining to ``AppIconView``.
	/// - Parameter options: The options to set in the environment.
	func appIconOptions(_ options: AppIconOptions) -> some View {
		environment(\.appIconOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppIconView``.
	/// - Parameter options: The options to set in the environment.
	func appIconOptions(_ options: AppIconOptions) -> some Scene {
		environment(\.appIconOptions, options)
	}
}
