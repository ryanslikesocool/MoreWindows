#if canImport(AppKit)
public struct LauncherActionOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension LauncherActionOptions {
	/// Close the launcher window upon selecting an item.
	static let closeWindow: Self = Self(rawValue: 1 << 0)

	static let `default`: Self = .all

	static let none: Self = []
	static let all: Self = [.closeWindow]
}
#endif
