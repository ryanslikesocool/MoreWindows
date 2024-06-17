import SwiftUI

public struct WindowReference: RawRepresentable, Identifiable {
	public let rawValue: String

	public var id: RawValue { rawValue }

	public var value: NSWindow? {
		NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == rawValue })
	}

	public init(rawValue: String) {
		self.rawValue = rawValue
	}
}

// MARK: -

private enum WindowReferenceKey: EnvironmentKey {
	static var defaultValue: WindowReference? = nil
}

public extension EnvironmentValues {
	/// An object containing information about the current `Window`.
	/// - Remark: This value is only available if ``Scene/windowID(_:)`` was used on the containing scene.
	fileprivate(set) var windowReference: WindowReference? {
		get { self[WindowReferenceKey.self] }
		set { self[WindowReferenceKey.self] = newValue }
	}
}

public extension Scene {
	/// Expose a `Window`'s ID to the environment.
	/// - Parameter id: The window's ID.
	func windowID(_ id: String) -> some Scene {
		environment(\.windowReference, WindowReference(rawValue: id))
	}
}
