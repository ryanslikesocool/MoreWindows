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
	///
	/// - SeeAlso:
	///   - ``AboutWindowOptions``
	///
	/// - Parameter options: The options to set in the environment.
	nonisolated func aboutWindowOptions(_ options: AboutWindowOptions) -> some Scene {
		environment(\.aboutWindowOptions, options)
	}
}
