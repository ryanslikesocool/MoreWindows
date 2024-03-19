#if canImport(AppKit)
import SwiftUI

public extension AboutWindow {
	struct Section {
		private let content: AnyView

		public init<Content: View>(@ViewBuilder content: () -> Content) {
			self.content = AnyView(content())
		}

		public func contentView() -> AnyView { content }
	}
}

// MARK: - Constants

public extension AboutWindow.Section {
	static func appInformation(
		options: AboutWindow.AppInformationSection.Options = .default) -> Self
	{
		Self { AboutWindow.AppInformationSection(options: options) }
	}

	static func acknowledgements(
		_ acknowledgements: [AboutWindow.Acknowledgement],
		options: AboutWindow.AcknowledgementsSection.Options = .default
	) -> Self {
		Self.acknowledgements(acknowledgements, options: options) { Text("Acknowledgements") }
	}

	static func acknowledgements<Label: View>(
		_ acknowledgements: [AboutWindow.Acknowledgement],
		options: AboutWindow.AcknowledgementsSection.Options = .default,
		@ViewBuilder label: @escaping () -> Label
	) -> Self {
		Self { AboutWindow.AcknowledgementsSection(acknowledgements, options: options, label: label) }
	}
}
#endif
