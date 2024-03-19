#if canImport(AppKit)
import MoreViews
import SwiftUI

public extension SettingsWindow {
	struct Window<DetailContent: View, BackgroundNoise: View, Selection: Hashable>: Scene {
		@Environment(\.openWindow) var openWindow

		@State private var selection: Selection?

		private let panes: [SettingsWindow.SidebarItem<Selection>]
		private let detailContent: (Selection?) -> DetailContent
		private let backgroundNoise: ((Selection?) -> BackgroundNoise)?

		private let width: Double
		private let sidebarWidth: Double
		private let minHeight: Double

		public init(
			panes: [SettingsWindow.SidebarItem<Selection>],
			width: Double = SettingsWindow.defaultWidth,
			sidebarWidth: Double = SettingsWindow.defaultSidebarWidth,
			minHeight: Double = SettingsWindow.defaultMinHeight,
			@ViewBuilder detailContent: @escaping (Selection?) -> DetailContent,
			@ViewBuilder backgroundNoise: @escaping (Selection?) -> BackgroundNoise
		) {
			_selection = State(initialValue: panes.first?.id)
			self.panes = panes
			self.detailContent = detailContent
			self.backgroundNoise = backgroundNoise
			self.width = width
			self.sidebarWidth = sidebarWidth
			self.minHeight = minHeight
		}

		public var body: some Scene {
			SwiftUI.Window("Settings", id: SettingsWindow.windowID) {
				NavigationSplitView {
					List(panes, selection: $selection) { pane in
						NavigationLink(value: pane.id, label: pane.sidebarView)
					}
					.navigationSplitViewColumnWidth(sidebarWidth)
				} detail: {
					NavigationStack {
						detailContent(selection)
					}
					.formStyle(.grouped)
				}
				.frame(width: width)
				.frame(minHeight: minHeight)
				.background { backgroundNoise?(selection) }
				.navigationTitle("Settings")
			}
			.windowResizability(.contentSize)
			.defaultPosition(.center)
			.windowToolbarStyle(.unifiedCompact(showsTitle: true))
			.commands {
				CommandGroup(replacing: .appSettings) {
					Button("Settings...") {
						openWindow(id: SettingsWindow.windowID)
					}
					.keyboardShortcut(",")
				}
				CommandGroup(replacing: .singleWindowList) { }
			}
		}
	}
}

public extension SettingsWindow.Window {
	init(
		panes: [SettingsWindow.SidebarItem<Selection>],
		width: Double = SettingsWindow.defaultWidth,
		sidebarWidth: Double = SettingsWindow.defaultSidebarWidth,
		minHeight: Double = SettingsWindow.defaultMinHeight,
		@ViewBuilder detailContent: @escaping (Selection?) -> DetailContent
	) where BackgroundNoise == EmptyView {
		_selection = State(initialValue: panes.first?.id)
		self.panes = panes
		self.detailContent = detailContent
		backgroundNoise = nil
		self.width = width
		self.sidebarWidth = sidebarWidth
		self.minHeight = minHeight
	}
}
#endif
