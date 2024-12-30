import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/aboutWindowLayout(_:)``
	@Entry
	fileprivate(set) var aboutWindowLayout: AboutWindowLayout = .vertical
}

// MARK: - Convenience

public extension Scene {
	/// Set the layout style of an ``About`` window.
	///
	/// - SeeAlso:
	///   - ``AboutWindowLayout``
	///
	/// - Parameter layout: The layout to set in the environment.
	nonisolated func aboutWindowLayout(_ layout: AboutWindowLayout) -> some Scene {
		environment(\.aboutWindowLayout, layout)
	}
}
