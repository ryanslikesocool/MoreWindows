import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/aboutWindowOptions(_:)``
	@Entry
	fileprivate(set) var aboutWindowOptions: AboutWindowOptions = .default
}

// MARK: - Convenience

public extension Scene {
	/// Set options pertaining to ``About``.
	/// - Parameter options: The options to set in the environment.
	/// - SeeAlso:
	///   - ``AboutWindowOptions``
	nonisolated func aboutWindowOptions(_ options: AboutWindowOptions) -> some Scene {
		environment(\.aboutWindowOptions, options)
	}
}
