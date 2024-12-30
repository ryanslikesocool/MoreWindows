import _MW_Common
import OSLog
import SwiftUI

struct ContentView<Content>: View where
	Content: View
{
	@Environment(\.aboutWindowLayout) private var aboutWindowLayout

	private let content: () -> Content

	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public var body: some View {
		makePrimaryContent()
			.onWindowAppear(perform: applyWindowStyle)
			.windowButtons(miniaturize: .hidden, zoom: .hidden)
	}
}

// MARK: - Supporting Views

private extension ContentView {
	@ViewBuilder
	func makePrimaryContent() -> some View {
		switch aboutWindowLayout {
			case .custom: content()
			case let .vertical(spacing): VerticalContentView(spacing: spacing, content: content)
		}
	}
}

// MARK: - Functions

private extension ContentView {
	func applyWindowStyle(nsWindow: NSWindow) {
		nsWindow.isMovableByWindowBackground = true
	}
}
