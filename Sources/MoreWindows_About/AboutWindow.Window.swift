#if canImport(AppKit)
import LoveCore
import MoreViews
import SwiftUI

public extension AboutWindow {
	struct Window: Scene {
		@Environment(\.openWindow) var openWindow

		private let sections: [AboutWindow.Section]

		public init(sections: [AboutWindow.Section]) {
			self.sections = sections
		}

		public init(_ firstSection: AboutWindow.Section, _ otherSections: AboutWindow.Section...) {
			self.init(sections: [firstSection] + otherSections)
		}

		public var body: some Scene {
			SwiftUI.Window("About", id: AboutWindow.windowID) {
				content
					.fixedSize()
					.padding([.horizontal, .bottom], 26)
					.ignoresSafeArea()
					.background {
						VisualEffectView(material: .underWindowBackground, blendingMode: .behindWindow)
							.ignoresSafeArea()
							.padding(.top, -1)
					}
					.accessWindow(onAppear: applyWindowStyle)
			}
			.defaultPosition(.center)
			.windowStyle(.hiddenTitleBar)
			.windowResizability(.contentSize)
			.commands {
				CommandGroup(replacing: .appInfo) {
					Button("About \(AppInformation.appName)") {
						openWindow(id: AboutWindow.windowID)
					}
				}
				CommandGroup(replacing: .singleWindowList) { }
			}
		}

		@ViewBuilder private func divider(if condition: Bool = true) -> some View {
			if condition {
				Divider()
					.padding(.horizontal, -26)
			}
		}

		private var content: some View {
			VStack(spacing: 24) {
				ForEach(sections.indices, id: \.self) { index in
					VStack {
						sections[index].contentView()
					}

					divider(if: index < sections.count - 1)
				}
			}
		}

		private func applyWindowStyle(window: NSWindow) {
			window.isMovableByWindowBackground = true

			window.standardWindowButton(.miniaturizeButton)?.isHidden = true
			window.standardWindowButton(.zoomButton)?.isHidden = true
		}
	}
}
#endif
