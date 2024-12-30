import SwiftUI

public extension Window {
	/// Creates a window with a title and an identifier.
	///
	/// The window displays the view that you specify.
	///
	/// - Important: The system ignores any text styling that you apply to the ``SwiftUI/Text`` view `title`, like bold or italics.
	/// However, you can use the formatting controls that the view offers, like for localization, dates, and numerical representations.
	///
	/// - Parameters:
	///   - title: The ``SwiftUI/Text`` view to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: The view content to display in the window.
	init(
		_ title: Text,
		id: borrowing WindowID,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.init(title, id: id.rawValue, content: content)
	}

	/// Creates a window with a title string and an identifier.
	///
	/// The window displays the view that you specify.
	/// - Parameters:
	///   - title: A string to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: The view content to display in the window.
	init<S>(
		_ title: S,
		id: borrowing WindowID,
		@ViewBuilder content: @escaping () -> Content
	) where
		S: StringProtocol
	{
		self.init(title, id: id.rawValue, content: content)
	}

	/// Creates a window with a title string and an identifier.
	///
	/// The window displays the view that you specify.
	/// - Parameters:
	///   - titleKey: A localized string key to use for the window’s title in system menus and in the window’s title bar. Provide a title that describes the purpose of the window.
	///   - id: A unique ``WindowID`` that you can use to open the window.
	///   - content: The view content to display in the window.
	init(
		_ titleKey: LocalizedStringKey,
		id: borrowing WindowID,
		@ViewBuilder content: @escaping () -> Content
	) {
		self.init(titleKey, id: id.rawValue, content: content)
	}
}
