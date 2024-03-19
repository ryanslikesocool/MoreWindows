#if canImport(AppKit)
import SwiftUI

@available(macOS 14, *)
struct LauncherButtonStyle: PrimitiveButtonStyle {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.launcherActionOptions) private var launcherActionOptions

	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Button(role: configuration.role, action: {
			configuration.trigger()
			if launcherActionOptions.contains(.closeWindow) {
				dismissWindow(id: LauncherWindow.windowID)
			}
		}, label: {
			configuration.label
				.fontWeight(.semibold)
				.padding(8)
				.expand()
				.background(.foreground.opacity(0.1), in: RoundedRectangle(cornerRadius: 8))
		})
		.buttonStyle(.plain)
	}
}

// MARK: -

@available(macOS 14, *)
extension PrimitiveButtonStyle where Self == LauncherButtonStyle {
	static var launcher: Self { Self() }
}
#endif
