public struct AboutWindowOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension AboutWindowOptions {
	/// Show the app version.
	static let showVersion: Self = Self(rawValue: 1 << 0)

	/// Show the app copyright at the bottom of the window.
	///
	/// The string used is the one found in the app's Info.plist.
	static let showDefaultCopyright: Self = Self(rawValue: 1 << 1)

	static let `default`: Self = .all

	static let none: Self = []
	static let all: Self = [.showVersion, .showDefaultCopyright]
}
