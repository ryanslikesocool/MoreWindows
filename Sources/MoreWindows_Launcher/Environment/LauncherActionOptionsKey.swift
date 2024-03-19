import SwiftUI

@available(macOS 14, *)
private struct LauncherActionOptionsKey: EnvironmentKey {
	static let defaultValue: LauncherActionOptions = .default
}

@available(macOS 14, *)
extension EnvironmentValues {
	var launcherActionOptions: LauncherActionOptions {
		get { self[LauncherActionOptionsKey.self] }
		set { self[LauncherActionOptionsKey.self] = newValue }
	}
}

@available(macOS 14, *)
public extension View {
	func launcherActionOptions(_ options: LauncherActionOptions) -> some View {
		environment(\.launcherActionOptions, options)
	}
}
