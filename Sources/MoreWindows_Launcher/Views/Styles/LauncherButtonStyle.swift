#if canImport(AppKit)
import SwiftUI
import MoreViews

struct LauncherButtonStyle: PrimitiveButtonStyle {
	@Environment(\.dismissLauncher) private var dismissLauncher
	@Environment(\.launcherActionOptions) private var launcherActionOptions

	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Button(role: configuration.role, action: { buttonAction(configuration) }) {
			configuration.label
				.fontWeight(.semibold)
				.padding(8)
				.expand()
				.background(.foreground.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
		}
		.buttonStyle(.plain)
	}
}

private extension LauncherButtonStyle {
	func buttonAction(_ configuration: Configuration) {
		configuration.trigger()
		if launcherActionOptions.contains(.closeWindow) {
			dismissLauncher()
		}
	}
}

// MARK: -

extension PrimitiveButtonStyle where Self == LauncherButtonStyle {
	static var launcher: Self { Self() }
}
#endif
