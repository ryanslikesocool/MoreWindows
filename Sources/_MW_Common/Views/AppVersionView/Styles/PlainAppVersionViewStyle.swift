import SwiftUI

public struct PlainAppVersionViewStyle: AppVersionViewStyle {
	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Text(verbatim: configuration.versionString)
	}
}

// MARK: - Convenience

public extension AppVersionViewStyle where
	Self == PlainAppVersionViewStyle
{
	static var plain: Self {
		Self()
	}
}
