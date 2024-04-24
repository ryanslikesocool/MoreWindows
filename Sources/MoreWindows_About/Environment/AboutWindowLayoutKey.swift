import SwiftUI

private struct AboutWindowLayoutKey: EnvironmentKey {
	static let defaultValue: AboutWindowLayout = .verticalList
}

extension EnvironmentValues {
	fileprivate(set) var aboutWindowLayout: AboutWindowLayout {
		get { self[AboutWindowLayoutKey.self] }
		set { self[AboutWindowLayoutKey.self] = newValue }
	}
}

public extension Scene {
	/// Set the layout style of an ``About`` window.
	/// - Parameter layout: The layout to set in the environment.
	func aboutWindowLayout(_ layout: AboutWindowLayout) -> some Scene {
		environment(\.aboutWindowLayout, layout)
	}
}
