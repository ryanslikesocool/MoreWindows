#if canImport(AppKit)
import MoreWindowsCommon
import OSLog

extension Logger {
	static let launcherWindow: Logger = Logger(subsystem: Logger.moreWindowsSubsystem, category: "LauncherWindow")
}
#endif
