import _MoreWindowsCommon
import OSLog

extension Logger {
	static let launcherWindow: Logger = Logger(subsystem: Logger.moreWindowsSubsystem, category: "LauncherWindow")
}
