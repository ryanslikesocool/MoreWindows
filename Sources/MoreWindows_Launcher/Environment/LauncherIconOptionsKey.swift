#if canImport(AppKit)
import SwiftUI

private struct LauncherIconOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherIconOptions = .default
}

extension EnvironmentValues {
	var launcherIconOptions: LauncherIconOptions {
		get { self[LauncherIconOptionsKey.self] }
		set { self[LauncherIconOptionsKey.self] = newValue }
	}
}

public extension Scene {
	func launcherIconOptions(_ options: LauncherIconOptions) -> some Scene {
		environment(\.launcherIconOptions, options)
	}
}
#endif
