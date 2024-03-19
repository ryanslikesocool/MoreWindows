#if canImport(AppKit)
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

public extension Scene {
	func appIconOptions(_ options: AppIconOptions) -> some Scene {
		environment(\.appIconOptions, options)
	}
}
#endif
