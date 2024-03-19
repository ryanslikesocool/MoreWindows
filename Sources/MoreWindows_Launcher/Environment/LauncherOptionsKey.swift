import SwiftUI

@available(macOS 14, *)
private struct LauncherOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherOptions = .default
}

@available(macOS 14, *)
extension EnvironmentValues {
	var launcherOptions: LauncherOptions {
		get { self[LauncherOptionsKey.self] }
		set { self[LauncherOptionsKey.self] = newValue }
	}
}

@available(macOS 14, *)
public extension Scene {
	func launcherOptions(_ options: LauncherOptions) -> some Scene {
		environment(\.launcherOptions, options)
	}
}
