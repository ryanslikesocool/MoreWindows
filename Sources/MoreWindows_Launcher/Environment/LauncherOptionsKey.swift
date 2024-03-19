#if canImport(AppKit)
import SwiftUI

private struct LauncherOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherOptions = .default
}

extension EnvironmentValues {
	var launcherOptions: LauncherOptions {
		get { self[LauncherOptionsKey.self] }
		set { self[LauncherOptionsKey.self] = newValue }
	}
}

public extension Scene {
	func launcherOptions(_ options: LauncherOptions) -> some Scene {
		environment(\.launcherOptions, options)
	}
}
#endif
