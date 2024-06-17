import SwiftUI

private enum AppVersionOptionsKey: EnvironmentKey {
	static let defaultValue: AppVersionOptions = .default
}

extension EnvironmentValues {
	fileprivate(set) var appVersionOptions: AppVersionOptions {
		get { self[AppVersionOptionsKey.self] }
		set { self[AppVersionOptionsKey.self] = newValue }
	}
}

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
