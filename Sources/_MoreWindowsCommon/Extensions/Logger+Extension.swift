import OSLog

package extension Logger {
	static var moreWindowsSubsystem: String = "MoreWindows"
}

extension Logger {
	static let module: Logger = Logger(subsystem: Self.moreWindowsSubsystem, category: "_MoreWindowsCommon")
}
