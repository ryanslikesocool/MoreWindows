import _MoreWindowsCommon
import SwiftUI

struct LauncherButtonStyle: PrimitiveButtonStyle {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.launcherActionOptions) private var launcherActionOptions

	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Button(role: configuration.role, action: { buttonAction(configuration) }) {
			configuration.label
				.fontWeight(.semibold)
				.padding(8)
				.frame(maxWidth: .infinity, maxHeight: .infinity)
				.background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
		}
		.buttonStyle(.plain)
	}
}

private extension LauncherButtonStyle {
	func buttonAction(_ configuration: Configuration) {
		configuration.trigger()
		if launcherActionOptions.contains(.closeWindow) {
			dismissWindow(id: WindowType.launcher.id)
		}
	}
}

// MARK: -

extension PrimitiveButtonStyle where Self == LauncherButtonStyle {
	static var launcher: Self { Self() }
}
