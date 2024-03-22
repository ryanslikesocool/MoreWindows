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
	/// Set options pertaining to ``About``.
	/// - Parameter options: The options to set in the environment.
	func aboutWindowOptions(_ options: AboutWindowOptions) -> some Scene {
		environment(\.aboutWindowOptions, options)
	}
}
