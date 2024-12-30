import CoreGraphics

/// The layout style of an ``About`` window.
public enum AboutWindowLayout {
	/// Provide custom content for the about window.
	/// 
	/// - Remark: The developer must manually implement any options set with ``SwiftUI/Scene/aboutWindowOptions(_:)`` when using this layout.
	case custom

	/// Display the about window as a vertical stack, with app information at the top, copyright at the bottom, and custom content in the middle.
	case vertical(spacing: CGFloat?)
}

// MARK: - Sendable

extension AboutWindowLayout: Sendable { }

// MARK: - Equatable

extension AboutWindowLayout: Equatable { }

// MARK: - Hashable

extension AboutWindowLayout: Hashable { }

// MARK: - Convenience

public extension AboutWindowLayout {
	/// Display the about window as a vertical stack, with app information at the top, copyright at the bottom, and custom content in the middle.
	static let vertical: Self = .vertical(spacing: nil)
}
