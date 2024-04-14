/// Options pertaining to the launcher action area.
///
/// ## Usage
/// ```swift
/// Launcher {
/// 	Button("Confetti", systemImage: "sparkles") {
/// 		/* ... */
/// 	}
/// 	.launcherActionOptions(/* ... */) // <-- here!
/// }
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``closeWindow`` | Close the launcher window once the button action is executed. |
///
/// - SeeAlso:
///   - ``Launcher``
public struct LauncherActionOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension LauncherActionOptions {
	/// Close the launcher window once the button action is executed.
	static let closeWindow: Self = Self(rawValue: 1 << 0)

	/// The default options used.
	static let `default`: Self = .all

	/// No options.
	static let none: Self = []

	/// All available options.
	static let all: Self = [.closeWindow]
}
