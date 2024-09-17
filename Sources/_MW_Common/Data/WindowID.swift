import AppKit

@frozen
public struct WindowID: RawRepresentable {
	public let rawValue: String

	/// The ``NSWindow`` with this ID, if one could be found.
	public var window: NSWindow? {
		NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == rawValue })
	}

	public init(rawValue: String) {
		self.rawValue = rawValue
	}

	public init(rawValue: some StringProtocol) {
		self.init(rawValue: String(rawValue))
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