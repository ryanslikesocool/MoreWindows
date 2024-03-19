#if canImport(AppKit)
import LoveCore
import MoreViews
import OSLog
import SwiftUI

public struct About<Content: View>: Scene {
	@Environment(\.openWindow) var openWindow

	private let content: () -> Content

	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public init() where Content == EmptyView {
		self.init(content: EmptyView.init)
	}

	public var body: some Scene {
		SwiftUI.Window("About", id: aboutWindowID) {
			ContentView(content: content)
				.onAppear(perform: applyWindowStyle)
		}
		.defaultPosition(.center)
		.windowStyle(.hiddenTitleBar)
		.windowResizability(.contentSize)
		.commands {
			CommandGroup(replacing: .appInfo) {
				Button("About \(AppInformation.appName)") {
					openWindow(id: aboutWindowID)
				}
			}
			CommandGroup(replacing: .singleWindowList) { }
		}
	}
}

private extension About {
	func applyWindowStyle() {
		DispatchQueue.main.async {
			guard let aboutWindow else {
				Logger.aboutWindow.warning("About window was missing.  The window style cannot be applied.")
				return
			}

			aboutWindow.isMovableByWindowBackground = true

			aboutWindow.standardWindowButton(.miniaturizeButton)?.isHidden = true
			aboutWindow.standardWindowButton(.zoomButton)?.isHidden = true
		}
	}
}
#endif
