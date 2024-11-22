import _MW_Common
import SwiftUI

struct CloseLauncherButton: View {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.windowID) private var windowID

	public init() { }

	public var body: some View {
		Button(action: buttonAction, label: makeLabel)
			.buttonStyle(.plain)
	}
}

// MARK: - Supporting Views

private extension CloseLauncherButton {
	nonisolated func makeLabel() -> some View {
		Image(systemName: "xmark")
			.font(.system(size: 6, weight: .bold))
			.foregroundStyle(.background)
			.frame(width: 12, height: 12)
			.background(.tertiary, in: Circle())
	}
}

// MARK: - Functions

private extension CloseLauncherButton {
	func buttonAction() {
		guard let windowID else {
			preconditionFailure("""
			The window ID environment value was missing.
			This should not happen.  Please file a bug report.
			""")
		}
		
		dismissWindow(id: windowID)
	}
}
