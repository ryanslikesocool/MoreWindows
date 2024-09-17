import SwiftUI

public struct DefaultAppInfoSectionStyle: AppInfoSectionStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		VStack {
			configuration.icon
				.frame(width: 128)

			configuration.name
				.font(.title.bold())

			configuration.version
		}
	}
}

// MARK: - Convenience

public extension AppInfoSectionStyle where
	Self == DefaultAppInfoSectionStyle
{
	@inlinable
	static var `default`: Self {
		Self()
	}
}
