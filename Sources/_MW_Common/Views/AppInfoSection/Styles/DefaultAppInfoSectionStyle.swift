import SwiftUI

/// ## Topics
/// - ``AppInfoSectionStyle/default``
public struct DefaultAppInfoSectionStyle: AppInfoSectionStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		VStack {
			configuration.icon
				.frame(width: Self.iconWidth)

			configuration.name
				.font(Self.nameFont)

			configuration.version
		}
	}
}

// MARK: - Constants

private extension DefaultAppInfoSectionStyle {
	static let iconWidth: CGFloat? = 128

	static var nameFont: Font { .title.weight(nameFontWeight) }
	static var nameFontWeight: Font.Weight { .bold }
}

// MARK: - Convenience

public extension AppInfoSectionStyle where
	Self == DefaultAppInfoSectionStyle
{
	static var `default`: Self {
		Self()
	}
}
