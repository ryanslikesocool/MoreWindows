import SwiftUI

extension EnvironmentValues {
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/aboutWindowLayout(_:)``
	fileprivate(set) var aboutWindowLayout: AboutWindowLayout {
		get { self[__Key_aboutWindowLayout.self] }
		set { self[__Key_aboutWindowLayout.self] = newValue }
	}

	private struct __Key_aboutWindowLayout: EnvironmentKey {
		static let defaultValue: AboutWindowLayout = .vertical
	}
}

// MARK: - Convenience

public extension Scene {
	/// Set the layout style of an ``About`` window.
	/// - Parameter layout: The layout to set in the environment.
	/// - SeeAlso:
	///   - ``AboutWindowLayout``
	func aboutWindowLayout(_ layout: AboutWindowLayout) -> some Scene {
		environment(\.aboutWindowLayout, layout)
	}
}