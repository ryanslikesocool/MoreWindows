import SwiftUI

public extension WindowGroup {
	/// Creates a window group with an identifier.
	///
	/// The window group uses the given view as a template to form the content of each window in the group.
	///
	/// - Remark: This initializer automatically assigns the ``SwiftUICore/EnvironmentValues/windowID`` environment key.
	///
	/// - Parameters:
	///   - id: A ``WindowID`` that uniquely identifies the window group.
	///   Identifiers must be unique among the window groups in your app.
	///   - makeContent: A closure that creates the content for each instance of the group.
	nonisolated init<C>(
		id: WindowID,
		@ViewBuilder makeContent: @escaping () -> C
	) where
		C: View,
		Content == ModifiedContent<C, _WindowIDViewModifier>
	{
		self.init(id: id.rawValue) {
			makeContent()
				._windowID(id)
		}
	}

	/// Creates a window group with a text view title and an identifier.
	///
	/// The window group uses the specified content as a template to create each window in the group.
	/// The system uses the title to distinguish the window group in the user interface, such as in the name of commands associated with the group.
	///
	/// - Remark: This initializer automatically assigns the ``SwiftUICore/EnvironmentValues/windowID`` environment key.
	///
	/// - Important:
	/// The system ignores any text styling that you apply to the
	/// [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	/// view `title`, like bold or italics.
	/// However, you can use the formatting controls that the view offers, like for localization, dates, and numerical representations.
	///
	/// - Parameters:
	///   - title: The
	///   [`Text`]( https://developer.apple.com/documentation/swiftui/text )
	///   view to use for the group’s title.
	///   - id: A ``WindowID`` that uniquely identifies the window group.
	///   Identifiers must be unique among the window groups in your app.
	///   - makeContent: A closure that creates the content for each instance of the group.
	nonisolated init<C>(
		_ title: Text,
		id: WindowID,
		@ViewBuilder makeContent: @escaping () -> C
	) where
		C: View,
		Content == ModifiedContent<C, _WindowIDViewModifier>
	{
		self.init(title, id: id.rawValue) {
			makeContent()
				._windowID(id)
		}
	}

	/// Creates a window group with a title string and an identifier.
	///
	/// The window group uses the specified content as a template to create each window in the group.
	/// The system uses the title to distinguish the window group in the user interface, such as in the name of commands associated with the group.
	///
	/// - Remark: This initializer automatically assigns the ``SwiftUICore/EnvironmentValues/windowID`` environment key.
	///
	/// - Parameters:
	///   - title: The string to use for the title of the group.
	///   - id: A ``WindowID`` that uniquely identifies the window group.
	///   Identifiers must be unique among the window groups in your app.
	///   - makeContent: A closure that creates the content for each instance of the group.
	nonisolated init<S, C>(
		_ title: S,
		id: WindowID,
		@ViewBuilder makeContent: @escaping () -> C
	) where
		S: StringProtocol,
		C: View,
		Content == ModifiedContent<C, _WindowIDViewModifier>
	{
		self.init(title, id: id.rawValue) {
			makeContent()
				._windowID(id)
		}
	}

	/// Creates a window group with a localized title string and an identifier.
	///
	/// The window group uses the specified content as a template to create each window in the group.
	/// The system uses the title to distinguish the window group in the user interface, such as in the name of commands associated with the group.
	///
	/// - Remark: This initializer automatically assigns the ``SwiftUICore/EnvironmentValues/windowID`` environment key.
	///
	/// - Parameters:
	///   - titleKey: The title key to use for the title of the group.
	///   - id: A ``WindowID`` that uniquely identifies the window group.
	///   Identifiers must be unique among the window groups in your app.
	///   - makeContent: A closure that creates the content for each instance of the group.
	nonisolated init<C>(
		_ titleKey: LocalizedStringKey,
		id: WindowID,
		@ViewBuilder makeContent: @escaping () -> C
	) where
		C: View,
		Content == ModifiedContent<C, _WindowIDViewModifier>
	{
		self.init(titleKey, id: id.rawValue) {
			makeContent()
				._windowID(id)
		}
	}
}
