#if canImport(AppKit)
import AppKit
#endif

@frozen
public struct WindowID: RawRepresentable {
	public let rawValue: String

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
	init(rawValue: some StringProtocol) {
		self.init(rawValue: String(rawValue))
	}
}

// MARK: -

public extension WindowID {
#if canImport(AppKit)
	/// The first ``NSWindow`` with this ID, if one could be found.
	@MainActor
	var window: NSWindow? {
		NSApplication.shared.windows.first { (window: NSWindow) -> Bool in
			window.identifier?.rawValue == rawValue
		}
	}

	/// All ``NSWindow``s with this ID.
	@MainActor
	var windows: some Sequence<NSWindow> {
		NSApplication.shared.windows.filter { (window: NSWindow) -> Bool in
			window.identifier?.rawValue == rawValue
		}
	}
#endif
}
