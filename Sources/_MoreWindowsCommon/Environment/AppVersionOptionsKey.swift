import SwiftUI

private struct AppVersionOptionsKey: EnvironmentKey {
	static let defaultValue: AppVersionOptions = .default
}

extension EnvironmentValues {
	var appVersionOptions: AppVersionOptions {
		get { self[AppVersionOptionsKey.self] }
		set { self[AppVersionOptionsKey.self] = newValue }
	}
}

public extension View {
	/// Set options pertaining to ``AppVersionView``.
	/// - Parameter options: The options to set in the environment.
	func appVersionOptions(_ options: AppVersionOptions) -> some View {
		environment(\.appVersionOptions, options)
	}
}

public extension Scene {
	/// Set options pertaining to ``AppVersionView``.
	/// - Parameter options: The options to set in the environment.
	func appVersionOptions(_ options: AppVersionOptions) -> some Scene {
		environment(\.appVersionOptions, options)
	}
}
