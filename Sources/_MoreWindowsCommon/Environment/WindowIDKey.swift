import SwiftUI

public extension EnvironmentValues {
	/// The current `Window` ID.
	/// - Remark: This value is only available if ``SwiftUI/Scene/windowID(_:)-7gcxi`` was used on the containing scene.
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/windowID(_:)-7gcxi``
	///   - ``SwiftUI/Scene/windowID(_:)-2v85t``
	fileprivate(set) var windowID: WindowID? {
		get { self[__Key_windowID.self] }
		set { self[__Key_windowID.self] = newValue }
	}

	private enum __Key_windowID: EnvironmentKey {
		static let defaultValue: WindowID? = nil
	}
}

public extension Scene {
	/// Expose a `Window`'s ID to the environment.
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/windowID(_:)-2v85t``
	/// - Parameter id: The window's ID.
	func windowID(_ id: WindowID) -> some Scene {
		environment(\.windowID, id)
	}

	/// Expose a `Window`'s ID to the environment.
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/windowID(_:)-7gcxi``
	/// - Parameter id: The window's ID.
	func windowID(_ id: some StringProtocol) -> some Scene {
		windowID(WindowID(rawValue: id))
	}
}
