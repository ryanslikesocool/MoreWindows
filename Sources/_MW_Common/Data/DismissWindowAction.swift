import AppKit
import SwiftUI

/// An action that dismisses a window associated to a particular scene.
///
/// Use the ``SwiftUI/EnvironmentValues/dismissWindow`` environment value to get the instance of this structure for a given ``SwiftUI/Environment``. Then call the instance to dismiss a window. You call the instance directly because it defines a ``DismissWindowAction/callAsFunction(id:)-3djl0`` method that Swift calls when you call the instance.
///
/// For example, you can define a button that closes an auxiliary window:
/// ```swift
/// @main
/// struct MyApp: App {
///     var body: some Scene {
///         WindowGroup {
///             ContentView()
///         }
///         #if os(macOS)
///         Window("Auxiliary", id: "auxiliary") {
///             AuxiliaryContentView()
///         }
///         #endif
///     }
/// }
///
/// struct DismissWindowButton: View {
///     @Environment(\.dismissWindow) private var dismissWindow
///
///     var body: some View {
///         Button("Close Auxiliary Window") {
///             dismissWindow(id: "auxiliary")
///         }
///     }
/// }
/// ```
/// - Remark: An official implementation is provided by Apple starting with macOS 14.
@available(macOS, introduced: 13, obsoleted: 14, message: "An official implementation is provided by Apple starting with macOS 14.")
@MainActor
public struct DismissWindowAction {
	init() { }

	/// Dismisses the window that’s associated with the specified identifier.
	///
	/// When the specified identifier represents a ``SwiftUI/WindowGroup``, all of the open windows in that group will be dismissed. For dismissing a single window associated to a WindowGroup scene, use `dismissWindow(value:)` or `dismissWindow(id:value:)`.
	///
	/// Don’t call this method directly. SwiftUI calls it when you call the ``SwiftUI/EnvironmentValues/dismissWindow`` action with an identifier:
	/// ```swift
	/// dismissWindow(id: "message")
	/// ```
	///
	/// For information about how Swift uses the `callAsFunction()` method to simplify call site syntax, see [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Methods-with-Special-Names) in *The Swift Programming Language*.
	/// - Parameter id: The identifier of the scene to dismiss.
	public func callAsFunction(id: WindowID) {
		callAsFunction(id: id.rawValue)
	}

	/// Dismisses the window that’s associated with the specified identifier.
	///
	/// When the specified identifier represents a ``SwiftUI/WindowGroup``, all of the open windows in that group will be dismissed. For dismissing a single window associated to a WindowGroup scene, use `dismissWindow(value:)` or `dismissWindow(id:value:)`.
	///
	/// Don’t call this method directly. SwiftUI calls it when you call the ``SwiftUI/EnvironmentValues/dismissWindow`` action with an identifier:
	/// ```swift
	/// dismissWindow(id: "message")
	/// ```
	///
	/// For information about how Swift uses the `callAsFunction()` method to simplify call site syntax, see [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Methods-with-Special-Names) in *The Swift Programming Language*.
	/// - Parameter id: The identifier of the scene to dismiss.
	public func callAsFunction(id: String) {
		NSApplication.shared.windows
			.filter { $0.identifier?.rawValue == id }
			.forEach { $0.close() }
	}
}

@available(macOS 14, *)
public extension SwiftUI.DismissWindowAction {
	/// Dismisses the window that’s associated with the specified identifier.
	///
	/// When the specified identifier represents a ``SwiftUI/WindowGroup``, all of the open windows in that group will be dismissed. For dismissing a single window associated to a WindowGroup scene, use `dismissWindow(value:)` or `dismissWindow(id:value:)`.
	///
	/// Don’t call this method directly. SwiftUI calls it when you call the ``SwiftUI/EnvironmentValues/dismissWindow`` action with an identifier:
	/// ```swift
	/// dismissWindow(id: "message")
	/// ```
	///
	/// For information about how Swift uses the `callAsFunction()` method to simplify call site syntax, see [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Methods-with-Special-Names) in *The Swift Programming Language*.
	/// - Parameter id: The identifier of the scene to dismiss.
	func callAsFunction(id: WindowID) {
		callAsFunction(id: id.rawValue)
	}
}
