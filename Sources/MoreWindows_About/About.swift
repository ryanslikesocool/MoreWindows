import _MoreWindowsCommon
import OSLog
import SwiftUI

/// An "About" window, accessible from the app's main menu.
///
/// By default, the About window includes the app icon, name, version, and copyright.
/// Additional sections may be provided by using the view builder.
///
/// ## Usage
/// ```swift
/// struct MyApp: App {
/// 	var body: some Scene {
/// 		About { // <-- here!
/// 			MyCustomViewA()
/// 			MyCustomViewB()
/// 		}
/// 	}
/// }
/// ```
///
/// ## Supported Options
/// - ``AboutWindowOptions``
/// - `_MoreWindowsCommon.AppIconOptions`
/// - `_MoreWindowsCommon.AppVersionOptions`
public struct About<Content: View>: Scene {
	@Environment(\.openWindow) var openWindow

	private let content: () -> Content

	/// Create an About window.
	/// - Parameter content: Additional sections to include in the window.
	public init(@ViewBuilder content: @escaping () -> Content) {
		self.content = content
	}

	public init() where Content == EmptyView {
		self.init(content: EmptyView.init)
	}

	public var body: some Scene {
		SwiftUI.Window(WindowType.about.title, id: WindowType.about.id) {
			ContentView(content: content)
				.onAppear(perform: applyWindowStyle)
		}
		.defaultPosition(.center)
		.windowStyle(.hiddenTitleBar)
		.windowResizability(.contentSize)
		.commands {
			CommandGroup(replacing: .appInfo) {
				Button("About \(AppInformation.appName)") {
					openWindow(id: WindowType.about.id)
				}
			}
		}
	}
}

private extension About {
	func applyWindowStyle() {
		DispatchQueue.main.async {
			guard let aboutWindow = WindowType.about.instance else {
				Logger.aboutWindow.warning("About window was missing.  The window style cannot be applied.")
				return
			}

			aboutWindow.isMovableByWindowBackground = true

			aboutWindow.standardWindowButton(.miniaturizeButton)?.isHidden = true
			aboutWindow.standardWindowButton(.zoomButton)?.isHidden = true
		}
	}
}
