import AppKit

@frozen
public struct WindowID: RawRepresentable {
	public let rawValue: String

	/// The ``NSWindow`` with this ID, if one could be found.
	@MainActor
	public var window: NSWindow? {
		NSApplication.shared.windows.first { (window: NSWindow) -> Bool in
			window.identifier?.rawValue == rawValue
		}
	}

	public init(rawValue: String) {
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
