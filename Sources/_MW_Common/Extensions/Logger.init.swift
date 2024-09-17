import OSLog

package extension Logger {
	init(category: String)  {
		self.init(subsystem: Self.subsystem, category: category)
	}
}

// MARK: - Constants

private extension Logger {
	static let subsystem: String = "MoreWindows"
}