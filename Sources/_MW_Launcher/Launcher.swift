import _MW_Common
import SwiftUI

/// A "Launcher" window that can be shown when an app launches.
///
/// Primary actions can be provided by using the view builder.
///
/// ## Usage
///
/// ```swift
/// struct MyApp: App {
///     var body: some Scene {
///         Launcher {
///             Button("Create New Documnet", systemImage: "doc.badge.plus") { /* ... */ }
///             Button("Open Document", systemImage: "folder") { /* ... */ }
///             Button("Confetti", systemImage: "sparkles") { /* ... */ }
///         }
///     }
/// }
/// ```
///
/// ## Supported Options
/// - ``LauncherWindowOptions``
/// - ``LauncherActionOptions``
/// - ``RecentItemsOptions``
/// - ``AppIconOptions``
/// - ``AppVersionOptions``
///
/// - Remark: For the launcher to be the initial window when opening the app, it must be the first item in ``SwiftUI/App/body``.
public struct Launcher<ActionArea>: Scene where
	ActionArea: View
{
	@Environment(\.launcherWindowOptions) private var launcherWindowOptions
	@Environment(\.openWindow) private var openWindow

	private let title: Text
	private let id: WindowID
	private let actionArea: () -> ActionArea

	/// Create a launcher window.
	///
	/// - Important: The system ignores any text styling that you apply to the ``SwiftUI/Text`` view `title`, like bold or italics. However, you can use the formatting controls that the view offers, like for localization, dates, and numerical representations.
	/// 
	/// - Parameters:
	///   - title: The ``SwiftUI/Text`` view to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - actionArea: The primary action area.
	public init(
		_ title: Text,
		id: WindowID = WindowID.launcher,
		@ViewBuilder actionArea: @escaping () -> ActionArea
	) {
		self.title = title
		self.id = id
		self.actionArea = actionArea
	}

	public var body: some Scene {
		SwiftUI.Window(title, id: id) {
			ContentView(actionArea: actionArea)
		}
		.windowID(id)
		.defaultPosition(.center)
		.windowResizability(.contentSize)
		.windowStyle(.hiddenTitleBar)
		.commands {
			if launcherWindowOptions.contains(.addMenuItem) {
				CommandGroup(before: .windowList) {
					LauncherWindowLink()
				}
			}
		}
	}
}

// MARK: - Convenience

public extension Launcher {
	/// Create a launcher window.
	///
	/// - Parameters:
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - actionArea: The primary action area.
	init(
		id: WindowID = WindowID.launcher,
		@ViewBuilder actionArea: @escaping () -> ActionArea
	) {
		self.init(Text.defaultLauncherWindowText(), id: id, actionArea: actionArea)
	}

	/// Create a launcher window.
	///
	/// - Parameters:
	///   - title: A string to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - actionArea: The primary action area.
	init<S>(
		_ title: S,
		id: WindowID = WindowID.launcher,
		@ViewBuilder actionArea: @escaping () -> ActionArea
	) where
		S: StringProtocol
	{
		self.init(Text(title), id: id, actionArea: actionArea)
	}

	/// Create a launcher window.
	///
	/// - Parameters:
	///   - titleKey: A localized string key to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - actionArea: The primary action area.
	init(
		_ titleKey: LocalizedStringKey,
		id: WindowID = WindowID.launcher,
		@ViewBuilder actionArea: @escaping () -> ActionArea
	) {
		self.init(Text(titleKey), id: id, actionArea: actionArea)
	}
}
