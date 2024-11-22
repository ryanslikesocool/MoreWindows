import _MW_Common

public extension WindowID {
	/// The ID for an "About" window, accessible from the app's main menu.
	///
	/// This value may be overriden to match the app's naming scheme.
	/// - SeeAlso:
	///   - ``About``
	nonisolated(unsafe) static var about: Self = "MoreWindows.About"
}
