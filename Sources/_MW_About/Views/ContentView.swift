import _MW_Common
import OSLog
import SwiftUI

struct ContentView<Content: View>: View {
	@Environment(\.aboutWindowLayout) private var aboutWindowLayout

	private let content: () -> Content

	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public var body: some View {
		Group {
			switch aboutWindowLayout {
				case .custom: content()
				case let .vertical(spacing): VerticalContentView(spacing: spacing, content: content)
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
