import _MW_Common
import SwiftUI

/// An "About" window, accessible from the app's main menu.
///
/// By default, the About window includes the app icon, name, version, and copyright.
/// Additional sections may be provided by using the view builder.
///
/// ## Usage
///
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
public struct About<Content>: Scene where
	Content: View
{
	public typealias ContentProvider = () -> Content

	@Environment(\.openWindow) var openWindow

	private let title: Text
	private let id: WindowID
	private let content: ContentProvider

	/// Create an About window.
	///
	/// - Important: The system ignores any text styling that you apply to the ``SwiftUI/Text`` view `title`, like bold or italics. However, you can use the formatting controls that the view offers, like for localization, dates, and numerical representations.
	///
	/// - Parameters:
	///   - title: The ``SwiftUI/Text`` view to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: Additional sections to include in the window.
	public init(
		_ title: Text,
		id: WindowID = WindowID.about,
		@ViewBuilder content: @escaping ContentProvider
	) {
		self.title = title
		self.id = id
		self.content = content
	}

	public var body: some Scene {
		SwiftUI.Window(title, id: id) {
			ContentView(content: content)
		}
		.windowID(id)
		.defaultPosition(.center)
		.windowStyle(.hiddenTitleBar)
		.windowResizability(.contentSize)
		.commands {
			CommandGroup(replacing: .appInfo) {
				AboutWindowLink()
			}
		}
	}
}

// MARK: - Convenience

public extension About {
	/// Create an About window.
	init() where
		Content == EmptyView
	{
		self.init(content: EmptyView.init)
	}

	/// Create an About window.
	///
	/// - Parameters:
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: Additional sections to include in the window.
	init(
		id: WindowID = WindowID.about,
		@ViewBuilder content: @escaping ContentProvider
	) {
		self.init(Text.defaultAboutWindowText(), id: id, content: content)
	}

	/// Create an About window.
	///
	/// - Parameters:
	///   - title: A string to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: Additional sections to include in the window.
	init<S>(
		_ title: S,
		id: WindowID = WindowID.about,
		@ViewBuilder content: @escaping ContentProvider
	) where
		S: StringProtocol
	{
		self.init(Text(title), id: id, content: content)
	}

	/// Create an About window.
	/// 
	/// - Parameters:
	///   - titleKey: A localized string key to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: Additional sections to include in the window.
	init(
		_ titleKey: LocalizedStringKey,
		id: WindowID = WindowID.about,
		@ViewBuilder content: @escaping ContentProvider
	) {
		self.init(Text(titleKey), id: id, content: content)
	}
}
