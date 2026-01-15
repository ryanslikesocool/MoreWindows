import OSLog
import SwiftUI

private struct WindowButtonModifier: ViewModifier {
	/// The type of window button to apply the display mode to.
	private let buttonType: NSWindow.ButtonType

	/// The button mode to apply.
	private let mode: WindowButtonMode?

	/// - Parameters:
	///   - buttonType: The type of window button to apply the `mode` to.
	///   - mode: The button mode to apply.
	public nonisolated init(
		buttonType: NSWindow.ButtonType,
		mode: WindowButtonMode?
	) {
		self.buttonType = buttonType
		self.mode = mode
	}

	public func body(content: Content) -> some View {
		content
			.onWindowAppear(perform: applyWindowChanges)
	}
}

// MARK: - Functions

private extension WindowButtonModifier {
	func applyWindowChanges(nsWindow: NSWindow) {
		guard
			let mode,
			let button = nsWindow.standardWindowButton(buttonType)
		else {
			return
		}

		button.isEnabled = mode == .enabled
		button.isHidden = mode == .hidden
	}
}

// MARK: - Convenience

public extension View {
	/// Set the mode for a window button.
	///
	/// - Parameters:
	///   - buttonType: The type of window button to apply the `mode` to.
	///   - mode: The button mode to apply.
	///   A `nil` value indicates that the button mode should not be overriden.
	///
	/// ## See Also
	/// - ``WindowButtonMode``
	nonisolated func windowButton(
		_ buttonType: NSWindow.ButtonType,
		mode: WindowButtonMode?
	) -> some View {
		modifier(WindowButtonModifier(buttonType: buttonType, mode: mode))
	}

	/// Set the window button (traffic light) display modes.
	///
	/// - Important: If all values are set to ``WindowButtonMode/hidden``, you are responsible for handling actions like closing the window.
	///
	/// - Parameters:
	///   - close: The mode for the close (red x) button.
	///   A `nil` value indicates that the button mode should not be overriden.
	///   - miniaturize: The mode for the miniaturize (yellow minus) button.
	///   A `nil` value indicates that the button mode should not be overriden.
	///   - zoom: The mode for the zoom (green arrows) button.
	///   A `nil` value indicates that the button mode should not be overriden.
	///
	/// ## See Also
	/// - ``WindowButtonMode``
	nonisolated func windowButtons(
		close: WindowButtonMode? = nil,
		miniaturize: WindowButtonMode? = nil,
		zoom: WindowButtonMode? = nil
	) -> some View {
		// It's absurd that there's no way to make this a scene modifier.
		windowButton(.closeButton, mode: close)
			.windowButton(.miniaturizeButton, mode: miniaturize)
			.windowButton(.zoomButton, mode: zoom)
	}

	/// Set the window button (traffic light) interaction behaviors.
	///
	/// - Parameters:
	///   - close: The interaction behavior for the close (red x) button.
	///   - miniaturize: The interaction behavior for the miniaturize (yellow minus) button.
	///   - zoom: The interaction behavior for the zoom (green arrows) button.
	@available(macOS 15.0, *)
	nonisolated func windowButtons(
		close: WindowInteractionBehavior = .automatic,
		miniaturize: WindowInteractionBehavior = .automatic,
		zoom: WindowInteractionBehavior = .automatic
	) -> some View {
		windowDismissBehavior(close)
			.windowMinimizeBehavior(miniaturize)
			.windowResizeBehavior(zoom)
	}
}
