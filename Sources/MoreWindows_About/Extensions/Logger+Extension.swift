#if canImport(AppKit)
import OSLog

extension Logger {
	static let aboutWindow: Logger = Logger(subsystem: Self.moreWindowsSubsystem, category: "AboutWindow")
}
#endif
