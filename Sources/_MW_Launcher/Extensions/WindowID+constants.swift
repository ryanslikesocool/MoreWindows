import _MW_Common

public extension WindowID {
	/// The ID for a "Launcher" window that can be shown when an app launches.
	///
	/// This value may be overriden to match the app's naming scheme.
	/// 
	/// - SeeAlso:
	///   - ``Launcher``
	nonisolated(unsafe) static var launcher: Self = "MoreWindows.Launcher"
}
