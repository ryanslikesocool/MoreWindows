import SwiftUI

@available(macOS 14, *)
private struct LauncherIconOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherIconOptions = .default
}

@available(macOS 14, *)
extension EnvironmentValues {
	var launcherIconOptions: LauncherIconOptions {
		get { self[LauncherIconOptionsKey.self] }
		set { self[LauncherIconOptionsKey.self] = newValue }
	}
}

@available(macOS 14, *)
public extension Scene {
	func launcherIconOptions(_ options: LauncherIconOptions) -> some Scene {
		environment(\.launcherIconOptions, options)
	}
}
