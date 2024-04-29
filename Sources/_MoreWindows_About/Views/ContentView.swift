import _MoreWindowsCommon
import OSLog
import SwiftUI

struct ContentView<Content: View>: View {
	@Environment(\.windowID) private var windowID
	@Environment(\.aboutWindowLayout) private var aboutWindowLayout

	let content: () -> Content

	var body: some View {
		Group {
			switch aboutWindowLayout {
				case .custom: content()
				case .vertical: VerticalContentView(content: content)
			}
		}
		.onAppear(perform: applyWindowStyle)
		.windowButtons(miniaturize: .hidden, zoom: .hidden)
	}
}

private extension ContentView {
	func applyWindowStyle() {
		DispatchQueue.main.async {
			guard let nsWindow = NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == windowID }) else {
				Logger.aboutWindow.warning("About window was missing.  The window style cannot be applied.")
				return
			}

			nsWindow.isMovableByWindowBackground = true
		}
	}
}
