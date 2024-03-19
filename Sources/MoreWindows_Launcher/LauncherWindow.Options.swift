#if canImport(AppKit)
import Foundation

@available(macOS 14, *)
public extension LauncherWindow {
	struct Options: OptionSet {
		public let rawValue: UInt8

		public init(rawValue: UInt8) {
			self.rawValue = rawValue
		}

		public static let icon = Options(rawValue: 1 << 0)
		public static let name = Options(rawValue: 1 << 1)
		public static let version = Options(rawValue: 1 << 2)
		public static let recentDocuments = Options(rawValue: 1 << 3)
		public static let searchRecentDocuments = Options(rawValue: 1 << 4)
		public static let menuItem = Options(rawValue: 1 << 5)

		public static let `default`: Options = .all

		public static let none: Options = []
		public static let all: Options = [.icon, .name, .version, .recentDocuments, .searchRecentDocuments, .menuItem]
	}
}
#endif
