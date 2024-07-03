import _MoreWindowsCommon
import SwiftUI

/// An "About" window, accessible from the app's main menu.
///
/// By default, the About window includes the app icon, name, version, and copyright.
/// Additional sections may be provided by using the view builder.
///
/// ## Usage
/// ```swift
/// struct MyApp: App {
///     var body: some Scene {
///         About {
///             MyCustomViewA()
///             MyCustomViewB()
///         }
///     }
/// }
/// ```
///
/// ## Supported Options
/// - ``AboutWindowOptions``
/// - ``AppIconOptions``
/// - ``AppVersionOptions``
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
		}
		.windowID(WindowType.about.id)
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
