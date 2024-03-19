#if canImport(AppKit)
public extension AboutWindow {
	struct AcknowledgementsOptions: OptionSet {
		public let rawValue: UInt8

		public init(rawValue: UInt8) {
			self.rawValue = rawValue
		}

		public static let sortItems: Self = Self(rawValue: 1 << 0)

		public static let `default`: Self = [.sortItems]
		public static let none: Self = Self(rawValue: 0)
		public static let all: Self = [.sortItems]
	}
}
#endif
