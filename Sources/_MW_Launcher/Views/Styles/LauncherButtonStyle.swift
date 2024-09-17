import _MW_Common
import SwiftUI

struct LauncherButtonStyle: PrimitiveButtonStyle {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.windowID) private var windowID
	@Environment(\.launcherActionOptions) private var launcherActionOptions

	public init() { }

	public func makeBody(configuration: Configuration) -> some View {
		Button(
			role: configuration.role,
			action: { buttonAction(configuration) },
			label: { makeLabel(configuration: configuration) }
		)
		.buttonStyle(.plain)
	}
}

// MARK: - Supporting Views

private extension LauncherButtonStyle {
	func makeLabel(configuration: Configuration) -> some View {
		HStack(spacing: 0) {
			configuration.label
				.labelStyle(.launcher)
			Spacer(minLength: 0)
		}
		.padding(8)
		.frame(maxWidth: .infinity, maxHeight: .infinity)
		.background(.quaternary, in: RoundedRectangle(cornerRadius: 8))
	}
}

// MARK: - Functions

private extension LauncherButtonStyle {
	func buttonAction(_ configuration: Configuration) {
		configuration.trigger()
		
		if launcherActionOptions.contains(.closeWindow) {
			closeWindow()
		}
	}

	func closeWindow() {
		guard let windowID else {
			preconditionFailure("""
			The window ID environment value was missing.
			This should not happen.  Please file a bug report.
			""")
		}

		dismissWindow(id: windowID)
	}
}

// MARK: - Convenience

extension PrimitiveButtonStyle where
	Self == LauncherButtonStyle
{
	static var launcher: Self {
		Self()
	}
}
