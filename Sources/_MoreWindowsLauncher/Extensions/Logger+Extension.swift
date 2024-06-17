import _MoreWindowsCommon
import OSLog

extension Logger {
	static let module: Logger = Logger(subsystem: Logger.moreWindowsSubsystem, category: "_MoreWindowsLauncher")
}
