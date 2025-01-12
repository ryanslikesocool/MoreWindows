import _MW_Common
import SwiftUI

public struct AboutWindowLink<Label>: View where
	Label: View
{
	@Environment(\.openWindow) var openWindow

	private let label: Label

	public init(
		@ViewBuilder label: () -> Label
	) {
		self.label = label()
	}

	public var body: some View {
		Button(action: buttonAction) {
			label
		}
	}
}

// MARK: - Functions

private extension AboutWindowLink {
	func buttonAction() {
		openWindow(id: WindowID.about)
	}
}

// MARK: - Convenience

public extension AboutWindowLink where
	Label == Text
{
	init() {
		self.init(label: Text.defaultAboutWindowText)
	}

	init<S>(
		_ title: S
	) where
		S: StringProtocol
	{
		self.init(label: { Text(title) })
	}

	init(
		_ titleKey: LocalizedStringKey
	) {
		self.init(label: { Text(titleKey) })
	}
}
