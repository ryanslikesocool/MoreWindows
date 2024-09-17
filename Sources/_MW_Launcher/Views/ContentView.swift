import _MW_Common
import SwiftUI

struct ContentView<ActionArea: View>: View {
	@Environment(\.launcherWindowOptions) private var launcherWindowOptions
	@Environment(\.launcherWindowSize) private var launcherWindowSize

	let actionArea: () -> ActionArea

	var body: some View {
		HStack(spacing: 0) {
			leftSide

			if launcherWindowOptions.contains(.showRecentDocuments) {
				Divider()
				RecentItemList()
			}
		}
		.ignoresSafeArea(.all)
		.frame(width: windowSize.width, height: windowSize.height)
		.onWindowAppear(perform: applyWindowStyle)
		.windowButtons(close: .hidden, miniaturize: .hidden, zoom: .hidden)
	}
}

// MARK: - Supporting Views

private extension ContentView {
	@ViewBuilder
	private var leftSide: some View {
		VStack(spacing: 32) {
			Spacer(minLength: 0)

			AppInfoSection()
				.appInfoSectionStyle(.welcome)

			VStack {
				actionArea()
			}
			.fixedSize()
			.buttonStyle(.launcher)

			Spacer(minLength: 0)
		}
		.frame(width: launcherWindowSize.welcomeAreaWidth)
		.overlay(alignment: .topLeading, content: makeCloseButton)
	}

	private func makeCloseButton() -> some View {
		CloseLauncherButton()
			.padding(12)
	}
}

// MARK: - Functions

private extension ContentView {
	func applyWindowStyle(nsWindow: NSWindow) {
		nsWindow.isMovableByWindowBackground = true
	}
}

// MARK: - Properties

private extension ContentView {
	var windowSize: CGSize {
		let recentDocumentsWidth: CGFloat = if launcherWindowOptions.contains(.showRecentDocuments) {
			launcherWindowSize.recentItemsAreaWidth
		} else {
			0
		}

		let windowWidth: CGFloat = launcherWindowSize.welcomeAreaWidth + recentDocumentsWidth

		return CGSize(
			width: windowWidth,
			height: launcherWindowSize.height
		)
	}
}