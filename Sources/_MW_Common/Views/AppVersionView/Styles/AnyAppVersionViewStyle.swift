import SwiftUI

struct AnyAppVersionViewStyle: AppVersionViewStyle {
	private var _makeBody: (Configuration) -> AnyView

	init(_ style: some AppVersionViewStyle) {
		_makeBody = { configuration in
			AnyView(style.makeBody(configuration: configuration))
		}
	}

	public func makeBody(configuration: Configuration) -> some View {
		_makeBody(configuration)
	}
}
