import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/aboutWindowOptions(_:)``
	fileprivate(set) var aboutWindowOptions: AboutWindowOptions {
		get { self[__Key_aboutWindowOptions.self] }
		set { self[__Key_aboutWindowOptions.self] = newValue }
	}

	private struct __Key_aboutWindowOptions: EnvironmentKey {
		static let defaultValue: AboutWindowOptions = .default
	}
}

public extension Scene {
	/// Set options pertaining to ``About``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AboutWindowOptions``
	func aboutWindowOptions(_ options: AboutWindowOptions) -> some Scene {
		environment(\.aboutWindowOptions, options)
	}
}
