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

public extension AppInfoSectionStyle where Self == DefaultAppInfoSectionStyle {
	static var `default`: Self { Self() }
}
