#if canImport(AppKit)
public extension AboutWindow.AppInformationSection {
	struct Options: OptionSet {
		public let rawValue: UInt8

		public init(rawValue: UInt8) {
			self.rawValue = rawValue
		}

		public static let showVersion: Self = Self(rawValue: 1 << 0)

		public static let none: Self = Self(rawValue: 0)
		public static let `default`: Self = [.showVersion]
		public static let all: Self = [.showVersion]
	}
}
#endif
