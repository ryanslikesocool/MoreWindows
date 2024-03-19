#if canImport(AppKit)
public struct LauncherIconOptions: OptionSet {
	public let rawValue: UInt8

	public init(rawValue: UInt8) {
		self.rawValue = rawValue
	}
}

// MARK: - Constants

public extension LauncherIconOptions {
	static let glowInTheDark: Self = Self(rawValue: 1 << 0)
	static let hoverScale: Self = Self(rawValue: 1 << 1)
	static let hoverRotation: Self = Self(rawValue: 1 << 2)
	static let hoverShadow: Self = Self(rawValue: 1 << 3)

	static let hoverInteration: Self = [.hoverScale, .hoverRotation, .hoverShadow]
	static let `default`: Self = [.glowInTheDark]

	static let none: Self = []
	static let all: Self = [.glowInTheDark, .hoverScale, .hoverRotation, .hoverShadow]
}

// MARK: -

extension LauncherIconOptions {
	var hasHoverInteraction: Bool { !intersection(Self.hoverInteration).isEmpty }
}
#endif
