/// Options pertaining to ``About``.
///
/// ## Usage
/// ```swift
/// About {
///     /* ... */
/// }
/// .aboutWindowOptions(/* ... */)
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``showDefaultInformation`` | Show the default app information view at the top of the window.  This contains the app icon, name, and version. |
/// | ``showDefaultCopyright`` | Show the default app copyright view at the bottom of the window..  The string used is the one found in the app's Info.plist. |
@frozen
public struct AboutWindowOptions: OptionSet {
	public let rawValue: UInt64

	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension AboutWindowOptions: Sendable { }

// MARK: - Equatable

extension AboutWindowOptions: Equatable { }

// MARK: - Hashable

extension AboutWindowOptions: Hashable { }

// MARK: - Constants

public extension AboutWindowOptions {
	/// Show the default app information view at the top of the window..
	///
	/// This includes the app icon, name, and version.
	static let showDefaultInformation: Self = Self(rawValue: 1 << 0)

	/// Show the default app copyright view at the bottom of the window.
	///
	/// The string used is the one found in the app's Info.plist.
	static let showDefaultCopyright: Self = Self(rawValue: 1 << 1)

	/// The default options used.
	static let `default`: Self = .all

	/// No options.
	static let none: Self = []

	/// All available options.
	static let all: Self = [.showDefaultInformation, .showDefaultCopyright]
}
