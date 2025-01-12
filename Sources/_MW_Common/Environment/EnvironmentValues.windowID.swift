import SwiftUI

public extension EnvironmentValues {
	/// The current `Window` ID.
	///
	/// - Remark: This value is only available if ``SwiftUI/Scene/windowID(_:)-5gt9k`` was used on the containing scene, or if a scene initializer that receives a ``WindowID`` was used.
	///
	/// ## See Also
	/// - ``SwiftUI/Scene/windowID(_:)-5gt9k``
	/// - ``SwiftUI/Scene/windowID(_:)-929hs``
	@Entry
	fileprivate(set) var windowID: WindowID? = nil
}

// MARK: - Convenience

public extension Scene {
	/// Expose a `Window`'s ID to the environment.
	///
	/// ## See Also
	/// - ``SwiftUICore/EnvironmentValues/windowID``
	/// - ``SwiftUI/Scene/windowID(_:)-929hs``
	///
	/// - Parameter id: The window's ID.
	nonisolated func windowID(
		_ id: WindowID
	) -> some Scene {
		environment(\.windowID, id)
	}

	/// Expose a `Window`'s ID to the environment.
	///
	/// ## See Also
	/// - ``SwiftUICore/EnvironmentValues/windowID``
	/// - ``SwiftUI/Scene/windowID(_:)-5gt9k``
	///
	/// - Parameter id: The window's ID.
	nonisolated func windowID<S>(
		_ id: S
	) -> some Scene where
		S: StringProtocol
	{
		windowID(WindowID(rawValue: id))
	}
}

extension View {
	/// Expose a `Window`'s ID to the environment.
	///
	/// ## See Also
	/// - ``SwiftUICore/EnvironmentValues/windowID``
	/// - ``SwiftUI/Scene/windowID(_:)-5gt9k``
	/// - ``SwiftUI/Scene/windowID(_:)-929hs``
	///
	/// - Parameter id: The window's ID.
	nonisolated func windowID(
		_ id: WindowID
	) -> some View {
		environment(\.windowID, id)
	}
}
