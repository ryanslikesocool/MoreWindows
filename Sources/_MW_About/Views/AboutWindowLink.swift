import _MW_Common
import SwiftUI

public struct AboutWindowLink<Label>: View where
	Label: View
{
	public typealias LabelProvider = () -> Label

	@Environment(\.openWindow) var openWindow

	private let labelProvider: LabelProvider

	public init(
		@ViewBuilder label labelProvider: @escaping LabelProvider
	) {
		self.labelProvider = labelProvider
	}

	public var body: some View {
		Button(action: buttonAction, label: labelProvider)
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

	init<S>(_ title: S) where
		S: StringProtocol
	{
		self.init(label: { Text(title) })
	}

	init(_ titleKey: LocalizedStringKey) {
		self.init(label: { Text(titleKey) })
	}
}
