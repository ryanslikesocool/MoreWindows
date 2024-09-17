import _MW_Common
import OSLog
import SwiftUI

struct ContentView<Content: View>: View {
	@Environment(\.aboutWindowLayout) private var aboutWindowLayout

	let content: () -> Content

	var body: some View {
		Group {
			switch aboutWindowLayout {
				case .custom: content()
				case .vertical: VerticalContentView(content: content)
			}
		}
		.onWindowAppear(perform: applyWindowStyle)
		.windowButtons(miniaturize: .hidden, zoom: .hidden)
	}
}

// MARK: - Functions

private extension ContentView {
	func applyWindowStyle(nsWindow: NSWindow) {
		nsWindow.isMovableByWindowBackground = true
	}
}