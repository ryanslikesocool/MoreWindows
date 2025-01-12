#if canImport(AppKit)
import AppKit
#endif

@frozen
public struct WindowID: RawRepresentable {
	public typealias RawValue = String

	public let rawValue: RawValue

	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension WindowID: Sendable { }

// MARK: - Equatable

extension WindowID: Equatable { }

// MARK: - Hashable

extension WindowID: Hashable { }

// MARK: - Identifiable

extension WindowID: Identifiable {
	public var id: RawValue { rawValue }
}

// MARK: - Codable

extension WindowID: Codable {
	public init(from decoder: any Decoder) throws {
		let container = try decoder.singleValueContainer()
		try self.init(rawValue: container.decode(RawValue.self))
	}

	public func encode(to encoder: any Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}

// MARK: - ExpressibleByStringLiteral

extension WindowID: ExpressibleByStringLiteral {
	public init(stringLiteral value: StringLiteralType) {
		self.init(rawValue: value)
	}
}

// MARK: - Convenience

public extension WindowID {
	/// - Parameter rawValue:
	init(_ rawValue: RawValue) {
		self.init(rawValue: rawValue)
	}

	/// - Parameter rawValue:
	init<S>(rawValue: S) where
		S: StringProtocol
	{
		self.init(rawValue: RawValue(rawValue))
	}

	/// - Parameter rawValue:
	init<S>(_ rawValue: S) where
		S: StringProtocol
	{
		self.init(rawValue: rawValue)
	}
}

// MARK: - Constants

public extension WindowID {
	/// - Remark: Using this property may result in SwiftUI printing a warning to the console.
	@available(macOS 11, *)
	static let settings: Self = Self("com_apple_SwiftUI_Settings_window")
}

// MARK: -

public extension WindowID {
#if canImport(AppKit)
	/// The first
	/// [`NSWindow`]( https://developer.apple.com/documentation/appkit/nswindow )
	/// with this ID, if one could be found.
	@MainActor
	var window: NSWindow? {
		NSApplication.shared.windows.first { (window: NSWindow) -> Bool in
			window.identifier?.rawValue == rawValue
		}
	}

	/// All
	/// [`NSWindow`]( https://developer.apple.com/documentation/appkit/nswindow )s
	/// with this ID.
	@MainActor
	var windows: some Sequence<NSWindow> {
		NSApplication.shared.windows.filter { (window: NSWindow) -> Bool in
			window.identifier?.rawValue == rawValue
		}
	}
#endif
}
