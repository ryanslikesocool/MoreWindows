#if canImport(AppKit)
import SwiftUI

private struct LauncherActionOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherActionOptions = .default
}

extension EnvironmentValues {
	var launcherActionOptions: LauncherActionOptions {
		get { self[LauncherActionOptionsKey.self] }
		set { self[LauncherActionOptionsKey.self] = newValue }
	}
}

public extension View {
	func launcherActionOptions(_ options: LauncherActionOptions) -> some View {
		environment(\.launcherActionOptions, options)
	}
}
#endif
