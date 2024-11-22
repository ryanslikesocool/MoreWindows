import SwiftUI

struct AnyAppInfoSectionStyle: AppInfoSectionStyle {
	private var _makeBody: @MainActor (Configuration) -> AnyView

	init<S>(_ style: S) where
		S: AppInfoSectionStyle
	{
		_makeBody = { @MainActor configuration in
			AnyView(style.makeBody(configuration: configuration))
		}
	}

	public func makeBody(configuration: Configuration) -> some View {
		_makeBody(configuration)
	}
}
