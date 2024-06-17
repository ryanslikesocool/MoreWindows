import SwiftUI

struct _AnyAppInfoSectionStyle: AppInfoSectionStyle {
	private var _makeBody: (Configuration) -> AnyView

	init(style: some AppInfoSectionStyle) {
		_makeBody = { configuration in
			AnyView(style.makeBody(configuration: configuration))
		}
	}

	public func makeBody(configuration: Configuration) -> some View {
		_makeBody(configuration)
	}
}
