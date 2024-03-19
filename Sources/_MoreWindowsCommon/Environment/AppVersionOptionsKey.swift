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

public extension Scene {
	func appVersionOptions(_ options: AppVersionOptions) -> some Scene {
		environment(\.appVersionOptions, options)
	}
}
