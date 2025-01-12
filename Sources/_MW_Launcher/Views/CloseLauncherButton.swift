import _MW_Common
import SwiftUI

struct CloseLauncherButton: View {
	@Environment(\.dismissWindow) private var dismissWindow
	@Environment(\.windowID) private var windowID

	public init() { }

	public var body: some View {
		Button(action: buttonAction, label: makeLabel)
			.buttonStyle(Self.buttonStyle)
	}
}

// MARK: - Constants

private extension CloseLauncherButton {
	static var buttonStyle: some PrimitiveButtonStyle { .plain }

	nonisolated static let systemImageName: String = "xmark"
	nonisolated static let font: Font = .system(size: 6, weight: .bold)
	nonisolated static var foregroundStyle: some ShapeStyle { .background }
	nonisolated static let width: CGFloat? = 12
	nonisolated static var height: CGFloat? { width }
	nonisolated static var backgroundStyle: some ShapeStyle { .tertiary }
	nonisolated static let backgroundShape: some InsettableShape = .circle
}

// MARK: - Supporting Views

private extension CloseLauncherButton {
	nonisolated func makeLabel() -> some View {
		Image(systemName: Self.systemImageName)
			.font(Self.font)
			.foregroundStyle(Self.foregroundStyle)
			.frame(width: Self.width, height: Self.height)
			.background(Self.backgroundStyle, in: Self.backgroundShape)
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
