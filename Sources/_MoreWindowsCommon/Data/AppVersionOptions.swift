/// Options pertaining to ``AppVersionView``.
///
///Any scenes or views that contain ``AppVersionView`` support this environment value.
/// ## Usage
/// ```swift
/// About {
/// 	/* ... */
/// }
/// .appVersionOptions(/* ... */) // <-- here!
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``copyable`` | Allow the user to copy the version number to the clipboard by clicking on it. |
/// | ``showBuildNumber`` | Show the app build number alongside the semantic version.  This option also applies to the string produced by ``copyable``. |
///
/// - SeeAlso:
///   - ``AppVersionView``
public struct AppVersionOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension AppVersionOptions {
	/// Allow the user to copy the version number to the clipboard by clicking on it.
	static let copyable: Self = Self(rawValue: 1 << 0)

	/// Show the app build number alongside the semantic version.
	///
	/// This option also applies to the string produced by ``copyable``.
	static let showBuildNumber: Self = Self(rawValue: 1 << 1)

	/// The default options used.
	static let `default`: Self = .all

	/// All available options.
	static let all: Self = [.copyable, .showBuildNumber]
}
