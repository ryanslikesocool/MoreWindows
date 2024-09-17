import AppKit

/// IDs for `Scene`s defined by `MoreWindows`.
public enum WindowType {
	/// Refers to a "Launcher" window that can be shown when an app launches.
	/// - SeeAlso:
	///   - ``Launcher``
	case launcher

	/// Refers to an "About" window, accessible from the app's main menu.
	/// - SeeAlso:
	///   - ``About``
	case about
}

// MARK: - Sendable

extension WindowType: Sendable { }

// MARK: - Equatable

extension WindowType: Equatable { }

// MARK: - Hashable

extension WindowType: Hashable { }

// MARK: - Identifiable

extension WindowType: Identifiable {
	public var id: WindowID {
		switch self {
			case .launcher: "MoreWindows.Launcher"
			case .about: "MoreWindows.About"
		}
	}
}

// MARK: -

package extension WindowType {
	/// The window's title.  This is automatically populated with the app's name.
	var title: String {
		switch self {
			case .launcher: "\(NSApplication.shared.bundleName) Launcher"
			case .about: "About \(NSApplication.shared.bundleName)"
		}
	}
}