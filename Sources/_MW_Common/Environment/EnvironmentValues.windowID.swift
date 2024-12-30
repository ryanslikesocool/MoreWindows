import SwiftUI

public extension EnvironmentValues {
	/// The current `Window` ID.
	///
	/// - Remark: This value is only available if ``SwiftUI/Scene/windowID(_:)-7gcxi`` was used on the containing scene.
	///
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/windowID(_:)-7gcxi``
	///   - ``SwiftUI/Scene/windowID(_:)-2v85t``
	@Entry
	fileprivate(set) var windowID: WindowID? = nil
}

// MARK: - Convenience

public extension Scene {
	/// Expose a `Window`'s ID to the environment.
	///
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/windowID(_:)-2v85t``
	///
	/// - Parameter id: The window's ID.
	nonisolated func windowID(_ id: WindowID) -> some Scene {
		environment(\.windowID, id)
	}

	/// Expose a `Window`'s ID to the environment.
	///
	/// - SeeAlso:
	///   - ``SwiftUI/Scene/windowID(_:)-7gcxi``
	///   
	/// - Parameter id: The window's ID.
	nonisolated func windowID<S>(_ id: S) -> some Scene where
		S: StringProtocol
	{
		windowID(WindowID(rawValue: id))
	}
}
