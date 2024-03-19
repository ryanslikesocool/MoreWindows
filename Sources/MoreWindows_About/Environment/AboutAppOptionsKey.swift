import SwiftUI

private struct AboutWindowOptionsKey: EnvironmentKey {
	static let defaultValue: AboutWindowOptions = .default
}

extension EnvironmentValues {
	var aboutWindowOptions: AboutWindowOptions {
		get { self[AboutWindowOptionsKey.self] }
		set { self[AboutWindowOptionsKey.self] = newValue }
	}
}

public extension Scene {
	/// Set options pertaining to the About window.
	/// - Parameter options: The option flags to enable.
	func aboutWindowOptions(_ options: AboutWindowOptions) -> some Scene {
		environment(\.aboutWindowOptions, options)
	}
}
