import SwiftUI

public extension OpenWindowAction {
	/// Opens a window that’s associated with the specified identifier.
	///
	/// Don’t call this method directly. SwiftUI calls it when you call the ``SwiftUI/EnvironmentValues/openWindow`` action with an identifier:
	/// ```swift
	/// openWindow(id: "message")
	/// ```
	/// For information about how Swift uses the `callAsFunction()` method to simplify call site syntax, see [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Methods-with-Special-Names)  in *The Swift Programming Language*.
	/// - Parameter id: The identifier of the scene to present.
	@MainActor @preconcurrency
	func callAsFunction(id: borrowing WindowID) {
		callAsFunction(id: id.rawValue)
	}

	/// Opens a window that’s associated with the specified identifier.
	///
	/// Don’t call this method directly. SwiftUI calls it when you call the ``SwiftUI/EnvironmentValues/openWindow`` action with an identifier:
	/// ```swift
	/// openWindow(id: "message")
	/// ```
	/// For information about how Swift uses the `callAsFunction()` method to simplify call site syntax, see [Methods with Special Names](https://docs.swift.org/swift-book/documentation/the-swift-programming-language/declarations/#Methods-with-Special-Names)  in *The Swift Programming Language*.
	/// - Parameter id: The identifier of the scene to present.
	@MainActor @preconcurrency
	func callAsFunction<D>(id: borrowing WindowID, value: D) where
		D: Codable & Hashable
	{
		callAsFunction(id: id.rawValue, value: value)
	}
}
