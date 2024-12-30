/// Options pertaining to the launcher action area.
///
/// ## Usage
/// 
/// ```swift
/// Launcher {
///     Button("Confetti", systemImage: "sparkles") {
///         /* ... */
///     }
///     .launcherActionOptions(/* ... */)
/// }
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``closeWindow`` | Close the launcher window once the button action is executed. |
///
/// - SeeAlso:
///   - ``Launcher``
///   - ``SwiftUI/View/launcherActionOptions(_:)``
@frozen
public struct LauncherActionOptions: OptionSet {
	public let rawValue: UInt64

	public init(rawValue: RawValue) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension LauncherActionOptions: Sendable { }

// MARK: - Equatable

extension LauncherActionOptions: Equatable { }

// MARK: - Hashable

extension LauncherActionOptions: Hashable { }

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
