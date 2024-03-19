#if canImport(AppKit)
public struct AboutAppOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension AboutAppOptions {
	/// Show the app version.
	static let showVersion: Self = Self(rawValue: 1 << 0)

	static let `default`: Self = .all

	static let none: Self = []
	static let all: Self = [.showVersion]
}
#endif
