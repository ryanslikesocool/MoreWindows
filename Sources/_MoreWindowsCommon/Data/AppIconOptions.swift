/// Options pertaining to ``AppIconView``.
///
/// Any scenes or views that contain ``AppIconView`` support this environment variable.
/// ## Usage
/// ```swift
/// Launcher {
///     /* ... */
/// }
/// .appIconOptions(/* ... */) // <-- here!
/// ```
///
/// | Option | Description |
/// | - | - |
/// | ``glowInTheDark`` | Show a faint glow behind the app icon when the app is in dark mode. |
/// | ``hoverScale`` | Scale the icon with a hover interaction. |
/// | ``hoverRotation`` | Slightly tilt the icon with a hover interaction. |
/// | ``hoverShadow`` | Apply a shadow behind the icon with a hover interaction. |
///
/// Combine `.hover_____` options to create a sense of depth.
///
/// - SeeAlso:
///   - ``AppIconView``
public struct AppIconOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Sendable

extension AppIconOptions: Sendable { }

// MARK: - Equatable

extension AppIconOptions: Equatable { }

// MARK: - Hashable

extension AppIconOptions: Hashable { }

// MARK: - Constants

public extension AppIconOptions {
	/// Show a faint glow behind the app icon when the app is in dark mode.
	static let glowInTheDark: Self = Self(rawValue: 1 << 0)

	/// Scale the icon with a hover interaction.
	static let hoverScale: Self = Self(rawValue: 1 << 1)

	/// Rotate the icon with a hover interaction.
	static let hoverRotation: Self = Self(rawValue: 1 << 2)

	/// Apply a shadow behind the icon with a hover interaction.
	static let hoverShadow: Self = Self(rawValue: 1 << 3)

	/// Options relating to a hover interaction.
	static let hoverInteraction: Self = [.hoverScale, .hoverRotation, .hoverShadow]

	/// The default options used.
	static let `default`: Self = [.glowInTheDark]

	/// No options.
	static let none: Self = []

	/// All available options.
	static let all: Self = [.glowInTheDark, .hoverScale, .hoverRotation, .hoverShadow]
}

// MARK: -

extension AppIconOptions {
	/// Does the current option set contain any hover-related options?
	var hasHoverInteraction: Bool { !intersection(Self.hoverInteraction).isEmpty }
}
