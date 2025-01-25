/// Modes for standard window buttons (traffic lights).
///
/// ## Topics
/// ### Modifiers
/// - ``SwiftUICore/View/windowButtons(close:miniaturize:zoom:)``
public enum WindowButtonMode {
	/// Indicates that a window button is visible and interactive.
	@available(macOS, introduced: 13.0, deprecated: 15.0, message: "Use `SwiftUI.WindowInteractionBehavior.enabled` instead.")
	case enabled

	/// Indicates that a window button is visible, but not interactive.
	@available(macOS, introduced: 13.0, deprecated: 15.0, message: "Use `SwiftUI.WindowInteractionBehavior.disabled` instead.")
	case disabled

	/// Indicates that a window button is not visible.
	case hidden
}

// MARK: - Sendable

extension WindowButtonMode: Sendable { }

// MARK: - Equatable

extension WindowButtonMode: Equatable { }

// MARK: - Hashable

extension WindowButtonMode: Hashable { }
