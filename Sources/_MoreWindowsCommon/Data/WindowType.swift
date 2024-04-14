import AppKit

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
	public var id: String {
		switch self {
			case .launcher: "MoreWindows.Launcher"
			case .about: "MoreWindows.About"
		}
	}
}

// MARK: -

public extension WindowType {
	/// The window's title.  This is automatically populated with the app's name.
	var title: String {
		switch self {
			case .launcher: "\(AppInformation.appName) Launcher"
			case .about: "About \(AppInformation.appName)"
		}
	}

	/// The `NSWindow` instance of a window type.
	var instance: NSWindow? {
		NSApplication.shared.windows.first(where: { $0.identifier?.rawValue == id })
	}
}
