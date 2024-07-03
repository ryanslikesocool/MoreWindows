import OSLog
import SwiftUI

struct WindowButtonsModifier: ViewModifier {
	private let close: WindowButtonMode?
	private let miniaturize: WindowButtonMode?
	private let zoom: WindowButtonMode?

	fileprivate init(
		close: WindowButtonMode?,
		miniaturize: WindowButtonMode?,
		zoom: WindowButtonMode?
	) {
		self.close = close
		self.miniaturize = miniaturize
		self.zoom = zoom
	}

	func body(content: Content) -> some View {
		content
			.onWindowAppear(perform: applyWindowButtons)
	}

	private func applyWindowButtons(nsWindow: NSWindow) {
		applyMode(close, to: .closeButton, in: nsWindow)
		applyMode(miniaturize, to: .miniaturizeButton, in: nsWindow)
		applyMode(zoom, to: .zoomButton, in: nsWindow)

		func applyMode(_ mode: WindowButtonMode?, to button: NSWindow.ButtonType, in window: NSWindow) {
			guard
				let mode,
				let button = window.standardWindowButton(button)
			else {
				return
			}

			button.isEnabled = mode == .enabled
			button.isHidden = mode == .hidden
		}
	}
}

// MARK: - View +

public extension View {
	/// Set the window button (traffic light) display modes.
	/// - Important: If all values are set to ``WindowButtonMode/hidden``, the developer is responsible for handling actions like closing the window.
	/// - Parameters:
	///   - close: The display mode for the close (red x) button.
	///   - miniaturize: The display mode for the miniaturize (yellow minus) button.
	///   - zoom: The display mode for the zoom (green arrows) button.
	/// - SeeAlso:
	///   - ``WindowButtonMode``
	func windowButtons(
		close: WindowButtonMode? = nil,
		miniaturize: WindowButtonMode? = nil,
		zoom: WindowButtonMode? = nil
	) -> some View {
		modifier(WindowButtonsModifier(close: close, miniaturize: miniaturize, zoom: zoom))
	}
}
