import OSLog
import SwiftUI

struct WindowButtonsModifier: ViewModifier {
	@Environment(\.windowID) private var windowID

	private let close: WindowButtonMode
	private let miniaturize: WindowButtonMode
	private let zoom: WindowButtonMode

	fileprivate init(
		close: WindowButtonMode,
		miniaturize: WindowButtonMode,
		zoom: WindowButtonMode
	) {
		self.close = close
		self.miniaturize = miniaturize
		self.zoom = zoom
	}

	func body(content: Content) -> some View {
		content
			.onAppear(perform: applyWindowButtons)
	}

	private func applyWindowButtons() {
		DispatchQueue.main.async {
			guard let windowID else {
				Logger.module.warning("The environment value `windowID` was not defined.  The window button modes cannot be applied.")
				return
			}
			guard let nsWindow = NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == windowID }) else {
				Logger.module.warning("Failed to find NSWindow with ID \(windowID).  The window button modes cannot be applied.")
				return
			}

			applyMode(close, to: .closeButton, in: nsWindow)
			applyMode(miniaturize, to: .miniaturizeButton, in: nsWindow)
			applyMode(zoom, to: .zoomButton, in: nsWindow)
		}

		func applyMode(_ mode: WindowButtonMode, to button: NSWindow.ButtonType, in window: NSWindow) {
			guard let button = window.standardWindowButton(button) else {
				return
			}

			button.isEnabled = mode.isEnabled
			button.isHidden = mode.isHidden
		}
	}
}

// MARK: - View +

public extension View {
	/// Set the window button (traffic light) display modes.
	/// - Remark: If all values are set to ``WindowButtonMode/hidden``, the developer is responsible for handling actions like closing the window.
	/// - Parameters:
	///   - close: The display mode for the close (red x) button.
	///   - miniaturize: The display mode for the miniaturize (yellow minus) button.
	///   - zoom: The display mode for the zoom (green arrows) button.
	/// - SeeAlso:
	///   - ``WindowButtonMode``
	func windowButtons(
		close: WindowButtonMode = .enabled,
		miniaturize: WindowButtonMode = .enabled,
		zoom: WindowButtonMode = .enabled
	) -> some View {
		modifier(WindowButtonsModifier(close: close, miniaturize: miniaturize, zoom: zoom))
	}
}
