#if canImport(AppKit)
public struct AppIconOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension AppIconOptions {
	/// Show a faint glow behind the app icon when the app is in dark mode.
	static let glowInTheDark: Self = Self(rawValue: 1 << 0)

	/// Scale the icon when the user hovers over it.
	static let hoverScale: Self = Self(rawValue: 1 << 1)

	/// Rotate the icon when the user hovers over it.
	static let hoverRotation: Self = Self(rawValue: 1 << 2)

	/// Apply a shadow behind the icon when the user hovers over it.
	static let hoverShadow: Self = Self(rawValue: 1 << 3)

	/// Options relating to a hover interaction.
	static let hoverInteraction: Self = [.hoverScale, .hoverRotation, .hoverShadow]

	static let `default`: Self = [.glowInTheDark]

	static let none: Self = []
	static let all: Self = [.glowInTheDark, .hoverScale, .hoverRotation, .hoverShadow]
}

// MARK: -

extension AppIconOptions {
	var hasHoverInteraction: Bool { !intersection(Self.hoverInteraction).isEmpty }
}
#endif
