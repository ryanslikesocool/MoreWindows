import OSLog

package extension Logger {
	init(category: String)  {
		self.init(subsystem: Self.moreWindowsSubsystem, category: category)
	}

	init(category: Any.Type) {
		self.init(category: String(describing: category))
	}
}

// MARK: - Constants

private extension Logger {
	/// The subsystem for the
	/// [MoreWindows](https://github.com/ryanslikesocool/MoreWindows)
	/// package.
	///
	/// This value should not be used outside of MoreWindows.
	static let moreWindowsSubsystem: String = "MoreWindows"
}
