import SwiftUI

public struct _WindowIDViewModifier: ViewModifier {
	private let id: WindowID

	/// Expose a window's ID to the environment.
	///
	/// - Parameters:
	///   - id: The window's ID.
	nonisolated init(_ id: WindowID) {
		self.id = id
	}

	public func body(content: Content) -> some View {
		content
			.windowID(id)
	}
}

// MARK: - Convenience

extension View {
	/// Expose a window's ID to the environment.
	///
	/// ## See Also
	/// - ``SwiftUICore/EnvironmentValues/windowID``
	/// - ``SwiftUI/Scene/windowID(_:)-7gcxi``
	/// - ``SwiftUI/Scene/windowID(_:)-2v85t``
	///
	/// - Parameter id: The window's ID.
	nonisolated func _windowID(
		_ id: WindowID
	) -> ModifiedContent<Self, _WindowIDViewModifier> {
		modifier(_WindowIDViewModifier(id))
	}
}
