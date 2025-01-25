import AppKit
import SwiftUI

private struct WindowIsMovableByBackgroundModifier: ViewModifier {
	private let state: Bool

	nonisolated public init(state: Bool) {
		self.state = state
	}

	public func body(content: Content) -> some View {
		content
			.onWindowAppear(perform: applyWindowChanges)
	}
}

// MARK: - Functions

private extension WindowIsMovableByBackgroundModifier {
	func applyWindowChanges(nsWindow: NSWindow) {
		nsWindow.isMovableByWindowBackground = state
	}
}

// MARK: - Convenience

public extension View {
	/// Indicate if the window can be moved by the user by dragging on the background of the window.
	@available(macOS, introduced: 13.0, deprecated: 15.0, message: "Use the `.windowBackgroundDragBehavior(_:)` modifier on the enclosing `Scene` instead.")
	nonisolated func windowIsMovableByBackground(
		_ state: Bool = true
	) -> some View {
		modifier(WindowIsMovableByBackgroundModifier(state: state))
	}
}
