public struct AppVersionOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension AppVersionOptions {
	/// Allow the user to copy the version number by clicking on it.
	static let copyable: Self = Self(rawValue: 1 << 0)

	/// Show the app build number alongside the semantic version.
	static let showBuildNumber: Self = Self(rawValue: 1 << 1)

	static let `default`: Self = .all

	static let all: Self = [.copyable, .showBuildNumber]
}
