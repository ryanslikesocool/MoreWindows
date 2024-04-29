import SwiftUI

private enum WindowIDKey: EnvironmentKey {
	static var defaultValue: String? = nil
}

public extension EnvironmentValues {
	/// The ID of the current `Window`.
	fileprivate(set) var windowID: String? {
		get { self[WindowIDKey.self] }
		set { self[WindowIDKey.self] = newValue }
	}
}

public extension Scene {
	/// Expose a `Window`'s ID to the environment.
	/// - Parameter id: The window's ID.
	func windowID(_ id: String) -> some Scene {
		environment(\.windowID, id)
	}
}
